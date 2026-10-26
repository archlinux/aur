# Maintainer: Selene Bray-Hernandez <selebray1998@gmail.com>
# Maintainer: Aaron Liu
# Contributor: Zhirui Dai <daizhirui at hotmail dot com>

pkgname=libtorch-rocm
pkgver=2.12.0
pkgrel=3
pkgdesc="PyTorch but C++ as an isolated folder, with ROCm included"
arch=('x86_64')
url='https://docs.pytorch.org/cppdocs/installing.html'
license=('BSD-3-Clause')
# Bound tied to the pinned _rocm_ver: libtorch links against the ROCm runtime it
# was built with, and a mismatch shows up as an undefined HIP symbol at dlopen()
# (surfacing as a generic module-load failure in audacity-openvino).
depends=(pybind11 'rocm-core>=7.2')
makedepends=(python)
replaces=(libtorch-cxx11abi-rocm)
provides=("libtorch=${pkgver}")
conflicts=(libtorch)

# Pinned, not probed: sha256sums below are for this exact artifact, so the
# ROCm version must not vary per host.  Bump together with pkgver.
_rocm_ver=7.2

# Use a filename without URL encoding to avoid extraction issues
source=("libtorch-shared-with-deps-${pkgver}+rocm${_rocm_ver}.zip::https://download.pytorch.org/libtorch/rocm${_rocm_ver}/libtorch-shared-with-deps-${pkgver}%2Brocm${_rocm_ver}.zip"
	"https://github.com/pytorch/pytorch/raw/refs/tags/v${pkgver}/LICENSE")
# Upstream publishes no checksum sidecars for these zips (listing is browsable,
# but *.sha256 / SHA256SUMS return 403), so these are hashes of the artifacts we
# actually fetched. They are coupled: pkgver, _rocm_ver and both sums must move
# together, or the build fails the validity check by design.
# Upstream re-push under the same name => the sum stops matching for everyone:
# verify `curl -sIL <url> | grep -i content-length` against the archive size
# first, then bump pkgrel and update the sum.
sha256sums=('8c740f551d52f4318cdd3908890cfb22f280b40620feb2538432c2c75ab0db55'
            'bd018feef8825e88181c84eb7e3aa4eafb8f08a20d9fd6ef948569610c4a3e43')
options=('!debug' '!strip' '!libtool' '!staticlibs' '!zipman')

pkgver() {
    # Read the version from the extracted pre-built package instead of querying
    # api.github.com. The old scrape was anonymous (60 req/h rate limit) and
    # returned an empty string on 403, aborting the build with
    # "pkgver is not allowed to be empty". It also reported whatever release
    # was newest, not the one source=() actually pinned via ${pkgver}.
    local bv
    bv=$(cat libtorch/build-version 2>/dev/null)
    bv=${bv%%+*}   # "2.12.0+rocm7.1" -> "2.12.0"
    if [ -z "$bv" ]; then
        # No build-version file: keep the pinned value rather than emitting an
        # empty version (which is what aborted the reported build).
        bv=$pkgver
    elif [ "$bv" != "$pkgver" ]; then
        # Refuse to silently relabel the archive. source=() is expanded from the
        # static $pkgver before pkgver() runs, so echoing $bv here would ship
        # binaries of one release under another release's name and provides=().
        printf 'error: archive contains libtorch %s but PKGBUILD pins %s\n' \
            "$bv" "$pkgver" >&2
        printf 'error: update pkgver and sha256sums together\n' >&2
        return 1
    fi
    printf '%s\n' "$bv"
}

prepare() {
    # Remove bundled pybind11 headers as we use system pybind11
    rm -r libtorch/include/pybind11

    # Fix ELF load command alignment in libtorch_cpu.so.
    # Pre-built PyTorch ROCm binaries sometimes ship zero-length LOAD
    # segments with misaligned p_offset, which glibc rejects with
    # "ELF load command address/offset not page-aligned".
    python3 -c "
import struct
with open('libtorch/lib/libtorch_cpu.so', 'r+b') as f:
    f.seek(32)
    e_phoff = struct.unpack('<Q', f.read(8))[0]
    f.seek(56)
    e_phnum = struct.unpack('<H', f.read(2))[0]
    fixed = 0
    for i in range(e_phnum):
        entry_off = e_phoff + i * 56
        f.seek(entry_off)
        data = f.read(56)
        p_type, p_flags, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_align = struct.unpack('<IIQQQQQQ', data)
        if p_type != 1 or p_filesz or p_memsz:  # non-zero PT_LOAD
            continue
        if (p_vaddr - p_offset) & (p_align - 1) == 0:
            continue
        f.seek(entry_off + 8)
        f.write(struct.pack('<Q', p_vaddr))
        print(f'Fixed segment {i}: p_offset 0x{p_offset:x} -> 0x{p_vaddr:x}')
        fixed += 1
    if fixed:
        print(f'Fixed {fixed} ELF segment(s) in libtorch_cpu.so')
    else:
        print('No ELF alignment issues in libtorch_cpu.so')
"

    # Suppress rocshmem warning in downstream builds.
    # rocshmem is not packaged in Arch; the find_package call in LoadHIP.cmake
    # is optional (not REQUIRED) but still emits a CMake warning when missing.
    sed -i '/find_package_and_print_version(rocshmem)/s/^/# /' \
        libtorch/share/cmake/Caffe2/public/LoadHIP.cmake
}

package() {
    # Install to /opt/libtorch
    install -dm755 "${pkgdir}/opt"
    mv libtorch "${pkgdir}/opt/"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libtorch/LICENSE"
}
# Maintainer: Selene Bray-Hernandez <selebray1998@gmail.com>
# Maintainer: Aaron Liu
# Contributor: Zhirui Dai <daizhirui at hotmail dot com>

# Probe which ROCm version has a libtorch binary for the current pkgver.
# Tries the system version first, then known fallbacks.
_detect_rocm_ver() {
    local sysver=$(pacman -Q rocm-core 2>/dev/null | awk '{print $2}' | cut -d. -f1-2)
    for v in "$sysver" "7.2" "7.1" "6.2" "6.1" "6.0"; do
        [ -n "$v" ] || continue
        if curl -sfI --max-time 5 \
            "https://download.pytorch.org/libtorch/rocm$v/libtorch-shared-with-deps-${pkgver}%2Brocm$v.zip" \
            >/dev/null 2>&1; then
            echo "$v"
            return 0
        fi
    done
    echo "7.1"
}
_rocm_ver=$(_detect_rocm_ver)

pkgname=libtorch-rocm
pkgver=2.12.0
pkgrel=2
pkgdesc="PyTorch but C++ as an isolated folder, with ROCm included"
arch=('x86_64')
url='https://docs.pytorch.org/cppdocs/installing.html'
license=('BSD-3-Clause')
depends=(pybind11 rocm-core)
makedepends=(curl python)
replaces=(libtorch-cxx11abi-rocm)
provides=("libtorch=${pkgver}")
conflicts=(libtorch)
# Use a filename without URL encoding to avoid extraction issues
source=("libtorch-shared-with-deps-${pkgver}+rocm${_rocm_ver}.zip::https://download.pytorch.org/libtorch/rocm${_rocm_ver}/libtorch-shared-with-deps-${pkgver}%2Brocm${_rocm_ver}.zip"
	"https://github.com/pytorch/pytorch/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('SKIP'
            'SKIP')
options=('!debug' '!strip' '!libtool' '!staticlibs' '!zipman')

pkgver() {
    curl -sL https://api.github.com/repos/pytorch/pytorch/releases/latest |
        grep '"tag_name":' |
        sed 's/.*: "//;s/",//' |
        sed 's/^v//'
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
}

package() {
    # Install to /opt/libtorch
    install -dm755 "${pkgdir}/opt"
    mv libtorch "${pkgdir}/opt/"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libtorch/LICENSE"
}
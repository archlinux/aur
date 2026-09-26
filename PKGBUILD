# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=canonical-multipass
_realname=multipass
pkgver=1.16.4
pkgrel=1
pkgdesc="Multipass is a lightweight VM manager for Linux, Windows and macOS."
arch=('x86_64')
url="https://multipass.run"
license=('GPL-3.0-only')
source=("git+https://github.com/canonical/${_realname}.git#tag=v${pkgver}"
        multipassd.service
        fmt11-cxx20-compat.patch
        yaml-cpp-cstdint.patch)
depends=('glibc' 'gcc-libs' 'systemd-libs' 'apparmor' 'openssl' 'qt6-base' 'qemu-base' 'edk2-ovmf')
makedepends=('git' 'cmake' 'libvirt' 'zip' 'unzip' 'ninja')
optdepends=(
    'libvirt: to use the libvirt driver'
)


_builddir=_build

prepare() {
  cd "${_realname}"
  git submodule update --init --recursive

  # vcpkg's pinned fmt (11.x) enforces compile-time format-string checking;
  # several call sites in multipass pass a runtime-computed string where a
  # constexpr one is required. See fmt11-cxx20-compat.patch for details.
  patch -p1 < "$srcdir"/fmt11-cxx20-compat.patch

  # vendored yaml-cpp submodule is missing <cstdint> for uint16_t/uint32_t,
  # caught by GCC's stricter header hygiene.
  patch -d 3rd-party/yaml-cpp -p1 < "$srcdir"/yaml-cpp-cstdint.patch
}

build() {
  cmake -B ${_builddir} \
      -S "${_realname}" \
      -Wno-dev \
      -DMULTIPASS_ENABLE_FLUTTER_GUI=OFF \
      -DMULTIPASS_ENABLE_TESTS=OFF \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
      -DCMAKE_CXX_FLAGS="-fno-char8_t -Wno-unused-result" \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build ${_builddir} --parallel "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install ${_builddir}
  # not needed in package
  rm "$pkgdir"/usr/lib/libssh.a
  install -Dm644 "$srcdir"/multipassd.service "$pkgdir"/usr/lib/systemd/system/multipassd.service

  # multipass hardcodes `-bios OVMF.fd` for QEMU, searched relative to QEMU's
  # own firmware dir (/usr/share/qemu). edk2-ovmf no longer ships a bare
  # OVMF.fd there (only OVMF.4m.fd under /usr/share/edk2/x64), so every VM
  # launch fails with "could not load PC BIOS 'OVMF.fd'" without this symlink.
  install -d "$pkgdir"/usr/share/qemu
  ln -s /usr/share/edk2/x64/OVMF.4m.fd "$pkgdir"/usr/share/qemu/OVMF.fd
}

sha256sums=('SKIP'
            'f7aebd4ab185048ee10e8185ac230c8ac549ff29b2e52722fbf366ad6f3c6b59'
            'f3b0d8d3552f7dd79a49a0cfdc2536128bd17c3eba06d3f119157f5239d76bcc'
            '67c098bf446f51e80cbe6a3f88345700f816e8ac1c43e3566042707a006f43ce')

# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=canonical-multipass
_realname=multipass
pkgver=1.16.1
pkgrel=2
pkgdesc="Multipass is a lightweight VM manager for Linux, Windows and macOS."
arch=('x86_64')
url="https://multipass.run"
license=('GPL-3.0-only')
source=("git+https://github.com/canonical/${_realname}.git#tag=v${pkgver}"
        multipassd.service)
depends=('glibc' 'gcc-libs' 'systemd-libs' 'apparmor' 'openssl' 'qt6-base' 'qemu-base')
makedepends=('git' 'cmake' 'libvirt')
optdepends=(
    'libvirt: to use the libvirt driver'
)


_builddir=_build

prepare() {
  cd "${_realname}"
  git submodule update --init --recursive
}

build() {
  cmake -B ${_builddir} \
      -S "${_realname}" \
      -Wno-dev \
      -DMULTIPASS_ENABLE_FLUTTER_GUI=OFF \
      -DMULTIPASS_ENABLE_TESTS=OFF \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build ${_builddir}
}

package() {
  DESTDIR="$pkgdir" cmake --install ${_builddir}
  # not needed in package
  rm "$pkgdir"/usr/lib/libssh.a
  install -Dm644 "$srcdir"/multipassd.service "$pkgdir"/usr/lib/systemd/system/multipassd.service
}

sha256sums=('3cfe94b4620752445faa6f2afcdcc6dc8a3047ae833126c9a0ce7bbf7049e631'
            'f7aebd4ab185048ee10e8185ac230c8ac549ff29b2e52722fbf366ad6f3c6b59')

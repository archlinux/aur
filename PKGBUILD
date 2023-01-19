# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=canonical-multipass
_realname=multipass
_builddir=_build
pkgver=1.11.0
pkgrel=1
pkgdesc="Multipass is a lightweight VM manager for Linux, Windows and macOS."
arch=('x86_64')
url="https://multipass.run"
license=('GPL3')
depends=('apparmor' 'qt5-base' 'qemu-base')
makedepends=('git' 'cmake' 'qt5-x11extras' 'libvirt')
optdepends=(
    'qt5-x11extras: for multipass.gui'
    'libvirt: to use the libvirt driver'
)
source=("git+https://github.com/canonical/${_realname}.git#tag=v${pkgver}"
        multipassd.service
        libssh-static.patch
)

prepare() {
  cd "${_realname}"
  git submodule update --init --recursive
  patch 3rd-party/libssh/CMakeLists.txt < ${srcdir}/libssh-static.patch
}

build() {
  export CXXFLAGS=-Wno-error=deprecated-declarations
  cmake -B ${_builddir} \
      -S "${_realname}" \
      -Wno-dev \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build ${_builddir}
}

package() {
  DESTDIR="$pkgdir" cmake --install ${_builddir}
  # not needed in package
  rm "$pkgdir"/usr/lib/libssh.a
  install -Dm644 "$srcdir"/multipassd.service "$pkgdir"/usr/lib/systemd/system/multipassd.service
}

sha256sums=('SKIP'
            'f7aebd4ab185048ee10e8185ac230c8ac549ff29b2e52722fbf366ad6f3c6b59'
            '8cc982b96a800c9779134a00e741c472da7c8e11183931ec30b184c314364dde')

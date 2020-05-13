# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname="micropython"
pkgname="${_pkgname}-git"
pkgver=1.12.r451.g18fb5b443
pkgrel=1
epoch=1
pkgdesc="A Python 3 implementation for microcontrollers and constrained environments (Unix version)."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('libffi')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'mpy-cross')
optdepends=('micropython-lib: for MicroPython standard library')
source=("${_pkgname}::git://github.com/micropython/${_pkgname}.git"
        "axtls::git+https://github.com/pfalcon/axtls.git"
        "libffi::git+https://github.com/atgreen/libffi.git"
        "berkeley-db-1.xx::git+https://github.com/pfalcon/berkeley-db-1.xx.git"
)
changelog='ChangeLog'
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  for submodule in axtls berkeley-db-1.xx libffi; do
    git submodule init "lib/$submodule"
    git config submodule.$submodule.url "${srcdir}/$submodule"
    git submodule update "lib/$submodule"
  done
}

build() {
  cd "${srcdir}/${_pkgname}"
  ( cd mpy-cross; make; )
  ( cd ports/unix; make)
}

package() {
  cd "${srcdir}/${_pkgname}"
  ( cd ports/unix; make PREFIX="$pkgdir/usr" install; )
  install mpy-cross/mpy-cross "$pkgdir/usr/bin"
  # Install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # Install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

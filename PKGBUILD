# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>
_pkgname=yaft
pkgname=${_pkgname}-git
pkgver=r454.59ef091
pkgrel=2
pkgdesc="yet another framebuffer terminal"
arch=('i686' 'x86_64')
url="https://github.com/uobikiemukot/yaft"
license=('MIT')

makedepends=('ncurses')
optdepends=('fbv: for the yaft_wall command to work'
            'idump: for the yaft_wall command to work')

source=("${_pkgname}::git+${url}.git"
        "https://github.com/uobikiemukot/yaft/pull/62.patch")
sha256sums=('SKIP'
            '45c392757f4c6eee0c4b877ed287adc236b61bca9c058d9497b3a6bfa3a6c98b')

backup=(usr/share/terminfo/y/yaft-256color)

conflicts=("$_pkgname")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  patch -p1 -i "../62.patch"
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make prefix=${pkgdir}/usr mandir=${pkgdir}/usr/share/man terminfo=${pkgdir}/usr/share/terminfo DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

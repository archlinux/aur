# Maintainer: ferreum <code at ferreum de>
pkgname=i3-match-git
pkgver=0.1.84.re0ec653
pkgrel=2
pkgdesc="Match and query i3/sway window properties and events"
arch=('i686' 'x86_64')
url='https://gitlab.com/ferreum/i3-match'
license=('MIT')
depends=('xcb-util' 'json-c')
makedepends=('i3-wm' 'git')
source=('git+https://gitlab.com/ferreum/i3-match.git')
sha1sums=('SKIP')

_gitname='i3-match'

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="0.1.$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
  printf "%s" "${ver//-/.}"
}

prepare() {
  cd "$_gitname/src"
  make clean
  make depend
}

build() {
  cd "$_gitname"
  gzip <man/i3-match.1 >man/i3-match.1.gz
  cd src
  make
}

package() {
  cd "$_gitname"

  install -Dm755 -t "${pkgdir}/usr/bin/" src/i3-match
  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" man/i3-match.1.gz
  ln -s i3-match "${pkgdir}/usr/bin/swaymatch"
  ln -s i3-match.1.gz "${pkgdir}/usr/share/man/man1/swaymatch.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:


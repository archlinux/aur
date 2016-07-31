# Maintainer:  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=evolvotron
pkgver=0.6.3
pkgrel=2
pkgdesc="An interactive generative art application"
arch=('i686' 'x86_64')
url="http://www.bottlenose.demon.co.uk/share/evolvotron/"
license=('GPL')
depends=('qt4' 'boost-libs')
makedepends=('boost' 'gendesk')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
"fix_bool_cast.patch"
"evolvotron.png"
)

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  cd "$srcdir/$pkgname"
  patch -Np1 -i "${srcdir}/fix_bool_cast.patch"
}

build() {
  cd "$srcdir/$pkgname"
  QTDIR=/usr/bin ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"

  for bin in ${pkgname}{,_mutate,_render}; do
    install -D -m 755 "${bin}/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
  for man in ${pkgname}{,_mutate,_render}.1; do
    install -D -m 644 "man/man1/${man}" "${pkgdir}/usr/share/man/man1/${man}"
  done
  install -D -m 644 evolvotron.html "${pkgdir}/usr/share/doc/${pkgname}/manual.html"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
# vim:syntax=sh
md5sums=('d36afd3d8e4d89418fffd963d204d5a8'
         '9abc069adfa6ee50b8c206fef046e2b4'
         '0302f0dde78ced8f177276ce96ddab5e')

# Maintainer: Saverio Brancaccio <saverio.brancaccio@gmail.com>
# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=evolvotron
pkgver=0.7.1
pkgrel=5
pkgdesc="An interactive generative art application"
arch=('i686' 'x86_64')
url="http://www.timday.com/share/evolvotron/index.htm"
license=('GPL')
depends=('qt5-base' 'boost-libs')
makedepends=('boost' 'gendesk')
source=("https://gitlab.com/saveriobran/evolvotron_fixed/raw/master/evolvotron.tar.gz"
"https://gitlab.com/saveriobran/evolvotron_fixed/raw/master/evolvotron.png"
)

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  qmake-qt5 "VERSION_NUMBER=$(./VERSION)" main.pro
  make -j 4
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
md5sums=('73d9188d01ec3b69010ff2ec2d74ccea'
'6a940f8edfff06aad4d8049be8cda8bf')

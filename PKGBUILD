# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=jwm
pkgver=2.4.3
pkgrel=1
pkgdesc="A lightweight window manager for the X11 Window System"
arch=('x86_64')
url="https://joewing.net/projects/jwm/"
license=('MIT')
depends=('libx11' 'libxft' 'libjpeg-turbo' 'libxpm' 'libxinerama' 'libpng' 'cairo' 'librsvg')
backup=('etc/system.jwmrc')
source=("https://github.com/joewing/jwm/releases/download/v$pkgver/jwm-$pkgver.tar.xz"
        jwm.desktop)
# contacted upstream about desktop
# no reply
sha512sums=('35b8a6da9614f11881013aa77c36ee88ce9a213f056e797231b772132beb841d54094809b6a476383999bddeccf61451f72cd166309dd79c223b634cf5d1e69e'
            '1014988cc17a439ad3ae36a1e137ad8c9c46b2afbe6966c68ecc3258a0320fbad96c562fb39bdc41db624ebddaa45617938b621b489f3a740bda11a40f4f7718')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/local/share/|/usr/share/|' contrib/Makefile po/Makefile* example.jwmrc
  # locales were broken in 2.4.0
  sed -i 's|mkdir_p = @mkdir_p@|mkdir_p = /usr/bin/mkdir -p --|' po/Makefile*
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fribidi 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" \
       DESTDIR="$pkgdir" SYSCONF="$pkgdir/etc" install
  install -Dm644 "../jwm.desktop" "$pkgdir/usr/share/xsessions/jwm.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

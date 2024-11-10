# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=jwm
pkgver=2.4.6
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
sha512sums=('daf1bf033f2055534bab7ac5a12966df69039d3af2a220d1c9ce2126759019c9e6fea1a50fdf72d30be36d0cd22f243d11010d50f4b0795577b4d74209b82bd6'
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

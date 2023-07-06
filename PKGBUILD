# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: jlvsimoes <jlvsimoes@oninet.pt>
# Contributor: kevin <kevin@archlinux.org>

pkgname=abuse
pkgver=0.9.1
pkgrel=1
pkgdesc='Side-scroller action game that pits you against ruthless alien killers'
arch=(x86_64)
url='https://github.com/Xenoveritas/abuse'
license=(custom GPL)
depends=('libglvnd' 'sdl2_mixer')
makedepends=('gendesk' 'glu' 'mesa')
source=("${pkgname}-${pkgver}::https://github.com/Xenoveritas/abuse/archive/refs/tags/v${pkgver}.tar.gz"
        abuse.sh
        default.abuserc
        default.gamma.lsp)
b2sums=('7af8be86cdd5ede66ac200a193e5e37d188825d648aec8915e3b07608e02afc2be3f58b59dcc675d605c9a0a97b3caf256e46ba5d036e3139c254d281c50f611'
        '6301cc73db634fc5df21452754dde86324b2dff5cc0dff8620443ee115b691820751ffb78b667374e46f00d7b86c165f787a1a57d1bca5edea8bad8b0b05a3bc'
        '362bb4f5e9909a8d9d664abf453f4c9b6f0c516666a4b33f653239fafda331416e571ce7af58f1b951f66fb612746462e508e61f20547cf0d538e7b8ae5fe39d'
        'ec12493a94a0163bc0396b4adaf5ae913b491a43529474c9d54cacf44ac37bede0f21a74d93f2e584b1b511e049b2787e60e95c31dc9ae9079cc48df78f39444')

build() {
  cd abuse-$pkgver
  cmake .
  make
}

package() {
  cd abuse-$pkgver

  make DESTDIR="$pkgdir" install

  # Desktop shortcut and icon
  install -Dm644 data/freedesktop/com.github.Xenoveritas.abuse.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 doc/$pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Default configuration
  mkdir -p  "$pkgdir/usr/bin/"
  mv "$pkgdir/usr/local/bin/$pkgname" "$pkgdir/usr/bin/$pkgname.elf"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/default.${pkgname}rc" \
    "$pkgdir/usr/share/$pkgname/default.${pkgname}rc"
  install -Dm644 "$srcdir/default.gamma.lsp" \
    "$pkgdir/usr/share/$pkgname/default.gamma.lsp"

  # License (for the original source code)
  install -d "$pkgdir/usr/share/licenses/abuse"
  sed -n '1,/^$/p' src/view.cpp > "$pkgdir/usr/share/licenses/abuse/original"
}

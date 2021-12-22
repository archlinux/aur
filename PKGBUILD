# Maintainer kyle[at]kylemanna[d0t]com
_pkgbin=celoterminal
pkgname=$_pkgbin
pkgdesc='Celo Terminal'
license=('MIT')
url='https://github.com/zviadm/celoterminal'
pkgver=1.11.8
pkgrel=2
arch=('x86_64')
# Need nodejs v12 for better-sqlite3 v7.1.2 :(
depends=('libusb')
makedepends=('nodejs-lts-erbium' 'yarn' 'python2' 'git' 'systemd' 'nss' 'gtk3' 'gdk-pixbuf2')

_pkgsrc="Celo Terminal-${pkgver}-linux-x86_64.AppImage"

source=("https://github.com/zviadm/celoterminal/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f9764b53449e34609236ae3412e2cc7a4ed1d051990218753929ee9e534f06de6b670b8a77c5e7ea411951faff0dfe1b2892f4b300ae9cd7a71945d8eb278cb9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Python2 is still necessary for better-sqlite3 it seems :(
  export PYTHON=$(which python2)
  yarn
  yarn compile
  yarn electron-builder --linux --publish never
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  yarn test
}

package() {
  cd $srcdir/$pkgname-$pkgver/dist/__appImage-x64

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "${_pkgbin}.desktop"

  install -d "$pkgdir/opt/$_pkgbin"
  cp -a . "$pkgdir/opt/$_pkgbin/"
  chmod -R +rx "$pkgdir/opt/$_pkgbin"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  (cd $pkgdir/usr/share/licenses/$pkgname; ln -s ../../../../opt/celoterminal/LICENSE* .) 

  # Fix strange icon size
  mv "$pkgdir/usr/share/icons/hicolor/0x0" "$pkgdir/usr/share/icons/hicolor/512x512"
}

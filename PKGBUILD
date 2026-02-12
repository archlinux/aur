# Maintainer: Illium <illia.pukalov@teleinformatika.eu> https://github.com/IlyaP358
pkgname=irfanview
pkgver=4.73
pkgrel=1
pkgdesc="Fast and compact image viewer/browser (Wine)"
arch=('x86_64')
url="https://www.irfanview.com/"
license=('custom:irfanview')
depends=('wine' 'sh')
makedepends=('unzip')
source=("irfanview.sh"
        "irfanview.desktop"
        "irfanview.png")
sha256sums=('07a46e369f1820c2f0baaf2acff3a8ddfea68e93478d739626b21cf902790d73'
            '0de99d6ba82fca4c2602cfb5a7e84d69fb183da63689e8f6b5fffe578c020ffe'
            'd13e4f45b73c1560bcfc14c470548e2e844ed5e80e59e805d0ea0f8a9b2155b5')

_zip_url="https://www.irfanview.info/files/iview${pkgver//.}_x64.zip"
_zip_sha256="433936d26b97057b16026ea6b6c2897e5941e38cd980e424172bc0d980242fd4"

prepare() {
  echo "Downloading IrfanView portable..."
  curl -L -H "Referer: $_zip_url" -A "Mozilla/5.0" -o "iview${pkgver//.}_x64.zip" "$_zip_url"

  echo "Verifying checksum..."
  echo "$_zip_sha256  iview${pkgver//.}_x64.zip" | sha256sum -c -

  unzip -o "iview${pkgver//.}_x64.zip"
}

package() {
  install -d "$pkgdir/opt/irfanview"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"

  cd "$srcdir"
  
  install -m755 i_view64.exe "$pkgdir/opt/irfanview/"
  [ -f iv_uninstall.exe ] && install -m755 iv_uninstall.exe "$pkgdir/opt/irfanview/"
  
  find . -maxdepth 1 -name "*.txt" -exec install -m644 {} "$pkgdir/opt/irfanview/" \;
  find . -maxdepth 1 -name "*.chm" -exec install -m644 {} "$pkgdir/opt/irfanview/" \;
  find . -maxdepth 1 -name "*.ini" -exec install -m644 {} "$pkgdir/opt/irfanview/" \;
  cp -r Plugins Languages Toolbars Html "$pkgdir/opt/irfanview/" 2>/dev/null || true
  install -m755 irfanview.sh "$pkgdir/usr/bin/irfanview"
  install -m644 irfanview.desktop "$pkgdir/usr/share/applications/irfanview.desktop"

  install -d "$pkgdir/usr/share/pixmaps"
  install -m644 irfanview.png "$pkgdir/usr/share/pixmaps/irfanview.png"
}

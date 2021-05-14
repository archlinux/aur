# Maintainer:  FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Christoph Robbert <chrobbert@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: jrutila
# Contributor: grimi <grimi@poczta.fm>
# Contributor: jht <stefano@inventati.org>

pkgname=wxglade
pkgver=1.0.2
pkgrel=1
pkgdesc='wxGlade is a GUI builder written in Python for the GUI toolkit wxWidgets/wxPython'
arch=('any')
license=('MIT')
url='http://wxglade.sourceforge.net/'
depends=('python' 'python-wxpython' 'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info')
makedepends=(icoutils gendesk)
source=("https://github.com/wxGlade/wxGlade/archive/v$pkgver.tar.gz"
        application-x-wxg.xml)
sha256sums=('dcf1e3bc3e141480ea9fc059739e823f2d7553931fd51ab130b2ef6a8b699ea1'
            'f651ff097678077eac865c64a655107c9a4aa4fd0bf65e233713a5ed916608c0')

prepare() {
  gendesk -f -n --pkgname "$pkgname" \
  	--pkgdesc "$pkgdesc" \
  	--exec "$pkgname %f" \
    --name 'WxGlade' \
    --mimetypes 'application/x-wxg' \
    --categories "Development;GUIDesigner"

  rm -rf "$pkgname-$pkgver" && mv -Tfv {wxGlade,$pkgname}-$pkgver
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build

  icotool --extract --output=$srcdir icons/wxglade*.ico
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  datadir="$pkgdir/usr/share/"

  # TODO: Replace with default wxglade-mime.xml in v1.1.0+
  install -Dm644 "$srcdir/application-x-wxg.xml" "$datadir/mime/packages/$pkgname.xml"

  find "$srcdir" -maxdepth 1 -name "$pkgname*128*.png" \
    -execdir install -Dm644 {} "$datadir/icons/hicolor/128x128/apps/$pkgname.png" \; \
    -execdir install -Dm644 {} "$datadir/icons/hicolor/128x128/mimetypes/application-x-wxg.png" \;

  find "$srcdir" -maxdepth 1 -name "$pkgname*32*.png" \
    -execdir install -Dm644 {} "$datadir/icons/hicolor/32x32/apps/$pkgname.png" \; \
    -execdir install -Dm644 {} "$datadir/icons/hicolor/32x32/mimetypes/application-x-wxg.png" \;

  install -Dm644 "$srcdir/$pkgname.desktop" "$datadir/applications/$pkgname.desktop"
}

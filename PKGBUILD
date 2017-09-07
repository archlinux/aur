# Maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

pkgname=openstreetcam-gui
pkgver=r15.9ac859e
pkgrel=1
pkgdesc="Upload GUI for OpenStreetCam, a collaborative street view"
arch=('i686' 'x86_64')
url="https://github.com/openstreetcam/upload-GUI"
license=('LGPL3')
depends=('qt5-base'
         'qt5-declarative'
         'openssl')
source=("$pkgname-$pkgver::git+https://github.com/openstreetcam/upload-GUI#commit=9ac859ea82979946a97fd10b53a85eaab3fea36d"
        "$pkgname-$pkgver.patch"
        "$pkgname.sh"
        "$pkgname.desktop"
        "openstreetcam-logo.png")
sha256sums=('SKIP'
            'ccfcb42abe10d11826876467f514fba90b24c914789255f74ddf28a6c18570ac'
            '46c5be97dc7744382ccabbfe74ead7e2f1aafd2f9a6edcbbbb73f32569361131'
            '2e97ece5686d44c049112fb66aa45dc747b6d8123a5e52cc356e4f4b9f87a08f'
            'cab24a82fd85b9f901150915b51b18b60afbb4e159f074a807fb3e4581a5d6fe')


prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$pkgname-$pkgver/OSV_Qt_upload"
  qmake-qt5 PREFIX="$pkgdir"
  make
}

package() {
  cd "$pkgname-$pkgver/OSV_Qt_upload"

  # Upstream's make install doesn't really work, so we do a custom install
  install -d "$pkgdir/usr/lib/$pkgname"
  install -m755 KQOAuth/libKQOAuth.so* HTTPRequest/libHTTPRequest.so* "$pkgdir/usr/lib/$pkgname/"
  install -Tm755 "UploadComponent/UploadComponent" "$pkgdir/usr/lib/$pkgname/$pkgname"

  # Install auxiliary files created by the Arch package maintainer for your convenience
  install -DTm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -DTm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -DTm755 "$srcdir/openstreetcam-logo.png" "$pkgdir/usr/share/pixmaps/openstreetcam.png"
}

# vim: set et ts=2 sw=2:

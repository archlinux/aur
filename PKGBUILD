# Co-Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=3.6.0
pkgrel=6
pkgdesc="Clean metadata from images, videos, PDFs, and other files"
url="https://github.com/szTheory/exifcleaner"
license=('MIT')
arch=('x86_64')
depends=('at-spi2-core' 'gtk3' 'libappindicator-gtk3' 'libnotify' 'libsecret'
         'libxss' 'libxtst' 'nss' 'perl-image-exiftool' 'util-linux-libs' 'xdg-utils')
provides=("exifcleaner")
conflicts=("exifcleaner")
source=("$url/releases/download/v$pkgver/exifcleaner_${pkgver}_amd64.deb"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('03094fa4609ff887824244bf602f6bdefa4810e41a66848b05b8c16540e10b38'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')

prepare() {
# Extract
  tar xf data.tar.xz -C .
# SUID chrome-sandbox for Electron 5+
  cd opt/ExifCleaner
  chmod 4755 chrome-sandbox || true
# Symlink system exiftool
  cd resources/nix/bin/lib
  ln -sf /usr/share/perl5/vendor_perl/File/RandomAccess.pm File
  rm -dr Image/ExifTool
  ln -sf /usr/share/perl5/vendor_perl/Image/ExifTool Image
  ln -sf /usr/share/perl5/vendor_perl/Image/ExifTool.pm Image
}

package() {
# Install
  mv opt "$pkgdir"
  mv usr "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/exifcleaner"
# Symlink binary
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/ExifCleaner/exifcleaner" "$pkgdir/usr/bin"
}

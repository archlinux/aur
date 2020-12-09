# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=amazon-workspaces-bin
pkgver=3.1.0.813
pkgrel=1
pkgdesc='Amazon Workspace Client'
arch=('i686' 'x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
depends=(
    'gtk3'
    'webkit2gtk'
)
options=('staticlibs')
makedepends=(
  'binutils'
  'tar'
)
source=(
    "$pkgname-$pkgver.deb::https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb"
    "$pkgname-$pkgver.info::https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu/dists/bionic/main/binary-amd64/Packages"
)

sha256sums=(
    "SKIP"
    "SKIP"
)

prepare() {
    # Verify the checksum
    echo "$(grep SHA256 "$pkgname-$pkgver.info" | cut -d" " -f2) $pkgname-$pkgver.deb" >sum
    sha256sum -c sum

    ar x "$pkgname-$pkgver.deb"
    tar axvf data.tar.xz
    tar axvf control.tar.xz

    # Fix the .desktop entry
    sed -i -e 's/\/opt\/workspacesclient/\/usr\/share\/amazon-workspaces/' $srcdir/usr/share/applications/workspacesclient.desktop
    mv $srcdir/usr/share/applications/workspacesclient.desktop $srcdir/usr/share/applications/amazon-workspaces.desktop
}

pkgver() {
    grep Version control | cut -d" " -f2
}

package() {
  mkdir -p $pkgdir/usr/share/amazon-workspaces
  mkdir -p $pkgdir/usr/bin

  # Icons
  cp -a $srcdir/usr/share/* $pkgdir/usr/share/

  # Binary
  cp -a $srcdir/opt/workspacesclient/* $pkgdir/usr/share/amazon-workspaces/

  # Launcher
  ln -s /usr/share/amazon-workspaces/workspacesclient $pkgdir/usr/bin/amazon-workspaces
}

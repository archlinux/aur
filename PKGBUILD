# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>
# Contributor: Steve Engledow <steve@engledow.me>

pkgname=amazon-workspaces-bin
pkgver=4.5.0.2006
pkgrel=4
_aptdist=focal
pkgdesc='Amazon Workspace Client'
arch=('x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
depends=(
    'gtk3'
    'webkit2gtk'
    'icu63'
    'libsoup'
    'graphicsmagick'
    'hiredis0.14'
    'libva'
)
options=('staticlibs')
makedepends=(
  'binutils'
  'tar'
)
source=(
    "$pkgname-$pkgver.deb::https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_${_aptdist}_amd64.deb"
    "$pkgname-$pkgver.info::https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu/dists/${_aptdist}/main/binary-amd64/Packages"
)

sha256sums=('d72b23d36d1f60e98846f651dbbfbb64da9dcea900d906eb0b00d4d7ca2ec5a2'
            'fbaac63a54bf9256b15d242bc59a152ffe66a07cdba9b724957cfde2fa9a1f1e')

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

# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>
# Contributor: Steve Engledow <steve@engledow.me>

pkgname=amazon-workspaces-bin
pkgver=4.6.0.4187
pkgrel=2
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
    'openssl-1.1'
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

sha256sums=('03e6fbf5ec21e210487fc8e02b420d20b164b53a914693a05d11f4146ce257a7'
            '02cb06036b712ffc8daf6b2ee536bb8d5f654c2cd914eae7aa7351284045bb82')

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

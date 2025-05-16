# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>
# Contributor: Steve Engledow <steve@engledow.me>

pkgname=amazon-workspaces-legacy-bin
pkgver=4.7.0.4312
pkgrel=2
_aptdist=focal
pkgdesc='Amazon Workspace Client (Legacy version, only PCoIP)'
arch=('x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
conflicts=('amazon-workspaces-bin')
depends=(
    'gtk3'
    'webkit2gtk'
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
    "$pkgname-$pkgver.deb::https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_focal_amd64.deb"
)

sha256sums=('1b4a39b859c49225169a44cc507955722770fb6c7c7bf2a631f54113ba0b5d5f')

prepare() {
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

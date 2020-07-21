# Maintainer: zan <zan@420blaze.it>
# Contributor: Jacob Henner <code@ventricle.us>
# Contributor: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.4.0rc1.r296.g68d375c43.0.g68d375c43
pkgrel=1
pkgdesc='A modern music player and library organizer'
url='http://www.clementine-player.org/'
license=(GPL)
arch=(x86_64)
depends=(chromaprint glew gst-plugins-base-libs libmygpo-qt5 protobuf qt5-x11extras)
makedepends=(boost cmake git)
optdepends=('libcdio: for CD support'
            'libgpod: for iPhone and iPod Touch support'
            'liblastfm-qt5: for LastFM support'
            'libmtp: for MTP support'
            'crypto++: for Spotify plugin')
conflicts=(clementine)
provides=(clementine)
_name=Clementine
source=("git+https://github.com/clementine-player/$_name.git"
        "close-fix.diff")
sha256sums=('SKIP'
            'f8db366cf61b956a96b21d587aff42f565d9ac84636d5188249b34268d3537c5')

pkgver() {
    cd $_name
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_name
    patch -p1 -i $srcdir/close-fix.diff
}

build() {
  cmake -B build -S $_name -DENABLE_SPOTIFY_BLOB=off
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

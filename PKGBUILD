# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=haruna-git
pkgver=0.7.3.r43.gfd5868a
pkgrel=1
pkgdesc="A Qt/QML video player built on top of libmpv"
url="https://invent.kde.org/multimedia/haruna"
arch=('x86_64')
license=('GPL3')
depends=('breeze' 'kfilemetadata' 'kio-extras' 'mpv' 'qqc2-desktop-style')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
optdepends=('yt-dlp: for video-sharing websites playback'
            'youtube-dl: for video-sharing websites playback')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git" 'fix-ffmpeg5.patch')
sha256sums=('SKIP'
            'e9a63b260b5a0b037b6fbd4b4540771898e32c839e5a259af08fd19f9d5c8b82')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "${pkgname%-*}"
  patch -Np1 -i ../fix-ffmpeg5.patch
}

build() {
  cmake -B build -S "${pkgname%-*}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

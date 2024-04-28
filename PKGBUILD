# Maintainer: TurtleRuss <tttturtleruss@gmail.com>

pkgname=twitch-dl-git
pkgver=2.3.0.r5.gde95384
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python-httpx' 'python-m3u8' 'python-requests' 'python-pyaml' 'ffmpeg')
makedepends=('git' 'python-setuptools' 'python-wheel')
optdepends=('twine: Collection of utilities for interacting with PyPI')
checkdepends=('python-pytest')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make 
}

package() {
  cd "${pkgname%-git}/dist"
  whl=$(ls | grep *.whl)
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/temp"
  pip install -U $whl --break-system-packages -t "$pkgdir/temp"
  cp "$pkgdir/temp/bin/twitch-dl" "$pkgdir/usr/bin" 
  rm -rf "$pkgdir/temp"
}

# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl-git
pkgver=1.22.0.r0.gb3a57c2
pkgrel=2
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'python-m3u8' 'python-requests' 'python-pyaml' 'ffmpeg')
makedepends=('git' 'python-setuptools' 'python-wheel')
optdepends=('twine: Collection of utilities for interacting with PyPI')
checkdepends=('python-pytest')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  make 
}

check(){
  cd "${pkgname%-git}"
  python setup.py pytest || :
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}

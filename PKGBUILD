# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink-git
pkgver=r1562.cb4fab0
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')
depends=('python-requests' 'python-setuptools' 'rtmpdump')
makedepends=('git' 'python-sphinx')
optdepends=('python-librtmp: Required by the ustreamtv plugin to be able to use non-mobile streams.')
provides=('streamlink')
conflicts=('streamlink')
source=('git+https://github.com/streamlink/streamlink.git')
sha256sums=('SKIP')

pkgver() {
  cd streamlink
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd streamlink
  python setup.py build_sphinx -b man
}

package() {
  cd streamlink
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

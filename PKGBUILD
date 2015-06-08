# Maintainer: Reventlov <contact+aur@volcanis.me>
pkgname=searx-git
pkgver=v0.7.0.r76.g9981725
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searx.0x2a.tk/"
license=('AGPL')
depends=('python2-flask' 'python2-flask-babel' 'python2-requests' 'python2-lxml' 'python2-yaml' 'python2-dateutil' 'python2-pygments')
makedepends=('git')
backup=('usr/lib/python2.7/site-packages/searx/settings.yml')
install=searx.install
source=("$pkgname"::'git+https://github.com/asciimoo/searx.git' 'searx.install' 'searx.service')
noextract=()
md5sums=('SKIP'
         '2d63214f114f131a0ca2d93aa5dafee2'
         '591625748fdd1b1ad1fe11c8ae8931b5')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
  msg "Starting build..."
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../searx.service "${pkgdir}"/usr/lib/systemd/system/searx.service
  rm  "$pkgdir/usr/lib/python2.7/site-packages/README.rst"
}

# vim:set ts=2 sw=2 et:

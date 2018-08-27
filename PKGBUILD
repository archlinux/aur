# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot-worker-git
pkgver=1.2.0.r45.gc9d5f87a3
pkgrel=1
arch=('any')
url="https://buildbot.net"
license=("GPL2")
makedepends=('git')
pkgdesc="Buildbot Worker Daemon"
depends=('python-twisted' 'python-future')
checkdepends=('python-mock')
source=(git+https://github.com/buildbot/buildbot.git)
sha256sums=('SKIP')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

check() {
  cd buildbot/worker
  PYTHONPATH=. trial3 buildbot_worker
}

package() {
  cd buildbot/worker
  python setup.py install --root="$pkgdir" --optimize=1
}

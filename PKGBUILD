# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=buildbot
pkgname=buildbot-git
pkgdesc="The Continuous Integration Framework"
pkgver=1.4.0.r99.gc8595820f
pkgrel=2
arch=('any')
url="https://buildbot.net"
license=("GPL2")
depends=('python-twisted' 'python-jinja' 'python-zope-interface' 'python-future'
         'python-sqlalchemy-migrate' 'python-dateutil' 'python-txaio'
         'python-autobahn' 'python-pyjwt')
makedepends=('git')
checkdepends=('python-treq' 'python-boto3' 'python-mock' 'python-moto'
              'python-lz4' 'python-isort' 'python-pylint' 'python-pyenchant'
              'flake8' 'python-txrequests' 'python-setuptools_trial'
              'python-pyjade' 'python-yaml'
              'python-buildbot-pkg-git' 'buildbot-worker-git'
              'openssh')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git+https://github.com/buildbot/buildbot.git
        skip-linux-distro-test.patch)
sha256sums=('SKIP'
            '42fc2a771034c4134006ed18b52916e668aba3e2046b2fe188c7abcb3cffc0a5')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

prepare() {
  cd buildbot

  # This test relies on VERSION_ID field in /etc/os-release. On Arch Linux this
  # field is missing.
  patch -Np1 -i ../skip-linux-distro-test.patch
}

build() {
  cd buildbot/master
  python setup.py build
}

check() {
  cd buildbot/master
  TZ=UTC python setup.py test --rterrors
}

package() {
  cd buildbot/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot-git
pkgdesc="The Continuous Integration Framework"
pkgver=1.2.0.r43.g55fc75395
pkgrel=3
arch=('any')
url="https://buildbot.net"
license=("GPL")
depends=('python-twisted' 'python-jinja' 'python-zope-interface' 'python-future'
         'python-sqlalchemy-migrate' 'python-dateutil' 'python-txaio'
         'python-autobahn' 'python-pyjwt')
makedepends=('git')
checkdepends=('python-treq' 'python-boto3' 'python-mock' 'python-moto'
              'python-lz4' 'python-isort' 'python-pylint' 'python-pyenchant' 'flake8'
              "buildbot-pkg-git=$pkgver" "buildbot-worker-git=$pkgver")
source=(git+https://github.com/buildbot/buildbot.git
        ignore-invalid-escape-sequence.patch
        skip-linux-distro-test.patch)
sha256sums=('SKIP'
            'eb85942f5d9f43ed46c8832f318314084dcde2e53f698bf104af28c3a449ef1f'
            '42fc2a771034c4134006ed18b52916e668aba3e2046b2fe188c7abcb3cffc0a5')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd buildbot

  patch -Np1 -i ../ignore-invalid-escape-sequence.patch
  # This test relies on VERSION_ID field in /etc/os-release. On Arch Linux this
  # field is missing.
  patch -Np1 -i ../skip-linux-distro-test.patch
}

check() {
  cd buildbot/master
  TZ=UTC python setup.py test
}

package() {
  cd buildbot/master
  python setup.py install --root="$pkgdir" --optimize=1
}

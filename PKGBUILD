# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgdesc='The Continuous Integration Framework'
pkgver=1.8.0
# `git rev-parse v$pkgver`
_tag_rev=5b1106e9e2898cff174e7dd4f03dfd80a5c79f16
pkgrel=1
arch=(any)
url='https://buildbot.net'
license=(GPL2)
depends=(python-twisted python-jinja python-zope-interface python-future
         python-sqlalchemy-migrate python-dateutil python-txaio
         python-autobahn python-pyjwt python-yaml)
makedepends=(git)
checkdepends=(python-boto3 python-lz4 python-treq python-txrequests
              python-mock python-moto
              python-buildbot-pkg=$pkgver buildbot-worker=$pkgver python-buildbot-www=$pkgver
              python-pip openssh)
optdepends=(
  'python-boto3: for AWS EC2 latent worker'
  'python-lz4: to compress logs using lz4'
  'python-treq: for using HTTP requests as steps'
  'python-txrequests: for using HTTP requests as steps'
)
source=("git+https://github.com/buildbot/buildbot?signed#tag=$_tag_rev")
sha256sums=('SKIP')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # Pierre Tardy <tardyp@gmail.com>
)

build() {
  cd buildbot/master
  python setup.py build
}

check() {
  cd buildbot/master

  # https://github.com/spulec/moto/issues/1924
  export AWS_SECRET_ACCESS_KEY=foobar_secret
  export AWS_ACCESS_KEY_ID=foobar_key

  pip install --root="$srcdir"/tmp_install .

  export PYTHONPATH="$srcdir"/tmp_install/usr/lib/python3.7/site-packages
  export PATH="$PATH:$srcdir/tmp_install/usr/bin"
  TZ=UTC trial3 --rterrors buildbot
}

package() {
  cd buildbot/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgdesc='The Continuous Integration Framework'
pkgver=2.2.0
pkgrel=1
arch=(any)
url='https://buildbot.net'
license=(GPL2)
depends=(python-twisted python-jinja python-zope-interface
         python-sqlalchemy-migrate python-dateutil python-txaio
         python-autobahn python-pyjwt python-yaml)
checkdepends=(python-boto3 python-lz4 python-treq python-txrequests
              python-mock python-moto python-parameterized
              python-buildbot-pkg=$pkgver buildbot-worker=$pkgver python-buildbot-www=$pkgver
              openssh)
makedepends=(python-setuptools)
optdepends=(
  'python-boto3: for AWS EC2 latent worker'
  'python-lz4: to compress logs using lz4'
  'python-treq: for using HTTP requests as steps'
  'python-txrequests: for using HTTP requests as steps'
  'python-pyopenssl: to use SSL/TLS in mail or IRC notifiers'
  'pass: to use SecretInPass provider'
  'vault: to use SecretInVault provider'
)
source=("https://github.com/buildbot/buildbot/releases/download/v$pkgver/buildbot-v$pkgver.gitarchive.tar.gz"{,.sig})
sha256sums=('126adffe288f9b6df2d3a4eca49be757f65c01bc0c551d562681b4cf5ca460fb'
            'SKIP')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # Pierre Tardy <tardyp@gmail.com>
)

build() {
  cd buildbot-$pkgver/master
  python setup.py build
}

check() {
  cd buildbot-$pkgver/master

  # https://github.com/spulec/moto/issues/1924
  export AWS_SECRET_ACCESS_KEY=foobar_secret
  export AWS_ACCESS_KEY_ID=foobar_key

  python setup.py install --root="$srcdir"/tmp_install

  export PYTHONPATH="$srcdir"/tmp_install/usr/lib/python3.7/site-packages
  export PATH="$PATH:$srcdir/tmp_install/usr/bin"
  TZ=UTC trial3 --rterrors buildbot
}

package() {
  cd buildbot-$pkgver/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

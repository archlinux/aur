# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgdesc='The Continuous Integration Framework'
pkgver=2.3.0
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
sha256sums=('eb57afd7f8005b84bc345903211e4a3ff1a4d6a162eb55a37ab9bd445044476e'
            'SKIP')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # Pierre Tardy <tardyp@gmail.com> (@tardyp on GitHub)
  'FD0004A26EADFE43A4C3F249C6F7AE200374452D'  # Povilas Kanapickas <povilas@radix.lt> (@p12tic on GitHub)
)

build() {
  cd buildbot-$pkgver/master
  python setup.py build
}

check() {
  cd buildbot-$pkgver/master

  python setup.py install --root="$srcdir"/tmp_install

  export PYTHONPATH="$srcdir"/tmp_install/usr/lib/python3.7/site-packages
  export PATH="$PATH:$srcdir/tmp_install/usr/bin"
  TZ=UTC trial3 --rterrors buildbot
}

package() {
  cd buildbot-$pkgver/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

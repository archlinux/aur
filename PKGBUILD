# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgdesc='The Continuous Integration Framework'
pkgver=2.1.0
pkgrel=1
arch=(any)
url='https://buildbot.net'
license=(GPL2)
depends=(python-twisted python-jinja python-zope-interface python-future
         python-sqlalchemy-migrate python-dateutil python-txaio
         python-autobahn python-pyjwt python-yaml)
checkdepends=(python-boto3 python-lz4 python-treq python-txrequests
              python-mock python-moto python-parameterized
              python-buildbot-pkg=$pkgver buildbot-worker=$pkgver python-buildbot-www=$pkgver
              python-pip openssh)
optdepends=(
  'python-boto3: for AWS EC2 latent worker'
  'python-lz4: to compress logs using lz4'
  'python-treq: for using HTTP requests as steps'
  'python-txrequests: for using HTTP requests as steps'
  'python-pyopenssl: to use SSL/TLS in mail or IRC notifiers'
)
source=("https://github.com/buildbot/buildbot/releases/download/v$pkgver/buildbot-v$pkgver.gitarchive.tar.gz"{,.sig}
        install-test-files.patch)
sha256sums=('a15491995d9168e8e50c2f958ce4bfef2984ca25dee21bd694c8ea0a12e47509'
            'SKIP'
            'b6c583a85555c8dc20a84a0402539dbadd854408a15d6424841e59a6daa47fe2')
validpgpkeys=(
  '390EB159056ED56F66AB1092AECD456B4D2531FC'  # Pierre Tardy <tardyp@gmail.com>
)

prepare() {
  cd buildbot-$pkgver
  patch -Np1 -i ../install-test-files.patch
}

build() {
  cd buildbot-$pkgver/master
  python setup.py build
}

check() {
  cd buildbot-$pkgver/master

  # https://github.com/spulec/moto/issues/1924
  export AWS_SECRET_ACCESS_KEY=foobar_secret
  export AWS_ACCESS_KEY_ID=foobar_key

  pip install --root="$srcdir"/tmp_install .

  export PYTHONPATH="$srcdir"/tmp_install/usr/lib/python3.7/site-packages
  export PATH="$PATH:$srcdir/tmp_install/usr/bin"
  TZ=UTC trial3 --rterrors buildbot
}

package() {
  cd buildbot-$pkgver/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

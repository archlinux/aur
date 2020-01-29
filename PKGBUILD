# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgdesc='The Continuous Integration Framework'
pkgver=2.6.0
_bb_contrib_commit=ada3c8f30ca7e1b6bb260e2e5971053fbd254333
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
              openssh git)
makedepends=(python-setuptools git)
optdepends=(
  'python-boto3: for AWS EC2 latent worker'
  'python-lz4: to compress logs using lz4'
  'python-treq: for using HTTP requests as steps'
  'python-txrequests: for using HTTP requests as steps'
  'python-pyopenssl: to use SSL/TLS in mail or IRC notifiers'
  'python-docker: for Docker latent worker'
  'pass: to use SecretInPass provider'
  'vault: to use HashiCorpVaultSecretProvider provider'
)
source=("https://github.com/buildbot/buildbot/releases/download/v$pkgver/buildbot-v$pkgver.gitarchive.tar.gz"{,.sig}
        "git+https://github.com/buildbot/buildbot-contrib.git#commit=$_bb_contrib_commit")
sha256sums=('0ac835b58db309bebcf00fa77687385551833b3dac1c66aa671d271776050c19'
            'SKIP'
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

  site_packages_path=$(python -c 'import site; print(site.getsitepackages()[0])')

  python setup.py install --root="$srcdir"/tmp_install
  # Copy files over for integration tests
  cp -v buildbot/test/integration/*.tgz "$srcdir"/tmp_install$site_packages_path/buildbot/test/integration/

  export PYTHONPATH="$srcdir"/tmp_install$site_packages_path
  export PATH="$PATH:$srcdir/tmp_install/usr/bin"
  TZ=UTC trial3 --rterrors buildbot
}

package() {
  cd buildbot-$pkgver/master
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/buildbot-contrib/master/contrib/systemd/buildbot@.service \
    -t "$pkgdir"/usr/lib/systemd/system/
}

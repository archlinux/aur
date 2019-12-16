# Maintainer: Jackson McClintock <jacksondm33@gmail.com>
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=mediagoblin-git
pkgver=0.9.0.r284.gb8922642
pkgrel=1
pkgdesc='A free software media publishing platform'
arch=('i686' 'x86_64')
url='http://mediagoblin.org'
license=('AGPL')
provides=('mediagoblin')
conflicts=('mediagoblin')
depends=('python' 'python-certifi' 'python-lxml' 'sqlite' 'python-pillow' 'python-virtualenv' 'npm' 'nodejs')
optdepends=(
  'postgresql: to use the postgresql database backend'
  'python-psycopg2: to use the postgresql database backend'
  'python-gobject: to handle videos'
  'gst-libav: to handle videos'
  'gst-python: to handle videos'
  'gst-plugins-good: to handle videos'
  'gst-plugins-bad: to handle videos'
  'gst-plugins-ugly: to handle videos'
  )
backup=('etc/webapps/mediagoblin/paste_local.ini' 'etc/webapps/mediagoblin/mediagoblin_local.ini')
install=mediagoblin.install
makedepends=('git' 'automake')
source=(
  'mediagoblin::git+https://git.savannah.gnu.org/git/mediagoblin.git'
  'mediagoblin-paster.service'
  'mediagoblin-celeryd.service'
  'paste_local.ini'
  'mediagoblin_local.ini'
  'mediagoblin-tmpfiles.conf'
  'flup_python3.patch'
)
sha256sums=('SKIP'
            '2a02c90dcc8f69ac2a072044d3e4281347ed048c2610cb2e11295e4876cfb409'
            'f636d02f86d2dab5ecc901be5b0f7c42366500393f22dfdc7e354ca299fca65a'
            'ac914d60886d9bf53d3f40b8b00a60d46ada1cac9130210e045a4776d898e884'
            '9adf338f5dbfb94ee7ae29433091b6991a1fa39a6135a8295f9f1cc1fde0edc1'
            'abb6c4c4e54d4372adfe67ab22371ad625505098311955e5ae8e34102b059d47'
            'e03e3187c8351384d59f7ddd9ae49c149124c6be3ccd0df737233b4330027676')

pkgver() {
  cd "$srcdir/mediagoblin"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/mediagoblin"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/mediagoblin"

  ./bootstrap.sh
  ./configure --with-python3
  make || make
  ./bin/easy_install flup
  patch -p 1 -i "$srcdir/flup_python3.patch"
}

package() {
  cd "$srcdir/mediagoblin"
  rm -rf .git .gitignore

  install -dm755 "$pkgdir"/usr/share/webapps/mediagoblin/
  cp -a . "$pkgdir"/usr/share/webapps/mediagoblin

  cd "$pkgdir"/usr/share/webapps/mediagoblin
  find . -name '*.pyc' -delete
  find . -type f -exec sed -i "s|$srcdir/mediagoblin|/usr/share/webapps/mediagoblin|g" {} \;

  install -dm755 "$pkgdir"/var/lib/mediagoblin
  install -dm755 "$pkgdir"/etc/webapps/mediagoblin

  install -Dm644 "$srcdir"/paste_local.ini "$pkgdir"/etc/webapps/mediagoblin/paste_local.ini
  ln -s /etc/webapps/mediagoblin/paste_local.ini "$pkgdir"/usr/share/webapps/mediagoblin/paste_local.ini
  install -Dm644 "$srcdir"/mediagoblin_local.ini "$pkgdir"/etc/webapps/mediagoblin/mediagoblin_local.ini
  ln -s /etc/webapps/mediagoblin/mediagoblin_local.ini "$pkgdir"/usr/share/webapps/mediagoblin/mediagoblin_local.ini

  ln -s /var/lib/mediagoblin/ "$pkgdir"/usr/share/webapps/mediagoblin/user_dev

  install -Dm644 "$srcdir"/mediagoblin-paster.service "$pkgdir"/usr/lib/systemd/system/mediagoblin-paster.service
  install -Dm644 "$srcdir"/mediagoblin-celeryd.service "$pkgdir"/usr/lib/systemd/system/mediagoblin-celeryd.service
  install -Dm644 "$srcdir"/mediagoblin-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/mediagoblin.conf
}

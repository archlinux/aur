# Maintainer: Dmitry Golgowski <d.westcoast@aol.com>
# Contributor: Jackson McClintock <jacksondm33@gmail.com>
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=mediagoblin-git
pkgver=0.15.0
pkgrel=1
pkgdesc='A free software media publishing platform'
arch=('x86_64')
url='https://mediagoblin.org'
license=('AGPL-3.0-or-later')
provides=('mediagoblin')
conflicts=('mediagoblin')
depends=('python' 'python-pillow' 'sqlite')
makedepends=('git' 'autoconf' 'automake' 'npm' 'nodejs' 'python-setuptools')
optdepends=(
  'postgresql: postgresql database backend'
  'python-psycopg2: postgresql database backend'
  'python-gobject: video support'
  'gst-libav: video support'
  'gst-python: video support'
  'gst-plugins-good: video support'
  'gst-plugins-bad: video support'
  'gst-plugins-ugly: video support'
)
backup=('etc/webapps/mediagoblin/paste_local.ini' 'etc/webapps/mediagoblin/mediagoblin_local.ini')
install=mediagoblin.install
source=(
  "mediagoblin::git+https://git.sr.ht/~mediagoblin/mediagoblin#tag=v${pkgver}"
  'mediagoblin-web.service'
  'mediagoblin-celery.service'
  'paste_local.ini'
  'mediagoblin_local.ini'
  'mediagoblin-tmpfiles.conf'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/mediagoblin"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/mediagoblin"
  ./autogen.sh
  ./configure --with-docker=no
  make build VENV_EDITABLE=-e
}

package() {
  cd "$srcdir/mediagoblin"
  rm -rf .git .gitignore .gitmodules

  install -dm755 "$pkgdir"/usr/share/webapps/mediagoblin/
  cp -a . "$pkgdir"/usr/share/webapps/mediagoblin

  cd "$pkgdir"/usr/share/webapps/mediagoblin
  find . -name '*.pyc' -delete
  find . -type f -exec sed -i "s|$srcdir/mediagoblin|/usr/share/webapps/mediagoblin|g" {} \;

  install -dm755 "$pkgdir"/var/lib/mediagoblin
  install -dm755 "$pkgdir"/etc/webapps/mediagoblin

  install -Dm644 "$srcdir"/paste_local.ini "$pkgdir"/etc/webapps/mediagoblin/paste_local.ini
  ln -sf /etc/webapps/mediagoblin/paste_local.ini "$pkgdir"/usr/share/webapps/mediagoblin/paste_local.ini
  install -Dm644 "$srcdir"/mediagoblin_local.ini "$pkgdir"/etc/webapps/mediagoblin/mediagoblin_local.ini
  ln -sf /etc/webapps/mediagoblin/mediagoblin_local.ini "$pkgdir"/usr/share/webapps/mediagoblin/mediagoblin_local.ini

  ln -sf /var/lib/mediagoblin/ "$pkgdir"/usr/share/webapps/mediagoblin/user_dev

  install -Dm644 "$srcdir"/mediagoblin-web.service "$pkgdir"/usr/lib/systemd/system/mediagoblin-web.service
  install -Dm644 "$srcdir"/mediagoblin-celery.service "$pkgdir"/usr/lib/systemd/system/mediagoblin-celery.service
  install -Dm644 "$srcdir"/mediagoblin-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/mediagoblin.conf
}

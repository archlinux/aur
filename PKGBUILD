# Maintainer: cr0mag <phillips.julian AT gmail DOT com>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# wokd
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('wokd')

# Version
pkgver=2.5.0
pkgrel=2
#epoch=

# Generic
pkgdesc="Webserver originated from Kimchi - a cherrypy framework for multi-purpose plug-ins"
arch=('any')
url="https://github.com/kimchi-project/wok/"
license=('LGPL' 'Apache')
groups=('kimchi-project')

# Dependencies
depends=('nginx'
         'openssl'
         'python2-cherrypy'
         'python2-cheetah'
	 'python2-pam'
	 'python2-m2crypto'
         'python2-jsonschema'
	 'python2-psutil'
         'python2-ldap'
         'python2-lxml'
         'python2-ordereddict'
         'ttf-font-awesome-4'
         'websockify')
#optdepends=()
makedepends=('git' 'libxslt' 'logrotate')
#checkdepends=()

# Package Relations
#provides=()
conflicts=('wokd-git')
#replaces=()

# Others
backup=('etc/wok/wok.conf')
#options=()
install=wokd.install
#changelog=

# Sources
source=('https://github.com/kimchi-project/wok/archive/'${pkgver}'.tar.gz')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('2fd4c4ec3bd98e299e6f9896e82ed341154bb61b0e3027b0f40210ca50c8520b')
#pkgver() {
#}

prepare() {
  cd "$srcdir/wok-${pkgver}"
  #replaces previous python.patch file
  sed --in-place 's/^#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' src/wok/proxy.py
  #can't find upper-case PAM module; better solution?
  sed --in-place 's/^import PAM/import pam/' src/wok/auth.py
  #workaround for https://github.com/kimchi-project/wok/issues/234
  sed --in-place 's/cherrypy.engine.timeout_monitor.unsubscribe()/#cherrypy.engine.timeout_monitor.unsubscribe()/' src/wok/server.py
}

build() {
  cd "$srcdir/wok-${pkgver}"
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package () {
  cd "$srcdir/wok-${pkgver}"
  make DESTDIR=$pkgdir install
}

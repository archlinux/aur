# Maintainer: samip537 <sm+aur AT samip DOT fi>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# wokd
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('wokd')

# Version
pkgver=3.0.0
pkgrel=3
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
         'python-cherrypy'
         'python-cheetah3'
         'python-pam'
         'python-m2crypto'
         'python-jsonschema'
         'python-psutil'
         'python-ldap'
         'python-lxml'
         'python-ordered-set'
         'python-numpy'
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
sha256sums=('34ca6f5e9cc97515cc9e5d3ba9cb64bde88fa40acff751c3bed5aa2f89896f10')
#pkgver() {
#}

prepare() {
  cd "$srcdir/wok-${pkgver}"
  #replaces previous python.patch file
  #sed --in-place 's/^#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' src/wok/proxy.py
  #can't find upper-case PAM module; better solution?
  sed --in-place 's/^import PAM/import pam/' src/wok/auth.py
  #workaround for https://github.com/kimchi-project/wok/issues/234
  #sed --in-place 's/cherrypy.engine.timeout_monitor.unsubscribe()/#cherrypy.engine.timeout_monitor.unsubscribe()/' src/wok/server.py
}

build() {
  cd "$srcdir/wok-${pkgver}"
  PYTHON=/usr/bin/python3 ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var 
  #PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package () {
  cd "$srcdir/wok-${pkgver}"
  make DESTDIR=$pkgdir install
}
# Maintainer: Daichi Shinozaki
pkgname=enlive-git
pkgver=20121111
pkgrel=1
pkgdesc="A selector-based (a la CSS) templating library for Clojure"
arch=(i686 x86_64)
url="http://github.com/cgrant/enlive"
license=("EPL")
depends=('java-environment' 'clojure' 'leiningen')
makedepends=('apache-ant' 'git')
provides=('enlive')

_gitroot=git://github.com/cgrand/enlive.git
_gitname=enlive

build() {
  cd ${srcdir}

  msg "Connecting to github.com GIT server..."
  if [ -d ${_gitname} ]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting ant build process..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build
  cd ${_gitname}-build

  lein deps
  lein jar
}
package() {
  cd ${_gitname}-build
  mkdir -p ${pkgdir}/usr/share/clojure
  install -m 644 -D ${srcdir}/${pkgname//-git/}-build/target/${pkgname//-git/}*jar ${pkgdir}/usr/share/clojure/
}

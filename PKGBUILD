# Maintainer: Stephen Martin <stephensrmmartin at gmail dot com>
pkgname=shiny-server-git
pkgver=20160223
pkgrel=1
pkgdesc="Open-source version of the shiny web development framework server"
arch=('i686' 'x86_64')
url="http://www.rstudio.com/shiny/server/install-opensource"
license=('AGPL')
depends=('r')
makedepends=('git' 'python2' 'cmake' 'r' 'gcc6')
install='accounts.install'
backup=('etc/shiny-server/shiny-server.conf')
source=('shiny-server::git+https://github.com/rstudio/shiny-server.git' 
        'shiny-server.service')
pkver(){
  cd "$srcdir/$pkgname"
  git describe --long|sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

_gitroot=https://github.com/rstudio/shiny-server.git
_gitname=shiny-server
prepare(){
  # Vigorously force the use of python2
  cd $srcdir
  find -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
            -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
                -e 's_^#!/usr/bin/python$_&2_' \
                    -e "s_'python'_'python2'_" -i {} \;
  }

build() {
  cd "$srcdir/$_gitname"
  mkdir tmp
  cd tmp
  # More python2 hackery
  DIR=`pwd`
  PATH=$DIR/../bin/:$PATH
  ln -s `which python2` ../bin/python
  export _PYTHON=`which python2`
  export PYTHON=`which python2`

  # Node fails with gcc7
  export CC=/bin/gcc-6
  export CXX=/bin/g++-6

  # CMake
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON="$_PYTHON" ../
  make

  mkdir ../build
  (cd .. && bin/npm --python="$PYTHON" install)
  (cd .. && bin/node ext/node/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js --python="$PYTHON" rebuild)
}

package() {
  cd "$srcdir/$_gitname/tmp"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/shiny-server/
  ln -s /usr/shiny-server/bin/shiny-server $pkgdir/usr/bin/shiny-server
  install -m 644 -D $srcdir/shiny-server.service $pkgdir/usr/lib/systemd/system/shiny-server.service
  install -m 644 -D $srcdir/$_gitname/config/default.config $pkgdir/etc/shiny-server/shiny-server.conf
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         '78811ea3ebc75bf875e13e202e4587ae')

# Maintainer: Stephen Martin <stephensrmmartin at gmail dot com>
pkgname=shiny-server-git
pkgver=1.5.6.875.r37.g66e45ab
pkgrel=1
epoch=1
pkgdesc="Open-source version of the shiny web development framework server"
arch=('i686' 'x86_64')
url="http://www.rstudio.com/shiny/server/install-opensource"
license=('AGPL')
depends=('r')
makedepends=('git' 'python2' 'cmake' 'r' 'gcc6')
backup=('etc/shiny-server/shiny-server.conf')
install='accounts.install'
source=('shiny-server::git+https://github.com/rstudio/shiny-server.git'
        'shiny-server.service')
sha256sums=('SKIP'
            '8486c5e5d2c8362daf2c6826ea702e3f49dd6ee64c30ca79bdf2f4edbe0d2744')
_gitroot=https://github.com/rstudio/shiny-server.git
_gitname=shiny-server
 
pkgver(){
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/v//;s/([^-]*-g)/r\1/;s/-/./g'
}
 
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
  PATH=$PWD/../bin/:$PATH
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
  (cd .. && external/node/install-node.sh)
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

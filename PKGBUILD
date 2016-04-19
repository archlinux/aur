# $Id$
# Current Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Original Maintainer: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Original Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Original Maintainer: tocer <tocer.deng@gmail.com>
# Original Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Original Maintainer: Kiswono Prayogo <kiswono@gmail.com>
# Original maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Original contributor: tocer <tocer.deng@gmail.com>

pkgname=v8-3.20
pkgver=3.20.17
pkgrel=2
pkgdesc='A fast and modern javascript engine (old 3.20 version required for Mapserver)'
arch=('i686' 'x86_64')
url='http://code.google.com/p/v8'
license=('BSD')
depends=('gcc-libs' 'readline' 'icu')
options=('!emptydirs' '!strip')
makedepends=('subversion' 'python2' 'python2-virtualenv' 'git')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "gyp::git+https://chromium.googlesource.com/external/gyp"
        "v8.pc"
        "d8")    
sha256sums=('SKIP'
            'SKIP'
            '2b054309df9af9fb2e3e14527e88360b44745649b4866e592fb357ac90935f5d'
            'cfd0712ee91d30b62e761da130e194c18f2b92a7f1654fb4af49f96ae9ce3e1b')

provides=('v8')
conflicts=('v8')    
provides=('v8')
conflicts=('v8')

[[ "$CARCH" = 'i686' ]]   && ARCH=ia32
[[ "$CARCH" = 'x86_64' ]] && ARCH=x64

prepare() {
  export PATH=`pwd`/depot_tools:"$PATH"
  
  msg2 "Creating Python Virtual Environment"
  virtualenv2 -q venv
  msg2 "Activating Python Virtual Environment"
  source venv/bin/activate > /dev/null
  msg2 "Installing dependencies in the Virtual Environment"
  
  if [ ! -d "v8" ]; then
    msg2 "Fetching V8 code"
    yes | fetch v8
  fi

  cd v8

  msg2 "Syncing"
  gclient sync
  
  git checkout tags/$pkgver

  sed "s/@VERSION@/$pkgver/g" -i "$srcdir/v8.pc"
}

build() {
  cd v8
  
  # -Werror causes errors with newer versions of GCC
  sed -i 's/-Werror//' build/standalone.gypi build/toolchain.gypi
  
  library=shared make -j8 x64.release
}

package() {
  cd v8
  
  install -Dm755 out/$ARCH.release/d8 $pkgdir/opt/v8/bin/d8
  install -Dm755 out/$ARCH.release/lib.target/libv8.so $pkgdir/opt/v8/lib/libv8.so

  install -d $pkgdir/opt/v8/include
  install -Dm644 include/*.h $pkgdir/opt/v8/include

  install -d $pkgdir/opt/v8/licenses/v8
  install -m644 LICENSE* ${pkgdir}/opt/v8/licenses/v8
  
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/opt/v8/lib" > ${pkgdir}/etc/ld.so.conf.d/v8.conf
}

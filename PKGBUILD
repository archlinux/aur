# Maintainer: delitako <delitako at delitako dot xyz>

pkgname=stumpwm-ql
_stumpver=20.11
_qlver=2021_06_30
pkgver="${_stumpver}_${_qlver}"
pkgrel=4
pkgdesc='Stumpwm tiling window manager built with dependencies from quicklisp'
arch=('x86_64')
url='https://stumpwm.github.io'
license=('GPL2')
makedepends=('quicklisp-bootstrap' 'sbcl')
provides=('stumpwm')
conflicts=('stumpwm' 'stumpwm-git')
source=("$pkgname-$_stumpver.tar.gz::https://github.com/stumpwm/stumpwm/archive/refs/tags/$_stumpver.tar.gz"
        stumpwm.desktop load-ql-systems.patch)
sha256sums=('8c9aaab9ad7cbc35e705c085e8661b20d88b84e750f7b1859e65a8b2f1ad562c'
            'bbcf4930a609e7073b1fec9332d1bf314b94ebd8315c227c75f8b818ecdc666d'
            '5105db78328aed70e8d071ff02f35d10caa745803df8e71074a444cb7c6afefc')
options=('!strip' '!makeflags')

prepare() {
  patch stumpwm-$_stumpver/load-stumpwm.lisp.in load-ql-systems.patch
}

build() {
  # Vars
  disturl="http://beta.quicklisp.org/dist/quicklisp/${_qlver//_/-}/distinfo.txt"
  qlpath=quicklisp

  # Clear quicklisp directory if it exists
  if [ -d "$qlpath" ]; then
      rm -rf "$qlpath"
  fi

  # Install quicklisp
  sbcl --no-sysinit --no-userinit \
       --load "$(quicklisp-bootstrap)" \
       --eval "(quicklisp-quickstart:install :dist-url \"${disturl}\" :path \"${qlpath}\")" \
       --eval '(ql:quickload "clx")' \
       --eval '(ql:quickload "cl-ppcre")' \
       --eval '(ql:quickload "alexandria")' \
       --quit

  # Make
  cd stumpwm-$_stumpver
  ./autogen.sh
  ./configure --prefix=/usr --with-module-dir=/usr/share/stumpwm/contrib
  make
}

package() {
  # Install xsession entry
  install -Dm644 stumpwm.desktop "$pkgdir/usr/share/xsessions/stumpwm.desktop"

  # Everything else
  cd stumpwm-$_stumpver
  make destdir="$pkgdir" install
  install -Dm644 sample-stumpwmrc.lisp "$pkgdir/usr/share/stumpwm/stumpwmrc.example"
}

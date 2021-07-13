# Maintainer: delitako <delitako at delitako dot xyz>

pkgname=stumpwm-ql
_stumpver=20.11
_qlver=2021_06_30
pkgver="${_stumpver}_${_qlver}"
pkgrel=1
pkgdesc='Stumpwm tiling window manager built with dependencies from quicklisp'
arch=('x86_64')
url='https://stumpwm.github.io'
license=('GPL2')
makedepends=('quicklisp-bootstrap' 'sbcl')
provides=('stumpwm')
conflicts=('stumpwm' 'stumpwm-git')
source=("$pkgname-$_stumpver.tar.gz::https://github.com/stumpwm/stumpwm/archive/refs/tags/$_stumpver.tar.gz"
        stumpwm.desktop)
sha256sums=('8c9aaab9ad7cbc35e705c085e8661b20d88b84e750f7b1859e65a8b2f1ad562c'
            'a297e9ded7854f06131b2440f46b5d903933e81aeabd31cb834e01672c6b2ac4')
options=('!strip' '!makeflags')

build() {
  # Vars
  disturl="http://beta.quicklisp.org/dist/quicklisp/${_qlver//_/-}/distinfo.txt"
  qlpath="$(pwd)/quicklisp"

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

  # Init file to load quicklisp
  echo "(load \"${qlpath}/setup.lisp\")" > quicklisp/.sbclrc

  # Make
  cd stumpwm-$_stumpver
  ./autogen.sh
  ./configure --prefix=/usr --with-module-dir=/usr/share/stumpwm/contrib
  # Trick SBCL into loading quicklisp
  HOME="${qlpath}" make
}

package() {
  # Install xsession entry
  install -Dm644 stumpwm.desktop "$pkgdir/usr/share/xsessions/stumpwm.desktop"

  # Everything else
  cd stumpwm-$_stumpver
  make destdir="$pkgdir" install
  install -Dm644 sample-stumpwmrc.lisp "$pkgdir/usr/share/stumpwm/stumpwmrc.example"
}

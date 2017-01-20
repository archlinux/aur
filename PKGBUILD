# Contributor: Chris Dunder <echo Y2R1bmRlckBnbWFpbC5jb20K | base64 -d>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: olvar <beren dot olvar (at) gmail dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stumpwm
pkgver=1.0.0
pkgrel=1
pkgdesc="A tiling, keyboard-driven window manager written in common lisp"
arch=('i686' 'x86_64')
url="https://stumpwm.github.io"
license=('GPL2')
provides=('stumpwm')

source=($pkgname-$pkgver.tar.gz::https://github.com/stumpwm/stumpwm/archive/v1.0.0.tar.gz)
md5sums=('40b3def66afc2aacff818936e06ce74c')

makedepends=('common-lisp' 'cl-asdf' 'clx-git' 'cl-ppcre')
optdepends=('xorg-xprop: for stumpish (StumpWM Interactive Shell)'
            'rlwrap: for stumpish completion and history'
            'emacs: Edit and eval stumpwm code with M-x stumpwm-mode'
            'alsa-utils: for amixer.lisp (control audio volume)'
            'aumix: for aumix.lisp (control audio volume)'
            'mpd: for mpd.lisp (control the mpd)'
            'surfraw: for surfraw.lisp (surf the Internet)'
            'clx-truetype: for ttf-fonts.lisp (Xft fonts)')

# Binary will not run other
options=(!strip)  # Thanks to sidereus for pointing this out
_contribdest=/usr/share/stumpwm/contrib

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh
  ./configure  --prefix=/usr --with-module-dir=${_contribdest}
  make
} 

package() {
  cd ${srcdir}/${pkgname}

  make destdir="$pkgdir/" install

  install -Dm 644 sample-stumpwmrc.lisp \
	  ${pkgdir}/usr/share/${_pkgname}/stumpwmrc.sample

  # contrib modules
  install -d ${pkgdir}${_contribdest}
  cp -dr --no-preserve=ownership ${srcdir}/${pkgname}-contrib/* \
     ${pkgdir}${_contribdest}

  # stumpish
  install -Dm755 ${pkgdir}${_contribdest}/util/stumpish/stumpish \
	  ${pkgdir}/usr/bin/stumpish

  rm -rf ${pkgdir}${_contribdest}/util/stumpish

  # emacs mode
  cd ${pkgdir}/${_contribdest}/util/swm-emacs
  install -d ${pkgdir}/usr/share/emacs/site-lisp/
  for _i in *.el 
  do
    install -Dm644 ${_i} ${pkgdir}/usr/share/emacs/site-lisp/${_i}
  done
}

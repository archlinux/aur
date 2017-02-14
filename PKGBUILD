# Contributor: Chris Dunder <echo Y2R1bmRlckBnbWFpbC5jb20K | base64 -d>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: olvar <beren dot olvar (at) gmail dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stumpwm-git
_pkgname=stumpwm
pkgver=1.0.0.r55.gff94372
pkgrel=2
pkgdesc="A tiling, keyboard-driven window manager written in common lisp"
arch=('i686' 'x86_64')
url="https://stumpwm.github.io"
license=('GPL2')
conflicts=('stumpwm')
provides=('stumpwm')

source=(${_pkgname}::git+https://github.com/stumpwm/stumpwm
        ${_pkgname}-contrib-git::git+https://github.com/stumpwm/stumpwm-contrib)
md5sums=('SKIP'
         'SKIP')

makedepends=('common-lisp' 'cl-asdf' 'clx-git' 'cl-ppcre' 'cl-alexandria')
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

pkgver() {
  cd ${srcdir}/${_pkgname}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

_contribdest=/usr/share/stumpwm/contrib

build() {
  cd ${srcdir}/${_pkgname}

  autoconf
  ./configure --prefix=/usr --with-module-dir=${_contribdest}
  make
} 

package() {
  cd ${srcdir}/${_pkgname}

  make destdir="$pkgdir/" install

  install -Dm 644 sample-stumpwmrc.lisp \
	  ${pkgdir}/usr/share/${_pkgname}/stumpwmrc.sample

  # contrib modules
  install -d ${pkgdir}${_contribdest}
  cp -dr --no-preserve=ownership ${srcdir}/${_pkgname}-contrib-git/* \
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

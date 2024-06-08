# Maintainer: yustin <#archlinux-proaudio@libera.chat>
# Co-Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=rju-git
_pkgname=rju
pkgver=0.19.r15.g359627c
pkgrel=3
pkgdesc='JackAudioToolkit'
arch=( 'x86_64' )
url='https://rohandrape.net/?t=rju'
license=( 'GPL-3.0-only' )
depends=( 'jack' 'libsamplerate' 'liblo' 'libsndfile' 'libxext' 'libx11' 'libpng' 'glibc' 'gcc-libs' 'ncurses' )
makedepends=( 'git' 'asciidoc' 'vst2sdk' 'sed' )
options=( '!buildflags')
conflicts=( 'rju' )
source=( "git+https://gitlab.com/rd--/rju.git"
         "git+https://gitlab.com/rd--/r-common.git"
         "jack.plumbing"
       )
  
sha256sums=('SKIP'
            'SKIP'
            '6974f25a6d3ad988564fe307f92e3a70d919dc20b06b14c2d8e4299fdbfd75ba'
            )

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git config --file=.gitmodules submodule.cmd/r-command.url "$srcdir/r-command"
  git -c protocol.file.allow=always submodule update --init
  cd cmd
  sed 's#VST_SDK = $(HOME)/opt/build/vst3_sdk#VST_SDK = /usr/src/vst2sdk#' -i Makefile
  sed "/int osc/s/void \*d/lo_message d/" -i rju-dl.c
  sed "/int osc/s/void \*d/lo_message d/" -i rju-lxvst.cpp
}

build() {
  cd "$srcdir/$_pkgname/cmd"
  make all
 
  cd ${srcdir}/${_pkgname}/md
  for i in *.md ; do asciidoc $i; done
}

package () {
  mkdir -p ${pkgdir}/usr/{bin,include,share/rju}
  cd ${_pkgname}/cmd
  make install prefix=${pkgdir}/usr
  cd ../md
  cp -r *.html announce/ ${pkgdir}/usr/share/rju
  install -Dm644 "$srcdir/jack.plumbing" "${pkgdir}/usr/share/rju/rju.plumbing.example"
}

# vim: ts=2 sw=2 et:


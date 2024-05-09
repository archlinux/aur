# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Maintainer: yustin <#archlinux-proaudio@libera.chat>

pkgname=rju-git
_pkgname=rju
pkgver=0.19.r15.g359627c
pkgrel=1
pkgdesc='JackAudioToolkit'
arch=('x86_64')
url='https://rohandrape.net/?t=rju'
license=('GPL-2.0-only')
depends=( 'jack' 'libsamplerate' 'liblo' 'libsndfile' 'libxext' 'libx11' 'libpng')
makedepends=('git' 'cmake' 'asciidoc')
options=('!lto' '!buildflags')
conflicts=('rju')
provides=('rju')
source=( "git+https://gitlab.com/rd--/rju.git"
        "git+https://gitlab.com/rd--/r-common.git"
        "vstsdk::git+https://github.com/R-Tur/VST_SDK_2.4.git"
        "pedantic.patch"
        "pedantic2.patch"
       )
  
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '51310e029f4f861f63693593aa95c7f83854807afea466f3491b4ff715254bc7'
            '602d5b75419f0552f845af0b173cc5666cb2e80869ad7b5afa8bfa7661332378')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 < "$srcdir/pedantic.patch"
  git config --file=.gitmodules submodule.cmd/r-command.url "$srcdir/r-command"
  git -c protocol.file.allow=always submodule update --init
  cd "$srcdir/$_pkgname/cmd/r-common"
  patch -p1 < "$srcdir/pedantic2.patch"
}

build() {
  cd "$srcdir/$_pkgname/cmd"
  export CFLAGS+=" -I$srcdir/vstsdk/"
  export CXXFLAGS+=" -I$srcdir/vstsdk/"
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
  cp ${startdir}/jack.plumbing ${pkgdir}/usr/share/rju/rju.plumbing.example
}

# vim: ts=2 sw=2 et:


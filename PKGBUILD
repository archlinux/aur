# Maintainer: yustin <#archlimux-proaudio@libera.chat>

pkgname=rju-git
_pkgname=rju
_commit=8d86d170
pkgver=r220.8d86d170
pkgrel=1
pkgdesc='JackAudioToolkit'
arch=( 'x86_64' )
url='https://rohandrape.net/?t=rju'
license=( 'gpl' )
depends=( 'jack' 'asciidoc' 'libsamplerate' 'liblo' 'libsndfile' )
conflicts=( 'rju' )
source=( "git+https://gitlab.com/rd--/rju#commit=${_commit}"
         vstsdkpath.patch
         xrealloc.patch
       )
  
sha256sums=( 'SKIP'
             '11dfd9a08f916f3f03904b59ae3c49df4686a1ba86baa7b27773e050ed62380b'
             'fe261c0185256ff4a698f0a6e25a2789d197972863b3f17158af44a4452119f0'
           )

prepare() {
  cd ${srcdir}/${_pkgname}/cmd
  patch -p0 < ${startdir}/vstsdkpath.patch
  git submodule update --init --recursive
  patch -p0 < ${startdir}/xrealloc.patch
}

build() {
  cd ${srcdir}/${_pkgname}/cmd
  make all -j1
 
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


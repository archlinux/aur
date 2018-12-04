# Maintainer: Andrew Whatson <whatson@gmail.com>

_pkgname=faudio
_gitname=FAudio
pkgname=${_pkgname}-git
pkgver=r949.acc1aaa
pkgrel=2
pkgdesc="Accuracy-focused XAudio reimplementation for open platforms"
arch=('i686' 'x86_64')
url='https://github.com/FNA-XNA/FAudio'
license=('custom')
provides=("${_pkgname}")
depends=('sdl2' 'ffmpeg')
makedepends=('git')
source=('git+https://github.com/FNA-XNA/FAudio'
        'faudio.pc')
sha256sums=('SKIP'
            '19dfd14a8d04d88bec136f72486dee3d02f5c9e890abaebe62e1982164764c87')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}"
  FAUDIO_RELEASE=1 FAUDIO_FFMPEG=1 make
}

package() {
  cd "$srcdir/${_gitname}"
  _tmpdir="${pkgdir}/temp"
  FAUDIO_RELEASE=1 FAUDIO_FFMPEG=1 INSTALL_PREFIX="${_tmpdir}" make install
  install -D -t "${pkgdir}/usr/lib" "${_tmpdir}/lib"/*
  install -D -m644 -t "${pkgdir}/usr/include/${_gitname}" "${_tmpdir}/include"/*
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
  install -D -m644 -t "${pkgdir}/usr/lib/pkgconfig" ../faudio.pc
  rm -rf "${_tmpdir}"
}

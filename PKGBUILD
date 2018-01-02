# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=rbutil-git
pkgname=('rbutil-git' 'rbspeex-git')
pkgver=1.4.0.r1593.9f6ce046cb
pkgrel=1
arch=('x86_64')
url='http://www.rockbox.org/twiki/bin/view/Main/RockboxUtility'
license=('GPL')
makedepends=('crypto++' 'git' 'libusb' 'qt5-base' 'qt5-tools' 'speex' 'speexdsp')
source=('rbutil::git://git.rockbox.org/rockbox'
        'rbutil.desktop')
sha256sums=('SKIP'
            '6c7e7f8aa3dbbf1ace8cd43dd057649cfd329224e899fb83d739113a8a15be9d')

pkgver() {
  cd rbutil

  _tag='rbutil_1.4.0'

  printf "%s.r%s.%s" "${_tag#rbutil_}" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's/LIBS += -lz/LIBS += -lz -lcryptopp/' -i rbutil/rbutil/rbutilqt/rbutilqt.pro
}

build() {

  cd rbutil/rbutil/rbutilqt

  lrelease-qt5 rbutilqt.pro
  qmake-qt5
  make

  cd ../../tools/rbspeex

  make
}

package_rbutil-git(){
  pkgdesc='Rockbox Utility'
  depends=('gcc-libs' 'glibc' 'qt5-base' 'speex' 'speexdsp' 'zlib'
           'libusb-1.0.so')
  optdepends=('espeak: TTS engine'
              'festival: TTS engine'
              'flite: TTS engine'
              'rbspeex-git: Generate voice/talk files from external sources')
  provides=('rbutil')
  conflicts=('rbutil')

  cd rbutil/rbutil/rbutilqt

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,pixmaps}}
  install -m 755 RockboxUtility "${pkgdir}"/usr/bin/
  install -m 644 icons/rockbox-64.png "${pkgdir}"/usr/share/pixmaps/rbutil.png
  install -m 644 ../../../rbutil.desktop "${pkgdir}"/usr/share/applications/
}

package_rbspeex-git(){
  pkgdesc='Rockbox Speex Codec'
  depends=('glibc' 'speex' 'speexdsp')
  provides=('rbspeex')
  conflicts=('rbspeex')

  cd rbutil/tools

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 rbspeex{dec,enc} "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:

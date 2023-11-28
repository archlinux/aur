# Maintainer: Hayate Nakamura <hayatehay.njb at gmail dot com>
pkgname=jmpx-git
_pkgname=jmpx
pkgver=r66.c8a3c5f
pkgrel=1
pkgdesc="FM Stereo encoder with RDS support"
arch=('x86_64')
url="https://github.com/jontio/JMPX"
license=('MIT' 'BSD' 'Apache')
depends=('qt5-base' 'opus' 'jack')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git"
	"jmpx.desktop"
	"jmpx.png")
md5sums=('SKIP'
	'1ed74e10f90b110dfae60c4ee2b9f20d'
	'fb58bdaf4c4c6f236c15ba2a568dcd2d')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}/
  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}/"
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/pixmaps
  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}

  install -D -m644 ${srcdir}/jmpx.desktop ${pkgdir}/usr/share/applications/
  install -D -m644 ${srcdir}/jmpx.png ${pkgdir}/usr/share/pixmaps/jmpx.png
  install -D -m755 ${srcdir}/${_pkgname}/build/JMPX ${pkgdir}/usr/bin/JMPX
  install -D -m755 ${srcdir}/${_pkgname}/build/liblibJMPX.so.1.0.0 ${pkgdir}/usr/lib/liblibJMPX.so.1.0.0

  cd ${pkgdir}/usr/lib/
  ln -sf liblibJMPX.so.1.0.0 liblibJMPX.so
  ln -sf liblibJMPX.so.1.0.0 liblibJMPX.so.1
  ln -sf liblibJMPX.so.1.0.0 liblibJMPX.so.1.0

  cp ${srcdir}/${_pkgname}/JMPX/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}LICENSE
}


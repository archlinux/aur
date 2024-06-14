# Maintainer: Evert Vorster <superchief@evertvorster.com>
pkgname=oolite-git
_gitname=oolite
pkgver=1.91.0.7616.240527.f882b71.r0.f882b715d
pkgrel=1
pkgdesc="Open Source remake of Elite with many, many enhancements"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=('espeak' 'gnustep-base' 'sdl_mixer' 'sdl_image' 'glu' 'nspr' 'openal'
         'libpng' 'gcc-libs' 'libglvnd' 'glibc' 'zlib' 'sdl12-compat' 'bash'
         'libvorbis')
makedepends=('gnustep-make' 'curl' 'zip' 'mesa' 'gcc-objc')
optdepends=()
provides=('oolite')
conflicts=('oolite')
replaces=()
backup=()
options=()
install=
changelog=
source=(${_gitname}::git+https://github.com/OoliteProject/oolite)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
  git -C $_gitname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


prepare(){
  cd "${srcdir}/${_gitname}"
  echo "Initialize Submodules"
  cp .absolute_gitmodules .gitmodules
  git submodule update --init

  echo "Updating git submodules"
  git checkout -- .gitmodules

  # Workaround for -Werror=format-security default flag from GNUstep
  sed -Ei 's|(include \$\(GNUSTEP_MAKEFILES\)/common\.make)|\1\nCCFLAGS += -Wno-error=format-security\nOPTFLAG += -Wno-error=format-security|' GNUmakefile
  patch -Np1 -i ../../patch.patch


}


build() {
#  export CC=/usr/bin/gcc-13 CXX=/usr/bin/g++-13
  cd ${srcdir}/${_gitname}
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
#  ./configure --prefix=/usr
  make -f Makefile release
}

package() {
  cd ${srcdir}/${_gitname}

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{oolite,applications,pixmaps,doc/oolite}
  cp -r oolite.app/* ${pkgdir}/usr/share/oolite/
  rm ${pkgdir}/usr/share/oolite/oolite
  install -D -m755 oolite.app/oolite ${pkgdir}/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png ${pkgdir}/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop ${pkgdir}/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf ${pkgdir}/usr/share/doc/oolite/
}

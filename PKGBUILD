#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=('libdragon-git' 'libdragon-tools-git')
pkgver=r105.c30a5d6
pkgrel=1
url="http://www.dragonminded.com/n64dev/libdragon"
arch=('i686' 'x86_64')
license=('custom:UNLICENSE')
makedepends=('git' 'mips64-elf-gcc-stage1')
depends=('libpng' 'mips64-elf-newlib')
source=("git://github.com/DragonMinded/libdragon.git" "noconvtool.diff") 
sha256sums=('SKIP' 'ec37b8d10ee3911979092916a6b9361e62b13a3a3cfb1736281d6baf304bfc95')

pkgver() {
  cd libdragon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd libdragon
  patch -p1 < "${srcdir}/noconvtool.diff"
}

build(){
  cd libdragon
  N64_INST=/usr make
  N64_INST=/usr make tools
}

package_libdragon-git(){
  pkgdesc="Open source library for Nintendo 64 development"
  options=('!buildflags' '!strip' '!emptydirs')
  provides=('libdragon')
  conflicts=('libdragon')
  arch=('any')
  depends=('mips64-elf-newlib')
  install=('libdragon.install')
  
  cd libdragon
  
  mkdir -p "${pkgdir}/etc/profile.d/"
  echo 'export N64_INST=/usr' > "${pkgdir}/etc/profile.d/libdragon.sh"
  chmod 755 "${pkgdir}/etc/profile.d/libdragon.sh"

  mkdir -p "${pkgdir}/usr/mips64-elf/"{include,lib}
  make INSTALLDIR="${pkgdir}/usr" install 

  # strip it manually
  find "${pkgdir}/usr/mips64-elf/lib" -type f -exec /usr/bin/mips64-elf-strip --strip-unneeded {} \; 2>/dev/null || true

  #install license
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_libdragon-tools-git() {
  pkgdesc="Open source tools for Nintendo 64 development"
  options=()
  provides=('libdragon-tools')
  conflicts=('libdragon-tools')
  arch=('i686' 'x86_64')
  depends=('libpng')

  cd libdragon
  mkdir -p "${pkgdir}/usr/bin"
  make -j1 INSTALLDIR="${pkgdir}/usr" tools-install

  #install license
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

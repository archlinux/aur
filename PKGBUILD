#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=('libdragon-opengl-git' 'libdragon-tools-opengl-git')
pkgver=r1508.0e9ba50e
pkgrel=1
url="http://www.dragonminded.com/n64dev/libdragon"
arch=('x86_64')
license=('custom:UNLICENSE')
makedepends=('git')
depends=('libpng' 'mips64-elf-gcc' 'mips64-elf-newlib')
source=("git+https://github.com/DragonMinded/libdragon.git#branch=opengl")
sha256sums=('SKIP')

pkgver() {
  cd libdragon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd libdragon
  CFLAGS="" LDFLAGS="" ASFLAGS="" N64_INST=/usr make
  N64_INST=/usr make tools
}

package_libdragon-opengl-git(){
  pkgdesc="Open source library for Nintendo 64 game development (unstable/OpenGL branch)"
  options=('!buildflags' '!strip' '!emptydirs')
  provides=('libdragon')
  conflicts=('libdragon')
  arch=('any')
  depends=('mips64-elf-gcc' 'mips64-elf-newlib')
  install='libdragon.install'

  cd libdragon

  mkdir -p "${pkgdir}/etc/profile.d/"
  echo 'export N64_INST=/usr' > "${pkgdir}/etc/profile.d/libdragon.sh"
  chmod 755 "${pkgdir}/etc/profile.d/libdragon.sh"

  mkdir -p "${pkgdir}/usr/mips64-elf/"{include,lib} "${pkgdir}/usr/include"
  make INSTALLDIR="${pkgdir}/usr" install

  # strip it manually
  find "${pkgdir}/usr/mips64-elf/lib" -type f -exec /usr/bin/mips64-elf-strip --strip-unneeded {} \; 2>/dev/null || true

  #install license
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_libdragon-tools-opengl-git() {
  pkgdesc="Open source tools for Nintendo 64 development (unstable/OpenGL branch)"
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

# Maintainer: dalz <dalz @t disroot d0t org>
# Contributor: Zanny <lordzanny@gmail.com>
# Contributor: Pavel Lymarev <x-user at bk dot ru>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Rene Schoebel (wesley) <schoebel.r at gmail dot com>

pkgname=bin32-openjk-git
pkgver=r3652.24c5b279c
pkgrel=3
pkgdesc="Open Source Jedi Knight II + III Engine (32-bit version)"
arch=('i686' 'x86_64')
url="https://github.com/JACoders/OpenJK"
license=('GPL2')
depends=('lib32-sdl2' 'lib32-libjpeg' 'lib32-libpng' 'lib32-glu')
makedepends=('cmake' 'git')
provides=('openjk' 'bin32-openjk')
conflicts=('openjk')
source=(
  "${pkgname}::git+https://github.com/JACoders/OpenJK.git"
  'openjkmp.png'
  'openja.png'
  'openjo.png'
  'openjkmp.desktop'
  'openja.desktop'
  'openjo.desktop')
sha256sums=(
  'SKIP'
  '3e9d36b3f982cc29fb3e4385ddc46e431be9fa045b32a811346f4254fa8d372c'
  '0e82e720777eeb2043c2c25cdbce702c6d4ca077543aedfe51e5c4e96cf03969'
  'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903'
  'd3ad7dd270e57d36a22caef21bff17f2eb4acb0ad9087f6a17ca4a0bf9c566fc'
  '698792f86b75311a5c96d0b1310d97e242107559d341ea23a705f259e20a5ec2'
  '08812c7d1791b86a842401ecc54f29117d3d8b77369ad04db520561d57df41dd'
)

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s"                  \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchains/linux-i686.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/opt/openjk" \
    -DBuildJK2SPEngine=on \
    -DBuildJK2SPGame=on \
    -DBuildJK2SPRdVanilla=on \
    -DSDL2_INCLUDE_DIRS=/usr/include/SDL2 \
    -DSDL2_LIBRARIES=/usr/lib32/libSDL2.so #/SDL2
  make
}

package() {
  cd "${pkgname}/build"

  _jkarch="i386"
  echo "${_jkarch}"

  make DESTDIR="${pkgdir}" install

  install -m 755 -d "${pkgdir}/usr/bin"

  for _bin in 'openjk' 'openjk_sp' 'openjkded'; do
    cat > "${pkgdir}/usr/bin/${_bin}" << EOF
#!/bin/bash
cd /opt/openjk/JediAcademy
exec ./${_bin}.${_jkarch} \s@
EOF
    chmod +x ${pkgdir}/usr/bin/${_bin}
  done

  cat > "${pkgdir}/usr/bin/openjo" << EOF
#!/bin/bash
cd /opt/openjk/JediOutcast
exec ./openjo_sp.${_jkarch} \s@
EOF
  chmod +x ${pkgdir}/usr/bin/openjo

  install -Dm644 "${srcdir}/openjkmp.png" "${pkgdir}/usr/share/pixmaps/openjkmp.png"
  install -Dm644 "${srcdir}/openja.png" "${pkgdir}/usr/share/pixmaps/openja.png"
  install -Dm644 "${srcdir}/openjo.png" "${pkgdir}/usr/share/pixmaps/openjo.png"
  install -Dm755 "${srcdir}/openjkmp.desktop" "${pkgdir}/usr/share/applications/openjkmp.desktop"
  install -Dm755 "${srcdir}/openja.desktop" "${pkgdir}/usr/share/applications/openja.desktop"
  install -Dm755 "${srcdir}/openjo.desktop" "${pkgdir}/usr/share/applications/openjo.desktop"
}

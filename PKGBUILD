# Maintainer: objecity <objecity.nekoweb.org>
pkgname=nuance-emu
pkgver=r363.2162dcb
pkgrel=1
pkgdesc="A Nuon emulator resurrecting the late Riff's original Nuance project"
arch=('x86_64')
url="https://github.com/andkrau/NuanceResurrection"
license=('BSD-3-Clause')
depends=('libgl' 'libx11' 'sdl2' 'glibc')
makedepends=('git' 'cmake' 'imagemagick')
provides=("nuance")
conflicts=("nuance")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/NuanceResurrection"
  git submodule update --init --recursive
  cd "${srcdir}"
  mkdir -p build
  magick NuanceResurrection/Nuance.bmp build/nuance.png
  cat << EOF > build/nuance.desktop
[Desktop Entry]
Type=Application
Version=1.0
Name=Nuance
Comment=A NUON (VM Labs) emulator for Windows and Linux.
Exec=nuance
Icon=nuance
Terminal=false
Categories=Game;Emulator;
EOF
}

pkgver() {
  cd "${srcdir}/NuanceResurrection"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B "${srcdir}/build" -S "${srcdir}/NuanceResurrection" -DCMAKE_BUILD_TYPE=Release
  cmake --build "${srcdir}/build"
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -m755 build/nuance "${pkgdir}/usr/share/${pkgname}/nuance"
  install -m644 build/*.cof "${pkgdir}/usr/share/${pkgname}/"
  install -m644 build/*.cfg "${pkgdir}/usr/share/${pkgname}/"
  install -m644 build/*.vs "${pkgdir}/usr/share/${pkgname}/"
  install -m644 build/*.fs "${pkgdir}/usr/share/${pkgname}/"
  install -m644 build/nuance.png "${pkgdir}/usr/share/pixmaps/nuance.png"
  install -Dm644 build/nuance.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/nuance.png"
  install -m644 build/nuance.desktop "${pkgdir}/usr/share/applications/nuance.desktop"
  install -Dm644 "${srcdir}/NuanceResurrection/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cat << 'EOF' > "${pkgdir}/usr/bin/nuance"
#!/bin/sh
cd /usr/share/nuance-emu
exec ./nuance "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/nuance"
}

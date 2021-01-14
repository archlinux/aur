# Maintainer: Filip Parag <aur@filiparag.com>

pkgname=2048-gui-git
pkgver=57.59e0c80
pkgrel=1
pkgdesc="Animated graphical 2048 sliding block puzzle game written in C and SDL2"
arch=('any')
url="https://github.com/filiparag/asm2048"
license=('MIT')
makedepends=('cmake' 'git' 'gcc' 'make')
depends=('sdl2' 'sdl2_gfx' 'sdl2_ttf')
source=("${pkgname}-source::git+${url}" 'https://raw.githubusercontent.com/snwh/paper-icon-theme/master/Paper/512x512/apps/gnome-2048.png')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}-source"
  # Format: ${commit-count}.${last-commit-hash}
  echo "$(git rev-list --all --count).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}-source"
  git submodule update --init --recursive
  # Remove default build type
  sed '/CMAKE_BUILD_TYPE/d' -i 'CMakeLists.txt'
  # Build without x86_64 assembly parts
  cmake -DUSE_ASM=OFF -DCMAKE_BUILD_TYPE=Release
  # Create launcher
  tee 'launch.sh' << END
#!/bin/sh
cd /usr/share/${pkgname}
exec ./asm2048
END
  # Create desktop entry
  tee 'launch.desktop' << END
[Desktop Entry]
Name=2048
Version=1.0
GenericName=Sliding number puzzle game
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Type=Application
Categories=Game;
Keywords=Puzzle;2D;Block;Number;Animated;
Terminal=false
StartupNotify=false
Comment=Animated graphical 2048 sliding block puzzle game written in C and SDL2
END

}

build() {
  cd "${pkgname}-source"
  make
}

check() {
  # Test if compiled binary has correct MIME type
	file --mime-type "${pkgname}-source/asm2048" | grep -qw 'application/x-pie-executable'
}

package() {
  install -Dm 644 'gnome-2048.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 755 "${pkgname}-source/launch.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 "${pkgname}-source/asm2048" -t "${pkgdir}/usr/share/${pkgname}/"
  cp -r --preserve=mode "${pkgname}-source/assets" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm 644 "${pkgname}-source/launch.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

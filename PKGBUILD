# Maintainer: NeoGenetic <alexander@neogenetic.nl>

pkgname=garlmap
_pkgname=Garlmap
pkgver=r0
pkgrel=1
pkgdesc="Garlmap is the Gapless Almighty Rule-based Logical Mpv Audio Player git version"
arch=('x86_64' 'aarch64') 
url="https://github.com/Jelmerro/Garlmap"
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt'
         'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify')
# libxcrypt-compat is needed for fpm from electron-builder to work. in future
# versions when fpm catches up with new glibc this won't be needed anymore
makedepends=('libxcrypt-compat' 'nodejs' 'npm')
install="${_pkgname}.install"
source=("git+https://github.com/Jelmerro/Garlmap"
        "electron-builder.yml.patch")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 <../electron-builder.yml.patch
  npm ci
  npm run buildlinux
}

package() {
  cd "${srcdir}/${_pkgname}/dist"
  archive=$(ls garlmap-*-dev.pacman)

  echo -n "extracting dist archive... "
  tar --extract -f ${archive} --xz
  echo "done"

  cp -R "./usr/" "${pkgdir}/usr/"
  cp -R "./opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Garlmap/garlmap "${pkgdir}/usr/bin/garlmap"
}
sha256sums=('SKIP'
            '760758e0524a37e97649436f205448ec3ff42aed1db8515806312ece90ca20f3')

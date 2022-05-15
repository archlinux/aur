# Maintainer: zhs <zhao4she4@tuta.io>
# largely based on pkgbuild for vieb-bin by BachoSeven

pkgname=vieb-git
_pkgname=Vieb
pkgver=r1070.4b63e34
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design, \
GIT version"
arch=('x86_64')
url="https://github.com/Jelmerro/Vieb"
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt'
         'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify')
# libxcrypt-compat is needed for fpm from electron-builder to work. in future
# versions when fpm catches up with new glibc this won't be needed anymore
makedepends=('libxcrypt-compat' 'nodejs' 'npm')
install="${_pkgname}.install"
source=("git+https://github.com/Jelmerro/Vieb"
        "electron-builder.yml.patch")
sha256sums=('SKIP'
            '6b104639da5ba40476ffe7cc86714ee5c0d72a1661bf289215dc505104dcac96')

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
  archive=$(ls vieb-*-dev.pacman)

  echo -n "extracting dist archive... "
  tar --extract -f ${archive} --xz
  echo "done"

  cp -R "./usr/" "${pkgdir}/usr/"
  cp -R "./opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/vieb"
}

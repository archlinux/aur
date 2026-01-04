# Maintainer: artist for Artix Linux and XLibre

pkgname=brow6el-git
_pkgname="${pkgname%-*}"
pkgver=r41.g6d8fcdf
pkgrel=1
pkgdesc="Terminal Web Browser with Sixel Support"
arch=('x86_64')
url="https://codeberg.org/janantos/${_pkgname}"
license=('MIT')
depends=(libsixel cairo glibc nss dbus alsa-lib pango)
makedepends=(git libxkbcommon base-devel cmake pkg-config curl 
             libx11 libxcomposite libxdamage libxfixes libxrandr 
             mesa pango atk cups alsa-lib nss nspr glib2)
source=("git+${url}.git")

pkgver() {
  cd $_pkgname
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  ./download_cef.sh 
}

build() {
  cd $_pkgname
  ./build.sh
}

package() {
  local libfiles=(
                 brow6el
                 chrome_100_percent.pak
                 chrome_200_percent.pak
                 icudtl.dat
                 libEGL.so
                 libGLESv2.so
                 libcef.so
                 libvk_swiftshader.so
                 libvulkan.so.1
                 mouse_emu.js
                 resources.pak
                 run_brow6el.sh
                 select_detector.js
                 vk_swiftshader_icd.json
                 v8_context_snapshot.bin
                 )

  cd "${_pkgname}/build"
  sed -i 's|dirname "${BASH_SOURCE\[0\]}"|dirname $(readlink -f "${BASH_SOURCE[0]}" )|' run_brow6el.sh
  install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}/" "${libfiles[@]}"
  install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}/scripts" scripts/*.js
  install -Dm644 -t "${pkgdir}/usr/lib/${_pkgname}/locales" locales/*.pak

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/$_pkgname/run_${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"

  cd ..
  cp -r examples "${pkgdir}/usr/lib/${_pkgname}/"
  install -Dm644 -t "$pkgdir/usr/share/${_pkgname}" *.md
}
sha256sums=('SKIP')


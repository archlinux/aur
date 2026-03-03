# Maintainer: artist for Artix Linux and XLibre

pkgname=brow6el
pkgver=0.3.4
pkgrel=1
pkgdesc="Terminal Web Browser with Sixel Support"
arch=('x86_64')
url="https://codeberg.org/janantos/${pkgname}"
license=('MIT')
depends=(libsixel cairo glibc nss dbus alsa-lib pango)
makedepends=(libxkbcommon base-devel cmake pkg-config curl 
             libx11 libxcomposite libxdamage libxfixes libxrandr 
             mesa pango atk cups alsa-lib nss nspr glib2)
source=("${url}/archive/v${pkgver}.tar.gz"
        LICENSE)

prepare() {
  cd $pkgname
  ./download_cef.sh 
}

build() {
  cd $pkgname
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

  cd "${pkgname}/build"
  sed -i 's|dirname "${BASH_SOURCE\[0\]}"|dirname $(readlink -f "${BASH_SOURCE[0]}" )|' run_brow6el.sh
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}/" "${libfiles[@]}"
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}/scripts" scripts/*.js
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/locales" locales/*.pak

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/$pkgname/run_${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"

  cd ..
  cp -r examples "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 -t "$pkgdir/usr/share/${pkgname}" *.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
sha256sums=('505400ad00bfbf618a393b329b1d8d73475970e2a698bb5c345ac9a43018ec82'
            '47d7a3aecfe168f6cc1f5302ff210dd8f03902c9a15023c75f636f29301bd383')


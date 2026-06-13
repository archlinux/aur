#! Maintainer: artist for Artix Linux

pkgname=helium-browser
pkgver=0.13.3.1
_hlmver="${pkgver%.*}"
pkgrel=1
pkgdesc="Private, fast, and honest web browser based on - Ungoogled - Chromium"
arch=('x86_64')
url="https://github.com/imputnet/helium"
license=('GPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'udev' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('ninja' 'nodejs' 'python-pillow' 'lld' 'gperf' 'git')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
provides=("chromium")
conflicts=("chromium")
options=('!lto')
source=("${url}/archive/refs/tags/${_hlmver}.tar.gz"
        "${url}-linux/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.desktop")

sha256sums=('0dca5dc76d287420b966767a7ee761dc0da6e155a5278f9542907a6e94b12d78'
            '678bcfa2baab10054cf91ba3bfec310d7ed808349728eb10a1b9959bbe7d408f'
            '934b84f8f55e8461c3e47651c632d5e8e2d23ec1d71113dd7384d845ffa16a27')

prepare() {
  mv -v "helium-${_hlmver}" helium-chromium
  mv -v helium-chromium "helium-linux-${pkgver}"
}

build() {
  cd "helium-linux-${pkgver}/scripts"

  ./build.sh
}

package() {
  _libfiles=(
             chrome_100_percent.pak
             chrome_200_percent.pak
             helium_crashpad_handler
             icudtl.dat
             libEGL.so
             libGLESv2.so
             libqt5_shim.so
             libqt6_shim.so
             libvk_swiftshader.so
             libvulkan.so.1
             resources.pak
             vk_swiftshader_icd.json
             v8_context_snapshot.bin
             )

  cd "helium-linux-${pkgver}/build/src/out/Default"

  install -Dm755 helium "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -Dm755 chromedriver "${pkgdir}/usr/lib/${pkgname}/chromedriver"
  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "${_libfiles[@]}" "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/locales" locales/*.pak

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 product_logo_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 product_logo_256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/helium-linux-${pkgver}/LICENSE"*
}


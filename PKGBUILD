# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=yakyak
pkgver=1.3.0
pkgrel=1
pkgdesc="Desktop client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
makedepends=('unzip' 'nodejs' 'npm')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring' 'icu')

_electron_version=1.2.1
_platform=ia32
[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/yakyak/yakyak/archive/v${pkgver}.tar.gz"
        "yakyak.desktop")
source_i686=("https://github.com/atom/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-ia32.zip")
source_x86_64=("https://github.com/atom/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-x64.zip")

sha256sums=('ec1ba93ff6c2f6f663ca426cc99cac5c540766de9754348015e8af918ea1e182'
            '12baee4e3e926b765ebe21493adb7aa416165c7191f583694670b08d9b9c5360')
sha256sums_i686=('cecdd036689eb5ea90ad0f35da38505a95ad7120dfb8653387e5abdd142a77cd')
sha256sums_x86_64=('954dd9054a9f8735b4c09755da910e98ec23cfdb9e2c5ff32dba04cb7a5e0151')

noextract=("electron-v${_electron_version}-linux-${_arch}.zip")

build() {
  unzip "electron-v${_electron_version}-linux-${_arch}.zip" -d "${srcdir}/electron-${_electron_version}"
  mv "${srcdir}/electron-${_electron_version}/electron" "${srcdir}/electron-${_electron_version}/yakyak"

  cd "${srcdir}/yakyak-${pkgver}"
  npm install
  ./node_modules/gulp/bin/gulp.js

  cp -a "${srcdir}/yakyak-${pkgver}/app" "${srcdir}/electron-${_electron_version}/resources/"
}

package() {
  install -dm755 "${pkgdir}/usr/share/"
  cp -R "${srcdir}/electron-${_electron_version}" "${pkgdir}/tmp"
  mv "${pkgdir}/tmp" "${pkgdir}/usr/share/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/yakyak" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/yakyak.desktop" "${pkgdir}/usr/share/applications/yakyak.desktop"

  install -Dm644 "${srcdir}/yakyak-${pkgver}/src/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/yakyak.png"
}

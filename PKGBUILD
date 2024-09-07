# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=flashbrowser
_appname=FlashBrowser
pkgver=0.8.1
_pkgver=0.81
pkgrel=5
pkgdesc="A browser capable of viewing/displaying pages with embedded flash content"
url="https://flash.pm/"
arch=('x86_64')
license=('LicenseRef-unknown')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'coffeescript'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxrandr'
  'libxrender'
  'libxss'
  'libxtst'
  'mesa'
  'nodejs-lts-iron'
  'nspr'
  'nss'
  'pango'
)
makedepends=('imagemagick' 'npm')
options=('!emptydirs')
provides=('flashbrowser')
conflicts=('flashbrowser')
source=("${_appname}-${_pkgver}.tar.gz::https://github.com/radubirsan/FlashBrowser/archive/refs/tags/v${_pkgver}.tar.gz"
        "https://github.com/darktohka/clean-flash-builds/releases/download/v1.7/flash_player_patched_ppapi_linux.$CARCH.tar.gz"
        "FlashBrowser.desktop")
sha256sums=('062e59a50e30a7cdd618328d9582b58d805dfe50990a9f93df2dddc8c6e4b4ae'
            'fca4fd08f40639fc495c3f58a1877e7ea023ccb19f0a6466a396e418dee5a186'
            'd7cb1e280719ec12d61d69ce757cfe27d7aeb2fdd207e4a6ab068c9fb7b182c2')
noextract=('flash_player_patched_ppapi_linux.$CARCH.tar.gz')

prepare() {
  # Extract FlashPlugin (PPAPI)
  mkdir -p flash_plugin
  bsdtar -xf flash_player_patched_ppapi_linux.$CARCH.tar.gz -C flash_plugin
  # Remove macOS FlashPlugin
  rm -r "${srcdir}/${_appname}-${_pkgver}/flashver"/*
  # Remove dotfiles
  find "${srcdir}/${_appname}-${_pkgver}" \( -name '.git*' -o -name '.DS*' -o -name '._*' \) | xargs rm -r
}

package() {
  cd ${_appname}-${_pkgver}
  npm ci --cache "${srcdir}/npm-cache" --legacy-peer-deps
  npm exec electron-packager -- ./ ${_appname} --platform=linux --overwrite --icon=icon.ico -p always --prune-license nm-prune --force
  install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  # Install app
  cp -a --no-preserve='ownership' "${srcdir}/${_appname}-${_pkgver}/${_appname}-linux-x64"/* "${pkgdir}/opt/${pkgname}"
  # Install license
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_appname}-${_pkgver}/${_appname}-linux-x64/LICENSE"
  # Install FlashPlugin
  install -Dm755 "${srcdir}/flash_plugin/libpepflashplayer.so" \
    "${pkgdir}/opt/${pkgname}/resources/app/flashver/libpepflashplayer.so"
  # Install /usr/bin executable
  ln -s "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
  # Install desktop entry file
  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  # Install icons
  for d in 16 24 32 48 256; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${d}x${d}/apps"
  done

  for i in 16 24 32 48 256; do
    if [ ${i} = '16' ]; then
      layer=0
    elif [ ${i} = '24' ]; then
      layer=1
    elif [ ${i} = '32' ]; then
      layer=2
    elif [ ${i} = '48' ]; then
      layer=3
    elif [ ${i} = '256' ]; then layer=4; fi

    magick "${srcdir}/${_appname}-${_pkgver}/icon.ico[${layer}]" -define icon:auto-resize=${i} \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
  done
  # Remove references to $pkgdir
  find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"
}

# vim:set ts=2 sw=2 et:

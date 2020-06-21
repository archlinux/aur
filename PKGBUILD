# Contributor: Juanma Hernandez <juanmah@gmail.com>
# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=zotero-arm-bin
pkgver=5.0.88
pkgrel=2
pkgdesc="Zotero Standalone is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources (ARM Binaries)"
arch=('aarch64' 'armv7h')
url="http://www.zotero.org/download"
license=('GPL3')
depends=('dbus-glib' 'gtk3' 'nss' 'libxt')
provides=("zotero=${pkgver}")
conflicts=('zotero')
optdepends=(
)

install='zotero.install'

source=(
  "zotero.desktop"
  "Zotero-${pkgver}_linux_x86_64.tar.bz2::https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=${pkgver}"
)
source_aarch64=(
  "firefox.deb::http://launchpadlibrarian.net/373617392/firefox_60.0.2+build1-0ubuntu0.18.04.1_arm64.deb"
)
source_armv7h=(
  "firefox.deb::http://launchpadlibrarian.net/373609086/firefox_60.0.2+build1-0ubuntu0.18.04.1_armhf.deb"
)
sha256sums=('2e700ebe97d332a894be80d232b037b0117d84b38c5fa99dffc727cb10918228'
            'c248bb3b5165f4b03c7e38673aa928f1f29796a8d8ba1b335699803c559529a7')
sha256sums_aarch64=('cad6ea6f971431ece476bda7499b30293dc6b533c1c35a41d1c90f46a0393729')
sha256sums_armv7h=('cad6ea6f971431ece476bda7499b30293dc6b533c1c35a41d1c90f46a0393729')

prepare() {
  ar x firefox.deb data.tar.xz
  tar xf data.tar.xz ./usr/lib/firefox --strip-components=3
  rm data.tar.xz
}

package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/zotero}
  mv "$srcdir"/Zotero_linux-x86_64/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  install -Dm644 "$srcdir"/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop
  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
  # Disable APP update
  sed -i '/pref("app.update.enabled", true);/c\pref("app.update.enabled", false);' "$pkgdir"/usr/lib/zotero/defaults/preferences/prefs.js
  # No need to keep a shell around when launching Zotero
  sed -i -r 's/^("\$CALLDIR\/zotero-bin" -app "\$CALLDIR\/application.ini" "\$@")/exec \1/' "$pkgdir"/usr/lib/zotero/zotero

  # Remove poppler binaries
  rm -r "${pkgdir}/usr/lib/zotero/"{pdftotext,pdfinfo,poppler-data}

  # Replace Firefox binaries
  #
  # I know you might want to vomit right now, but the official packaging
  # script from Zotero does the exact same thing (downloading pre-built
  # Firefox 60 binaries):
  #
  # https://github.com/zotero/zotero-standalone-build/blob/master/fetch_xulrunner.sh
  #
  # Please forgive me :P
  rm "${pkgdir}/usr/lib/zotero/"**.{so,chk}
  rm "${pkgdir}/usr/lib/zotero/gtk2/"*
  rm -r "${pkgdir}/usr/lib/zotero/gmp-clearkey"
  rm "${pkgdir}/usr/lib/zotero/"{updater,minidump-analyzer}
  install -Dm755 firefox/*.{so,chk} "${pkgdir}/usr/lib/zotero/"
  install -Dm755 firefox/gtk2/*.so "${pkgdir}/usr/lib/zotero/gtk2/"
  install -Dm755 firefox/plugin-container "${pkgdir}/usr/lib/zotero/plugin-container"
  install -Dm755 firefox/firefox "${pkgdir}/usr/lib/zotero/zotero-bin"
  install -Dm644 firefox/dependentlibs.list "${pkgdir}/usr/lib/zotero/dependentlibs.list"
}

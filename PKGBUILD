# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>
# Maintainer: Safing ICS Technologies <noc@safing.io>
#
# Application Firewall: Block Mass Surveillance - Love Freedom
# The Portmaster enables you to protect your data on your device. You
# are back in charge of your outgoing connections: you choose what data
# you share and what data stays private. Read more on docs.safing.io.
#

pkgname=portmaster-bin
pkgver=2.0.0
pkgrel=6
pkgdesc='Privacy Suite and Firewall - installs the official prebuilt Portmaster binaries'
arch=('x86_64')
url='https://safing.io/portmaster'
license=('GPL-3.0-only')
provides=('portmaster')
conflicts=('portmaster' 'portmaster-legacy-bin' 'portmaster-stub-bin' 'portmaster-stub-beta-bin')

# Dependencies according to the Portmaster documentation: https://v2.tauri.app/distribute/aur/#writing-a-pkgbuild-file
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

source=("portmaster.desktop"
        "portmaster-autostart.desktop"
        "portmaster.service"
        "portmaster-ui-start.sh"

        "icon-portmaster.svg"
        "icon-portmaster-16.png"
        "icon-portmaster-32.png"
        "icon-portmaster-48.png"
        "icon-portmaster-64.png"
        "icon-portmaster-128.png")

sha256sums=('8b6955d227825270b5c602bed00c5de9d1f1faf8d86ceccdfb5fa4e6345b8609'
           '0a067b241267974ab3225e904ac362eba6b0a37cc3c4ae18e30c381ad2a47076'
           'cf595fe51bbeb3242aa1cdc844e932731fdff77671d2e2a9ce8d15acffd466a6'
           '9e90c3b736bfedd89fee8bfed413187ac5996743015ab75fca359c47a71132a4'

           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP')

source_x86_64=("updatemgr::https://updates.safing.io/latest/linux_amd64/updatemgr/updatemgr")
sha256sums_x86_64=('d831dc82891c12121769b6c568ed8bdc6fad44d4da5ac6e5905c0f1a11dcc559')

install="${pkgname}.install"

prepare() {
  chmod +x "$srcdir/updatemgr"
  mkdir -p "$srcdir/tmp_downloaded/bin"
  mkdir -p "$srcdir/tmp_downloaded/intel"

  echo "[+] updatemgr: Downloading Portmaster binaries ..."
  "$srcdir/updatemgr" download https://updates.safing.io/stable.v3.json "$srcdir/tmp_downloaded/bin"

  echo "[+] updatemgr: Downloading Portmaster intel data ..."
  "$srcdir/updatemgr" download https://updates.safing.io/intel.v3.json "$srcdir/tmp_downloaded/intel"
}

package() {
  install -Dm644 "$srcdir/portmaster.desktop"           "$pkgdir/usr/share/applications/portmaster.desktop"
  install -Dm644 "$srcdir/portmaster-autostart.desktop" "$pkgdir/etc/xdg/autostart/portmaster-autostart.desktop"
  install -Dm644 "$srcdir/portmaster.service"           "$pkgdir/usr/lib/systemd/system/portmaster.service"
  install -Dm755 "$srcdir/portmaster-ui-start.sh"       "$pkgdir/usr/lib/portmaster/portmaster-ui-start.sh"

  install -d "$pkgdir/usr/lib/portmaster"
  install -m755 "$srcdir/tmp_downloaded/bin/portmaster-core"  "$pkgdir/usr/lib/portmaster/portmaster-core"
  install -m755 "$srcdir/tmp_downloaded/bin/portmaster"       "$pkgdir/usr/lib/portmaster/portmaster"
  install -m644 "$srcdir/tmp_downloaded/bin/portmaster.zip"   "$pkgdir/usr/lib/portmaster/portmaster.zip"
  install -m644 "$srcdir/tmp_downloaded/bin/assets.zip"       "$pkgdir/usr/lib/portmaster/assets.zip"

  install -d "$pkgdir/var/lib/portmaster/intel"
  for f in index.json base.dsdl geoipv4.mmdb geoipv6.mmdb index.dsd intermediate.dsdl urgent.dsdl main-intel.yaml notifications.yaml news.yaml; do
    install -m644 "$srcdir/tmp_downloaded/intel/$f" "$pkgdir/var/lib/portmaster/intel/$f"
  done

  # Remove temporary files after installation
  rm -rf "$srcdir/tmp_downloaded" "$srcdir/updatemgr"

  # Install APP ICONS
  ICON_NAME="portmaster"
  for size in 16 32 48 64 128; do
    install -Dm644 "$srcdir/icon-${ICON_NAME}-${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${ICON_NAME}.png"
  done
  install -Dm644 "$srcdir/icon-${ICON_NAME}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${ICON_NAME}.svg"  # Scalable icon
  install -Dm644 "$srcdir/icon-${ICON_NAME}-64.png" "$pkgdir/usr/share/pixmaps/${ICON_NAME}.png"                   # In pixmaps for maximum compatibility
}

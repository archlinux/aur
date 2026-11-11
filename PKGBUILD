# Maintainer: taxin <186607085+taxin-404@users.noreply.github.com>
#
# Application Firewall: Block Mass Surveillance - Love Freedom
# The Portmaster enables you to protect your data on your device. You
# are back in charge of your outgoing connections: you choose what data
# you share and what data stays private. Read more on docs.safing.io.
#

pkgname=portmaster-git
pkgver=2.2.8.r2992.gbffef134
pkgrel=1
pkgdesc='Privacy Suite and Firewall - built from source'
arch=('x86_64')
url='https://safing.io/portmaster'
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'iptables' 'libayatana-appindicator' 'libsoup3' 'pango'
         'webkit2gtk-4.1' 'openssl')
makedepends=('go' 'nodejs' 'npm' 'rust' 'cargo' 'cargo-tauri' 'git' 'zip')
provides=('portmaster')
conflicts=('portmaster' 'portmaster-bin' 'portmaster-legacy-bin'
           'portmaster-stub-bin' 'portmaster-stub-beta-bin')
options=('!lto' '!strip' '!emptydirs')
install="${pkgname}.install"

source=("${pkgname}::git+https://github.com/safing/portmaster.git#branch=development"
        "portmaster.desktop"
        "portmaster-autostart.desktop"
        "portmaster.service"
        "portmaster-ui-start.sh"

        "icon-portmaster.svg"
        "icon-portmaster-16.png"
        "icon-portmaster-32.png"
        "icon-portmaster-48.png"
        "icon-portmaster-64.png"
        "icon-portmaster-128.png")
sha256sums=('SKIP'
            '8b6955d227825270b5c602bed00c5de9d1f1faf8d86ceccdfb5fa4e6345b8609'
            '0a067b241267974ab3225e904ac362eba6b0a37cc3c4ae18e30c381ad2a47076'
            'd6e87f236a0f4de1d6594509b1b0ef1f99039c37836ad901df06b7d76b53df21'
            '9e90c3b736bfedd89fee8bfed413187ac5996743015ab75fca359c47a71132a4'

            'a07e9af436eb1ba1292ccaf619c410b2fcd1b3c2ac430f05d0c6eba1dd6886b3'
            'f6d58c14b2cc03662d881102c332bc77ef61dd9310e994009df85d76f116d855'
            '1c7a04f8e2e5fe702d5101ea2f88a2bb32dccadb6d224a7063c72e8f23d480ca'
            'ce7d1fcb22bff821a25348c050b8b9d38a7e8123553137e70f07932ae58d6f6a'
            '1fdb8e49bc686f83096b99cd6068bfbdaa253a22b7a91534380f50aa0756aaea'
            'f5e7b9bdd2c654a2809d7e4bca5eff4642850dbb654907a458fe38fccff941e4')

pkgver() {
  cd "$srcdir/${pkgname}"
  local tag
  tag=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')
  printf '%s.r%s.g%s' "${tag:-0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"

  # The Angular build picks up this symlink and copies the whole assets
  # directory into portmaster.zip. Upstream removes it during release builds;
  # the assets are shipped separately in assets.zip.
  rm -f desktop/angular/assets
}

build() {
  cd "$srcdir/${pkgname}"

  # Build the Portmaster core service (pure Go).
  CGO_ENABLED=0 go build -trimpath -buildvcs=false -buildmode=pie \
    -ldflags "-s -w -bindnow \
      -X github.com/safing/portmaster/base/info.version=${pkgver} \
      -X github.com/safing/portmaster/base/info.buildSource=https://github.com/safing/portmaster \
      -X github.com/safing/portmaster/base/info.buildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    -o "${srcdir}/portmaster-core" ./cmds/portmaster-core

  # Fetch the current intel data (block lists and GeoIP databases).
  CGO_ENABLED=0 go build -trimpath -buildvcs=false -o "${srcdir}/updatemgr" ./cmds/updatemgr
  mkdir -p "${srcdir}/intel"
  "${srcdir}/updatemgr" download https://updates.safing.io/intel.v3.json "${srcdir}/intel"

  # Build the Angular UI.
  cd desktop/angular
  npm ci --no-audit --no-fund
  npm run build-libs
  npx ng build --configuration production --base-href /ui/modules/portmaster/ portmaster
  ( cd dist && zip -qr "${srcdir}/portmaster.zip" . )
  npx ng build --configuration production --base-href / tauri-builtin

  # Build the data assets archive served by the core.
  ( cd "${srcdir}/${pkgname}/assets/data" && zip -qr -9 -X "${srcdir}/assets.zip" . )

  # Build the Tauri desktop app.
  cd "${srcdir}/${pkgname}/desktop/tauri/src-tauri"
  cargo tauri build --ci --no-bundle --target "${CARCH}-unknown-linux-gnu"
}

package() {
  cd "$srcdir/${pkgname}"

  install -Dm644 "${srcdir}/portmaster.desktop"           "$pkgdir/usr/share/applications/portmaster.desktop"
  install -Dm644 "${srcdir}/portmaster-autostart.desktop" "$pkgdir/etc/xdg/autostart/portmaster-autostart.desktop"
  install -Dm644 "${srcdir}/portmaster.service"           "$pkgdir/usr/lib/systemd/system/portmaster.service"
  install -Dm755 "${srcdir}/portmaster-ui-start.sh"       "$pkgdir/usr/lib/portmaster/portmaster-ui-start.sh"

  install -Dm755 "${srcdir}/portmaster-core" "$pkgdir/usr/lib/portmaster/portmaster-core"
  install -Dm755 "${srcdir}/${pkgname}/desktop/tauri/src-tauri/target/${CARCH}-unknown-linux-gnu/release/portmaster" \
    "$pkgdir/usr/lib/portmaster/portmaster"
  install -Dm644 "${srcdir}/portmaster.zip" "$pkgdir/usr/lib/portmaster/portmaster.zip"
  install -Dm644 "${srcdir}/assets.zip"     "$pkgdir/usr/lib/portmaster/assets.zip"

  # Install the pre-downloaded intel data (block lists and GeoIP databases),
  # matching what the binary release ships.
  install -d "$pkgdir/var/lib/portmaster/intel"
  for f in index.json base.dsdl geoipv4.mmdb geoipv6.mmdb index.dsd intermediate.dsdl urgent.dsdl main-intel.yaml notifications.yaml news.yaml; do
    install -m644 "${srcdir}/intel/$f" "$pkgdir/var/lib/portmaster/intel/$f"
  done

  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # Install app icons.
  local icon_name=portmaster
  for size in 16 32 48 64 128; do
    install -Dm644 "${srcdir}/icon-${icon_name}-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${icon_name}.png"
  done
  install -Dm644 "${srcdir}/icon-${icon_name}.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${icon_name}.svg"
  install -Dm644 "${srcdir}/icon-${icon_name}-64.png" \
    "$pkgdir/usr/share/pixmaps/${icon_name}.png"
}

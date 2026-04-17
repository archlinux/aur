# Maintainer: VVS <vvs@example.com>

pkgname=pipedash-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Manage CI/CD pipelines from multiple providers - desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/hcavarsan/pipedash"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('pipedash')
conflicts=('pipedash')
source_x86_64=("https://github.com/hcavarsan/pipedash/releases/download/v${pkgver}/pipedash_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/hcavarsan/pipedash/releases/download/v${pkgver}/pipedash_${pkgver}_arm64.deb")
sha256sums_x86_64=('3b37373ad81c50fd1455c7502fb54c6319e7ea4c935f46b96b5cd235a77d6f7c')
sha256sums_aarch64=('6a3a4073383592fe2cb82622254d612de1de6346a34bdf60bd9cb24ff18dee4d')

build() {
  bsdtar -x -f pipedash_${pkgver}_*.deb
  bsdtar -x -f data.tar.*

  sed -i 's|Exec=pipedash-desktop|Exec=pipedash|' usr/share/applications/pipedash.desktop
  sed -i 's|Icon=pipedash-desktop|Icon=pipedash|' usr/share/applications/pipedash.desktop

  find usr/share/icons -name 'pipedash-desktop.png' | while IFS= read -r f; do
    mv "$f" "${f%pipedash-desktop.png}pipedash.png"
  done
}

package() {
  install -Dm755 usr/bin/pipedash-desktop "$pkgdir/usr/bin/pipedash"
  install -Dm644 usr/share/applications/pipedash.desktop "$pkgdir/usr/share/applications/pipedash.desktop"

  for _size in 32x32 128x128 '256x256@2'; do
    _src="usr/share/icons/hicolor/${_size}/apps/pipedash.png"
    [ -f "$_src" ] && install -Dm644 "$_src" "$pkgdir/usr/share/icons/hicolor/${_size}/apps/pipedash.png"
  done
}

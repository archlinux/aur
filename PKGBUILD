# Maintainer: schnur[at]i2pmail.org

pkgname=nrc
_pkgver=0.6.13
_channel=beta
_rel=15
_is_beta=true
if [ "${_is_beta}" = "false" ]; then
    pkgver=${_pkgver}
else
    pkgver="${_pkgver}.${_channel}${_rel}"
fi
pkgrel=1
pkgdesc="NoRiskClient Launcher – A Minecraft client from the YouTuber of the same name"
arch=('x86_64')
url="https://norisk.gg/"
license=('GPLv3')
depends=('glibc' 'gtk3' 'webkit2gtk' 'xdg-utils' 'libayatana-appindicator')
makedepends=('dpkg')
options=()

if [ "${_is_beta}" = "false" ]; then
    source=("https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v${_pkgver}/NoRiskClient-Linux.deb")
else
    source=("https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v${_pkgver}-${_channel}.${_rel}/NoRiskClient-Linux.deb")
fi
sha256sums=('39cd438030e7b574e3872bbdf9941e0ebba37c6e413cf95e836cca72c4c2fedb')

prepare() {
  dpkg-deb -x "$srcdir/NoRiskClient-Linux.deb" "$srcdir/pkg"
  rm -rf "$srcdir/pkg/DEBIAN"
}

build() {
  return 0
}

package() {
desktop_file="$srcdir/pkg/usr/share/applications/NoRisk Launcher.desktop"

# Exec‑Zeile ersetzen wegen einem Bug
sed -i 's|^Exec=.*|Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/noriskclient-launcher-v3|' "$desktop_file"

  cp -r "$srcdir/pkg/usr/." "$pkgdir/usr/"

  ln -s "$pkgdir/usr/bin/noriskclient-launcher-v3" "$pkgdir/usr/bin/nrc"
}


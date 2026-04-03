# Maintainer: Zebar2711 <zebra2711t@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: José Miguel Sarasola <jmsaraur@gmail.com>
# Contributor: Như Bảo Trương <28810481+nhubaotruong@users.noreply.github.com>
# Contributor: Andrés Rodríguez <hello@andres.codes>
# Contributor: Jacob Mischka <jacob@mischka.me>
# Contributor: Manuel Mazzuola <origin.of@gmail.com>
# Contributor: Simón Oroño <simonorono@protonmail.com>
# Contributor: now-im <now im 627 @ gmail . com>
# Contributor: Giusy Digital <kurmikon at libero dot it>

get_new_ver() {
  curl -s "https://api.github.com/repos/brave/brave-browser/releases?per_page=10" \
  | jq -r '.[] | select(.prerelease) | .tag_name | ltrimstr("v")' \
  | while read -r ver; do
      curl -sf -o /dev/null -I \
        "https://github.com/brave/brave-browser/releases/download/v${ver}/brave-origin-nightly-${ver}-linux-amd64.zip" \
        && echo "$ver" && break
    done
}

pkgname=brave-origin-nightly-bin
_pkgver=$(get_new_ver)
pkgver=1.91.10
pkgrel=1
epoch=1
pkgdesc='Web browser that blocks ads and trackers by default (binary release)'
arch=(x86_64)
url=https://brave.com
license=(MPL2 BSD custom:chromium)
depends=(alsa-lib
  gtk3
  libxss
  nss
  ttf-font)
optdepends=('cups: Printer support'
  'libgnome-keyring: Enable GNOME keyring support'
  'libnotify: Native notification support')
provides=("${pkgname%-bin}=$_pkgver" 'brave-browser')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("$pkgname.sh"
        brave-origin-nightly.desktop
        "https://github.com/brave/brave-browser/releases/download/v${_pkgver}/brave-origin-nightly-${_pkgver}-linux-amd64.zip"{,.sha256})
validpgpkeys=('3DCB1DA4732251B4')
noextract=(${pkgname%-bin}-${_pkgver}-linux-amd64.zip)
sha256sums=('f572bf9f3ea65f5223526b5df7806e4990435a543c3d33d4cc6d0cee9e22b227'
            '17fa0786cf4bb11ea42733f7acf642f7f86b23d17b2a98fbd9140ce0ab2972a6'
            'SKIP'
            'SKIP')

prepare() {
  sha256sum -c "${pkgname%-bin}-${_pkgver}-linux-amd64.zip.sha256" || exit 1
  mkdir -p brave
  bsdtar -xf "${pkgname%-bin}-${_pkgver}-linux-amd64.zip" -C brave
  chmod +x brave/brave
}

pkgver() {
  echo "$_pkgver"
}

package() {
  install -dm0755 "$pkgdir/opt"
  cp -a brave "$pkgdir/opt/${pkgname}"

  # allow firejail users to get the suid sandbox working
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-origin-nightly"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "brave-origin-nightly.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" brave/LICENSE
  pushd "$pkgdir/usr/"
  for size in 16x16 24x24 32x32 48x48 64x64 128x128; do
    install -Dm0644 "$pkgdir/opt/$pkgname/product_logo_${size/x*/}.png" \
      "share/icons/hicolor/$size/apps/brave-origin-desktop-nightly.png"
  done
}

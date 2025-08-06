# Contributor: xiota

pkgname=legcord-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="Discord client with builtin client mod and theme support"
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
arch=('x86_64' 'aarch64')

provides=(legcord)
conflicts=(legcord)

options=('!strip')
source=(run.sh.in "${pkgver}package.json::https://raw.githubusercontent.com/Legcord/Legcord/refs/tags/v${pkgver}/package.json")
source_x86_64=("${url}/releases/download/v${pkgver}/Legcord-${pkgver}-linux-x86_64.rpm")
source_aarch64=("${url}/releases/download/v${pkgver}/Legcord-${pkgver}-linux-aarch64.rpm")
sha256sums=('34ca8200b5cb545db9c13cf792e2482547da35b54733e9e095166df6b401bd06'
            '05e80f40571d170343a2b85bd89668e2559ec92459015d51d7e1ce62718e28d4')
sha256sums_x86_64=('627d08a7a53f8eebcb1e46d28e38b85bcb8130af6cea63ef4485846294276132')
sha256sums_aarch64=('de7d24bf3206f4eae8e502136b6f53eb7cb04593ad4902c2953273104aab0827')
noextract=(*.rpm)
package() {
  _electron=electron$(grep -oP '"electron":\s*"\K\d+' ${pkgver}package.json)
  echo $_electron
  depends+=($_electron)
  bsdtar -xf Legcord-"${pkgver}"-linux-*.rpm --exclude usr/lib/.build-id --exclude opt \
    --exclude usr/share/icons/hicolor/1024x1024 --exclude usr/share/icons/hicolor/512x512 \
    -C "${pkgdir}"
  sed -i "s/^Exec=.*/Exec=legcord/" "$pkgdir"/usr/share/applications/legcord.desktop
  bsdtar -xf Legcord-"${pkgver}"-linux-*.rpm opt/Legcord/resources
  install -d "${pkgdir}"/usr/lib
  mv opt/Legcord/resources "${pkgdir}"/usr/lib/legcord
  sed "s/@ELECRTON@/${_electron}/" run.sh.in | install -Dm755 /dev/stdin "${pkgdir}"/usr/bin/legcord
}

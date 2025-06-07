# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Alexander Mamzikov <av.mamzikov@gmail.com>
# Contributor: Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgbase='transgui'
pkgname=("${pkgbase}-qt" "${pkgbase}-gtk")
pkgver='5.18.8.f'
pkgrel='1'
pkgdesc='Transmission BitTorrent client'
arch=('x86_64' 'aarch64')
_url="https://github.com/lighterowl"
url="${_url}/${pkgbase}"
license=("GPL")
makedepends=('git' 'lazarus' 'qt6pas' 'gtk2')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}.desktop")
sha256sums=('86107eca8982402ff6292f93e361957b4017e48d32d23516d7ec97b2dae6c7d6'
            '6ee61ee4b01445ef67cc76abaee051c17043b57a743a977a2528a4c78a9a638b')

prepare() {
  cd "${pkgbase}-${pkgver}"
  mkdir -v "../build-qt6" "../build-gtk2"

  # Add custom dependency
  git clone --progress --branch="${pkgbase}" "${_url}/synapse.git" "synapse/source/lib"
}

_build() {
  cd "${pkgbase}-${pkgver}"

  lazbuild "${pkgbase}.lpi" \
  --lazarusdir="/usr/lib/lazarus" \
  --build-mode="Release" \
  --primary-config-path="../build-${1}" \
  --widgetset="${1}"

  install -dm0755 "${pkgdir}/usr/share/${pkgbase}/lang"
  install -dm0755 "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0755 "units/${pkgbase}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "lang/${pkgbase}".* "${pkgdir}/usr/share/${pkgbase}/lang"
  install -Dm0644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "${pkgbase}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm0644 "../${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"

  rm "${pkgdir}/usr/share/${pkgbase}/lang/${pkgbase}.template"
}

package_transgui-qt() {
  depends=('qt6pas')
  conflicts=('transgui-gtk2-git' 'transgui-qt4-git' 'transmission-remote-gui-qt4'
             'transmission-remote-gui-gtk2' 'transmission-remote-gui-bin' 'transgui-gtk')
  _build "qt6"
}

package_transgui-gtk() {
  depends=('gtk2')
  conflicts=('transgui-gtk2-git' 'transgui-qt4-git' 'transmission-remote-gui-qt4'
             'transmission-remote-gui-gtk2' 'transmission-remote-gui-bin' 'transgui-qt')
  _build "gtk2"
}

check() {
  cd "${pkgbase}-${pkgver}/test"

  lazbuild "transguitest.lpi" --lazarusdir="/usr/lib/lazarus"
  ./units/transguitest -a
}

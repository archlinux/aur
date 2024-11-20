# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor : Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgbase='transgui'
pkgname=("${pkgbase}-qt" "${pkgbase}-gtk")
pkgver='5.18.0'
pkgrel='3'
pkgdesc='Transmission BitTorrent client'
arch=('x86_64' 'aarch64')
url="https://github.com/transmission-remote-gui/${pkgbase}"
license=("GPL")
makedepends=('lazarus' 'qt6pas' 'gtk2')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgbase}.desktop"
        "https://s3.e2e4.ru/k0ste/pkgbuild/${pkgver}_5_year_patch.patch")
sha256sums=('d1cbb16eb35d41e76f4a171a3887053899e8dc6a1124afc21615b5038ea60d78'
            '6ee61ee4b01445ef67cc76abaee051c17043b57a743a977a2528a4c78a9a638b'
            '1f7ca6679390043c950e3ff68acdb0c340e400dcd4fa2272028c526acc7a8130')

prepare() {
  cd "${pkgbase}-${pkgver}"
# The patch over master branch for 5 years. No new releases since 2019
  patch -p1 -i "../${pkgver}_5_year_patch.patch"
  mkdir "../build-qt" "../build-gtk"
}

package_transgui-qt() {
  depends=('qt6pas')
  conflicts=('transgui-gtk2-git' 'transgui-qt4-git' 'transmission-remote-gui-qt4'
             'transmission-remote-gui-gtk2' 'transmission-remote-gui-bin' 'transgui-gtk')

  cd "${pkgbase}-${pkgver}"
  make clean

  lazbuild "${pkgbase}.lpi" \
  --lazarusdir="/usr/lib/lazarus" \
  --widgetset="qt6" \
  --primary-config-path="../build-qt"

  install -Dm0755 "units/${pkgbase}" -t "${pkgdir}/usr/bin"
  install -dm0755 "${pkgdir}/usr/share/${pkgbase}/lang"
  install -Dm0644 "lang/${pkgbase}".* "${pkgdir}/usr/share/${pkgbase}/lang"
  install -dm0755 "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "history.txt" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "${pkgbase}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm0644 "../${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"

  rm "${pkgdir}/usr/share/${pkgbase}/lang/transgui.template"
}

package_transgui-gtk() {
  depends=('gtk2')
  conflicts=('transgui-gtk2-git' 'transgui-qt4-git' 'transmission-remote-gui-qt4'
             'transmission-remote-gui-gtk2' 'transmission-remote-gui-bin' 'transgui-qt')

  cd "${pkgbase}-${pkgver}"
  make clean

  lazbuild "${pkgbase}.lpi" \
  --lazarusdir="/usr/lib/lazarus" \
  --widgetset="gtk2" \
  --primary-config-path="../build-gtk"

  install -Dm0755 "units/${pkgbase}" -t "${pkgdir}/usr/bin"
  install -dm0755 "${pkgdir}/usr/share/${pkgbase}/lang"
  install -Dm0644 "lang/${pkgbase}".* "${pkgdir}/usr/share/${pkgbase}/lang"
  install -dm0755 "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "history.txt" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm0644 "${pkgbase}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm0644 "../${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"

  rm "${pkgdir}/usr/share/${pkgbase}/lang/transgui.template"
}

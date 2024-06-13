# Maintainer: Mia Furze <46620osu@gmail.com>

pkgname=jumpfm-bin
_json=$(curl -s -L https://api.github.com/repos/Gilad-Kutiel-App/jumpfm/releases/latest | jq '.')
pkgver=1.0.5
pkgrel=2
pkgdesc='A file manager that lets you jump'
arch=(x86_64)
url='https://jumpfm.org/'
license=('ISC')
depends=()
makedepends=('jq' 'curl')
provides=('jumpfm')
conflicts=('jumpfm')

pkgver() {
  _pkgver=$(jq -r '.tag_name' <<< "$_json" | sed 's/^[a-zA-Z]//g')
  printf "$_pkgver" | sed 's/-/./g'
}

source=(
  "$(jq -r '.assets[].browser_download_url' <<< "$_json" | grep -E '^.*(x86_64|X86_64).*.AppImage' | head -1)"
)

sha512sums=(
  'SKIP'
)

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/opt/jumpfm"

  cp -Rp usr/share/icons/default "${pkgdir}/usr/share/icons"
  rm -rf usr/share/icons

  sed -i "s/^Exec=.*/Exec=\/opt\/${pkgname%-bin}\/usr\/bin\/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}.desktop"
  install -m755 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  cp -Rp usr "${pkgdir}/opt/jumpfm"

  ln -s "/opt/${pkgname%-bin}/usr/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  ln -s "/usr/share/icons/default/48x48/apps/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}

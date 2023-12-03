# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: leotheleon <71839579+leo-the-leon@users.noreply.github.com>

pkgname=firealpaca
pkgver=2.11.14
_pkgver="${pkgver//./_}"
pkgrel=1
pkgdesc="Simple and easy digital painting software"
arch=('x86_64')
url="https://firealpaca.com/"
license=('custom')
depends=('wine')
makedepends=('gendesk' 'icoutils')
source=("${pkgname}-${pkgver}.zip"::"https://firealpaca.com/download/win64_zip"
        "${pkgname}"
        "LICENSE")
sha256sums=('393e44addd057a2b7a37014b68956c0d6df9fb0cd0bada5a2a8129802e7902e5'
            '4874184eef2414d48ab2903e52c65f46f5dc19571666e71d326f2051b28e16eb'
            '719e661613f89866257efa0aff7dd262cc101f83d47b97c4f54b052625a4ead4')

prepare() {
  # Extract icons
  wrestool -x "FireAlpacaWin64_${_pkgver}/FireAlpaca.exe" -o "${pkgname}.ico"
  icotool -x "${pkgname}.ico"
  gendesk -n -f --nocolor \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name='FireAlpaca' \
    --exec="${pkgname} %U" \
    --mimetype='image/jpeg;image/bmp;image/x-png;image/gif;image/vnd.adobe.photoshop' \
    --categories 'Graphics;2DGraphics;RasterGraphics'
  rm "${pkgname}.ico"
}

package() {
  cd "FireAlpacaWin64_${_pkgver}"

  # Install files
  for _dir in . imageformats platforms printsupport
  do
    install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/${_dir}"
    install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/${_dir}" "${_dir}"/* || true
  done

  # Install executable script into /usr/bin
  install -m 755 -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install application launcher into /usr/share/applications
  install -m 644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icons into /usr/share/icons/hicolor
  for _size in 16 32 48 256
  do
    install -m 644 -D "${srcdir}/${pkgname}"_*_"${_size}x${_size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  # Install license file
  install -m 644 -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


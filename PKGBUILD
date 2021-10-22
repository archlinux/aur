# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>

pkgname=embrilliance
pkgver=1.17.2
pkgrel=1
pkgdesc='Render, convert and digitize embroidery designs. Windows version.'
arch=('x86_64')
url='https://embrilliance.com/downloads'
license=('unknown')
depends=('wine' 'wine-mono' 'wine-gecko')
makedepends=('icoutils' 'innoextract' 'unzip')
options=('!strip')
install="${pkgname}.install"

source=(
  "https://www.embrilliance.com/emb_downloads/Embrilliance${pkgver//./}Setup.zip"
  "${pkgname}.bash"
  "${pkgname}.desktop"
  'LICENSE'
)

sha512sums=(
  '05852dbc1e1ab1dfd16f22c29d49831497c34f20fee1675d3deb9c7f78b07381068943bf38415d861fe542f1b0ca5d66eb9dda49c4c036fd348e1b8d496ff8f7'
  'SKIP'
  'SKIP'
  'SKIP'
)

noextract=("Embrilliance${pkgver//./}Setup.zip")

prepare() {
  mkdir -p "${srcdir}/${pkgname}-setup"
  cd "${srcdir}/${pkgname}-setup"

  echo >&2 'Decompressing installer'
  unzip -u "${srcdir}/Embrilliance${pkgver//./}Setup.zip"

  echo >&2 'Extracting files from installer'
  innoextract -s --exclude-temp --color=0 --progress=0 \
    "Embrilliance${pkgver//./}Setup.exe"
}

package() {
    echo >&2 'Packaging license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      "${srcdir}/LICENSE"

    echo >&2 'Packaging app icon'
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    wrestool -x -n 100 -t 14 \
      -o "${pkgdir}/usr/share/pixmaps/${pkgname}.ico" \
      "${srcdir}/${pkgname}-setup/app/Embroidery.exe"

    echo >&2 'Packaging app resources'
    mkdir -p "${pkgdir}/opt/"
    mv "${pkgname}-setup/app" "${pkgdir}/opt/${pkgname}"

    echo >&2 'Packaging user documents'
    mkdir -p "${pkgdir}/usr/share"
    mv "${pkgname}-setup/userdocs/Embrilliance" \
      "${pkgdir}/usr/share/${pkgname}"

    echo >&2 'Packaging app launcher'
    install -D -m 755 -T \
        "${srcdir}/${pkgname}.bash" \
        "${pkgdir}/usr/bin/${pkgname}"

    echo >&2 'Packaging desktop file'
    install -D -m 755 -T \
        "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

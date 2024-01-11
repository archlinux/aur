# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>

pkgname=embrilliance
#https://www.embrilliance.com/emb_downloads/1175/Embrilliance11754Setup.zip
pkgver=1.17.5.4
_pkgver_minor="$(cut -d . -f -3 <<< "${pkgver}")"
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
  "https://www.embrilliance.com/emb_downloads/${_pkgver_minor//./}/Embrilliance${pkgver//./}Setup.zip"
  "${pkgname}.bash"
  "${pkgname}.desktop"
  'LICENSE'
)

sha512sums=(
  '3bad18c0b809b5c360c3b72d4e266964425c1df35d2257700bceaa914149fb1a1dd19908055c75cc2ef326bf3dc927c192af03514aca4b86305b2ecedf4413a1'
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

    echo >&2 'Packaging user documents'
    mkdir -p "${pkgdir}/usr/share"
    mv "${pkgname}-setup/app/Motifs/Embrilliance" \
      "${pkgdir}/usr/share/${pkgname}"

    echo >&2 'Packaging app resources'
    mkdir -p "${pkgdir}/opt/"
    mv "${pkgname}-setup/app" "${pkgdir}/opt/${pkgname}"

    echo >&2 'Packaging app launcher'
    install -D -m 755 -T \
        "${srcdir}/${pkgname}.bash" \
        "${pkgdir}/usr/bin/${pkgname}"

    echo >&2 'Packaging desktop file'
    install -D -m 755 -T \
        "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

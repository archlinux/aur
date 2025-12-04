# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=wiso-steuer-2026
pkgver=33.1.2720
pkgrel=1
pkgdesc='File your German tax return for the tax year 2025'
arch=('x86_64')
url='https://www.buhl.de/produkte/wiso-steuer'
depends=(
  'bash'
  'coreutils'
  'wine'
  'wine-mono'
  'wine-gecko'
  'winetricks'
  'zenity'
)
makedepends=(
  'imagemagick'
  'msitools'
  'p7zip'
  'pev'
)
license=('LicenseRef-custom')
options=('!strip')
install="${pkgname}.install"

_installer_name="WISOSteuer2026Update$(
  awk <<< "${pkgver}" -F . '{ print $1$3 }'
)"

source=(
  "https://download.buhl.de/hotline/db/9/${_installer_name}.exe"
  'https://update1.buhl-data.com/Steuer/2026/Handbuch_WISO_Steuer_Win.pdf'
  'wiso-steuer-2026.bash'
  'wiso-steuer-2026.desktop'
)

sha512sums=('486cc0721555e74bbfa958c682786aed359383039c82c076e7eee1761cb430e8e2f8d342216e62b9f761f6eb0d52b5d785674a6a6ff9fa525327333b2728fa2c'
            'SKIP'
            'a5c60dcf26a22cf151caf32ad293ea1ac9ddac0e5c93cc14f25b5aa1fd886d4c4f149654d8498e3a0335c30ff178c7ad5b936141f0a01c3bd853836790997480'
            'f49b6c1d54c907253d2ad378c248f21da0ee98053b4bd090a9b92363c574902eb8364b0b8e2e759bdd09fcab315672c8d22fc06d9915207fb91170d9a7ef04ba')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-msi"
  7z x -o"${srcdir}/${pkgname}-msi" "${srcdir}/${_installer_name}.exe"
  # Use a symlink to strip the first three path elements
  mkdir -p "${srcdir}/${pkgname}-staging" \
    "${srcdir}/${pkgname}-tmpextract/PFiles64/WISO"
  ln -fns \
    "${srcdir}/${pkgname}-staging" \
    "${srcdir}/${pkgname}-tmpextract/PFiles64/WISO/Steuersoftware 2026"
  msiextract -C "${srcdir}/${pkgname}-tmpextract" \
    "${srcdir}/${pkgname}-msi/sparbgtst.msi"
}

package() {
  cd "${pkgname}-staging"

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'fremdlizenz.pdf'

  echo >&2 'Packaging program files and documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    ../Handbuch_WISO_Steuer_Win.pdf
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/dokumente" \
    dokumente/*
  rm -rf dokumente
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -R --preserve=mode "../${pkgname}-staging" \
    "${pkgdir}/usr/lib/${pkgname}/app"
  ln -fns "/usr/share/doc/${pkgname}/dokumente" "${pkgdir}/usr/lib/${pkgname}/app/"

  echo >&2 'Packaging app icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  magick 'wisoakt.ico' \
    -delete 1,2,3,4,5,6,7,8 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T "../${pkgname}.bash" \
    "${pkgdir}/usr/bin/${pkgname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -t "${pkgdir}/usr/share/applications" \
    "../${pkgname}.desktop"
}

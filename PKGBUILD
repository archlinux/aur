# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=wiso-steuer-2027
pkgver=34.0.1600
pkgrel=1
pkgdesc='File your German tax return for the tax year 2026'
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
  'readpe'
)
license=('LicenseRef-custom')
options=('!strip')
install="${pkgname}.install"

_installer_name="WISOSteuer2027Update$(
  awk <<< "${pkgver}" -F . '{ print $1$3 }'
)"

source=(
  'https://update1.buhl-data.com/ESD/Steuer/2027/WISOSteuer2027.exe'
  # Uncomment once upstream has published the first updater
  # "https://download.buhl.de/hotline/db/9/${_installer_name}.exe"
  # Uncomment once upstream has published the manual
  # 'https://update1.buhl-data.com/Steuer/2027/Handbuch_WISO_Steuer_Win.pdf'
  'wiso-steuer-2027.bash'
  'wiso-steuer-2027.desktop'
)

sha512sums=('SKIP'
            # 'SKIP'
            'c89291d1bd8be28e714bf09785702cbccc956423e44c7ebf852292814f9c21ff33a2f5f378e04e75b1feb0fed0533a802f9a48e7e0156f930b071f5fd8c8f0d2'
            'a932940540af52a840a4373af304b28fe4f4bff8fc7548181c95115bd898563dec93d9ef42f8fe459d6acfbf4d08bc0cec00042f7c13d7fb74ec369d16a62b63')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-msi"
  7z x -o"${srcdir}/${pkgname}-msi" "${srcdir}/WISOSteuer2027.exe"
  # Use a symlink to strip the first three path elements
  mkdir -p "${srcdir}/${pkgname}-staging" \
    "${srcdir}/${pkgname}-tmpextract/PFiles64/WISO"
  ln -fns \
    "${srcdir}/${pkgname}-staging" \
    "${srcdir}/${pkgname}-tmpextract/PFiles64/WISO/Steuersoftware 2027"
  msiextract -C "${srcdir}/${pkgname}-tmpextract" \
    "${srcdir}/${pkgname}-msi/sparbgtst.msi"
}

package() {
  cd "${pkgname}-staging"

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'fremdlizenz.pdf'

  echo >&2 'Packaging program files and documentation'
  # install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
  #   ../Handbuch_WISO_Steuer_Win.pdf
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

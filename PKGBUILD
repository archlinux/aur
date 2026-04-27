# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=gog-drova-forsaken-kin
pkgver=1.3.4.2
pkgrel=1
pkgdesc='Pixel art action RPG inspired by Celtic mythology and Gothic. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'libgcc'
  'glibc'
  'zlib'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  'drova.bash'
)

sha512sums=('1eac11569b3fc723c28845852b6ec380782ce6145d6e9087d532e9f6c05c4571bb72ce630e1e3e65adf3beb28e8bb75c577b36b52073b50efb847ca38a5613dc'
            '24307f395b6c472264a9e04b043de8d42eb9fb8916f1a165b6ec3836c1ccf8065be1e6ed06197489c79ffcd5c3e74fe099f78d876fb21f07f25d1993d508a8c5'
            'e6a7780af2a4162b62ec5249786dd307712cd7e286a5b603aae3a1efdb2e29d1817fa6b10c712bc831e6099d29784cda14108ba39ed5d11edab855d7ad72bd56')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

  # Remove unneeded executables
  rm -rfv "${srcdir}/data/noarch/support/yad"
}

package() {
  echo >&2 'Packaging license'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"

  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/${_shortname}"
  cp -R --preserve=mode \
    "${srcdir}"/data/noarch/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T "${srcdir}/drova.bash" \
    "${pkgdir}/usr/bin/drova"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

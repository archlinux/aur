# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Hugo Osvaldo Barrera <hugo ät barrera.io>

pkgname=gog-thimbleweedpark
pkgver=1.0.958
pkgrel=2
epoch=2
pkgdesc='Neo-noir mystery point-and-click adventure set in 1987. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url='https://thimbleweedpark.com/'
license=('LicenseRef-eula')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'libglvnd'
  'libx11'
  'libxau'
  'libxcb'
  'libxdmcp'
  'libxext'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "thimbleweed-park_${pkgver//./_}.sh::gogdownloader://thimbleweed_park/en3installer0"
  "${_shortname}.shim"
  "${pkgname}.desktop"
)

sha512sums=(
  '93970bcfca4d201abf5858559f0fe33d2d3e18930d10e1c6e1691fee1075d82f5e6f6b51b0200d55276ce1546308ffc8ad9db5bbb5185af90f2caf092a4adf05'
  '3278823e6a54a1e337a60cb06a5d598f7a8b82b908043f932097457ed51d73f2b2ff15255c1ca51eaab5d7bba9a7ce1482f6fe0d2092a0f150ffab745662f1b3'
  '8abe889a8e074abc0c88844581cd800fc041fc6987e5b8a52872dc859446be6d749ba9e5c80ead6246965499a01b1c77cd34fb51d4658cd5aef4fb403c6ee437'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)
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
    "${srcdir}"/data/noarch/game/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.shim" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

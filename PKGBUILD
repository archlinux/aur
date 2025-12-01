# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-book-of-hours
pkgver=2025.8.e.6
pkgrel=1
pkgdesc='Elegant, melancholy, combat-free RPG set in an occult library. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'zlib'
)
makedepends=('lgogdownloader')
options=('!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=('18d25b17c66539625434032862f44db77884f3fbe967d8072a0a20da06563e29ec60b5fa9e0b34962281586e1d8bbc2f9ae1fd7579f5a759f9b82d2f5d3e08f7'
            '3850a34515d52636af8ee4aaa6cabee65cd981c1702deff98f46e581ed509b6a86daa5bf24bea9d8162eb6cf91bed03b61c1d261ede7d8d70fc6212bbf25e896'
            '9719d7906aa684b77b3ec27592f3628f3b1e1651a043a6eac018571fe17cfe6fbf6a5a64cf130aa42eec0a8059dd65d12f03a1f9ca3c3f284da2b5720cee8f9e')

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
    "${srcdir}"/{data,meta,scripts} \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

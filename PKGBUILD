# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-scott-whiskers-in-the-search-for-mr-fumbleclaw
pkgver=1.0.162
pkgrel=1
pkgdesc='Point-and-click adventure about cats, Star Trek, and life itself. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=('bash' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'zlib')
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '4e7dd1b421bc935d06a3dbfafac460ccfb73e5030d2e7fc7e00e5888de47dbe139b3b40445d1ca1f1dd4809f5d23ed005ffb17f4119dbeb8881bc9470f7bedc8'
  '7787d3e167d34485fbda0cca87c97c879f427a8f4b7e55a5d376eb1e70efab2b15b4a93877486ecb0f50ce044c0f0ae521a810d225e4f007ac0c80c0838881d7'
  'cd660412e210298a037f822886d5ead72cea2cc235bb32c0e92dfdef61c2698716d8825903cd1d85ae67bb03e1c510867b975e8def851ec2f24d2c90ac5ad9fe'
)

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
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

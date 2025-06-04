# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-slay-the-princess-demo
pkgver=2023.0501.174536
pkgrel=1
pkgdesc='Choice-driven psychological horror visual novel. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'libglvnd'
  'pango'
  'python'
)
makedepends=('lgogdownloader')
conflicts=('gog-slay-the-princess')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname%-demo}.bash"
)

sha512sums=(
  '62c684fa2fc9c60e2989cfd8dbf5683d521cefe17ca40f8d38945815ff85e8572c2d0749e56f55301d222dc2523204cfd79c49c7a14d8da7ec71ff565cdef961'
  '5e14040ee7df8087b77108c1246fd0c1c9e7bca2efb211724d79080b4e1a6a41a77dae18e20038e1dcf305b761319e43f71286f112779dcc31e926f089090229'
  '57cdfda25675e321fda04262075b16059cfcf97a45cfb0fd6cfa95333275c1122424544d695c197cc98b7f182b529f9e274001fa4db0df0d9578b054bb6a3b1c'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(
      xmllint \
        -xpath '/plist/dict/key[text()="CFBundleVersion"]/following-sibling::string[1]/text()' \
        data/noarch/game/SlaythePrincessDemo.app/Contents/Info.plist
    )

  echo >&2 'Removing unneeded files meant for other OSes'
  rm -rfv "data/noarch/game/lib/py3-windows-${CARCH}"
  rm -fv data/noarch/game/._.DS_Store
  rm -rfv data/noarch/game/SlaythePrincessDemo.app
  rm -fv data/noarch/game/SlaythePrincessDemo.exe
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
  mkdir -p "${pkgdir}/opt/${_shortname%-demo}"
  cp -R --preserve=mode \
    "${srcdir}"/data/noarch/game/* \
    "${pkgdir}/opt/${_shortname%-demo}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname%-demo}.bash" \
    "${pkgdir}/usr/bin/${_shortname%-demo}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

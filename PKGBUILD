# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-slay-the-princess-demo
pkgver=1.0a.64269
pkgrel=1
pkgdesc='Choice-driven psychological horror visual novel. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('custom')
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
makedepends=()
conflicts=('gog-slay-the-princess')
options=('!strip')
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname%-demo}.bash"
)

sha512sums=(
  '62c684fa2fc9c60e2989cfd8dbf5683d521cefe17ca40f8d38945815ff85e8572c2d0749e56f55301d222dc2523204cfd79c49c7a14d8da7ec71ff565cdef961'
  '5e14040ee7df8087b77108c1246fd0c1c9e7bca2efb211724d79080b4e1a6a41a77dae18e20038e1dcf305b761319e43f71286f112779dcc31e926f089090229'
  'c8406796a9f7b79d371e2b03e55fbbad57b8d39b0e46fac1c69efad8176cdcc4782240e4e7cee33ba2bb1f02050400f2b77432925dfbe3523346d792c2e3cb54'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit executable
  # Fixes false alarm in rebuild-detector
  rm -rfv "${srcdir}/data/noarch/support/yad/32"
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
    "${srcdir}"/{data,meta,scripts} \
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

# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=baba-is-you-hib
_shortname="${pkgname%-hib}"

# https://hempuli.itch.io/baba/devlog/1285463/version-481d
_upstreamver='481d'

_hibver=260102 # 2026-01-02
pkgver="${_upstreamver}.${_hibver}"
pkgrel=1
pkgdesc='Puzzle game where the rules are physical objects. Humble Bundle version.'
arch=('x86_64')
url='https://hempuli.com/baba/'
license=('LicenseRef-unknown')
depends=('bash' 'glibc' 'libglvnd' 'util-linux-libs')
makedepends=('imagemagick')
options=('!strip')

source=(
  "BIY_linux_${_hibver}.tar.gz::hib://BIY_linux_${_hibver}.tar.gz"
  "${_shortname}.bash"
  "${_shortname}.desktop"
)

sha512sums=(
  '051517e47686228f32ec9eeb4636ad715799cb4ac934c72c0347cb780c21cbe760f78857b5aeceb7c09676b7e242ba923253fa82bb4b0398f008e2d12a10223a'
  '049b2a18b9fbe0088fea47acb1a2ddb6e6cfd78e88c600315f914120fc8d0fcc68fd1d21fb57cbaca0ff01db69f685b96984cd6c149c216ec90134aee7aaf5d8'
  '187d439f7126ddc3ce3220593b2d09725fa57a9d18c622220b3c6fabd1c136e1dafb889ffa058ddeca48ced6b727a5bedac2a481cb6fd5bb471beeb2f1687178'
)

PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit executable
  # Fixes false alarm in rebuild-detector
  rm -rfv "${srcdir}/Baba Is You/bin32"
}

package() {
  echo >&2 'Packaging game icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  magick \
    "${srcdir}/Baba Is You/icon.bmp" \
    "${pkgdir}/usr/share/pixmaps/${_shortname}.png"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/${_shortname}"
  cp -R --preserve=mode \
    "${srcdir}/Baba Is You"/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.desktop" \
    "${pkgdir}/usr/share/applications/${_shortname}.desktop"
}

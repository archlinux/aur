# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=baba-is-you-hib
_shortname="${pkgname%-hib}"

# objdump -d 'Baba Is You/bin64/Chowdren' | grep -E -A100 '^\w{16} <_.*VersionString_' | grep -E '<str_[^_]{,5}_\w*>$' | cut -d _ -f 2
_upstreamver='477'

_hibver=230307 # 2023-03-07
pkgver="${_upstreamver}.${_hibver}"
pkgrel=1
pkgdesc='Puzzle game where the rules are physical objects. Humble Bundle version.'
arch=('x86_64')
url='https://hempuli.com/baba/'
license=('LicenseRef-unknown')
depends=('bash' 'glibc' 'libglvnd')
makedepends=('imagemagick')
options=('!strip')

source=(
  "BIY_linux_${_hibver}.tar.gz::hib://BIY_linux_${_hibver}.tar.gz"
  "${_shortname}.bash"
  "${_shortname}.desktop"
)

sha512sums=(
  '007dd7e280524f519162938c94b36cd63ed7820405099aae4fb21ea7bbb92efdc9e3643a7e5bd0a2e2a554ef5cea4f9477df69ca434f9e8c59d4d3e18844938f'
  '049b2a18b9fbe0088fea47acb1a2ddb6e6cfd78e88c600315f914120fc8d0fcc68fd1d21fb57cbaca0ff01db69f685b96984cd6c149c216ec90134aee7aaf5d8'
  '187d439f7126ddc3ce3220593b2d09725fa57a9d18c622220b3c6fabd1c136e1dafb889ffa058ddeca48ced6b727a5bedac2a481cb6fd5bb471beeb2f1687178'
)

PKGEXT=.pkg.tar
DLAGENTS+=('hib::/usr/bin/hib-dlagent -u email -p password -o %o %u')

prepare() {
  # Remove unneeded 32-bit executable
  # Fixes false alarm in rebuild-detector
  rm -rfv "${srcdir}/Baba Is You/bin32"
}

package() {
  echo >&2 'Packaging game icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  convert \
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

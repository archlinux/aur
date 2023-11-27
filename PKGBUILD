# Maintainer:
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_pkgname=sourcetrail
pkgname="$_pkgname"
pkgver=2021.4.19
pkgrel=2
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('x86_64')
url="https://github.com/CoatiSoftware/Sourcetrail"
license=('LGPL3')

depends=('libglvnd')
makedepends=(
  'gendesk'
  'rsync'
)

options=(!strip)

source=(
  "${pkgname}-${pkgver}.tar.gz"::"$url/releases/download/${pkgver}/Sourcetrail_${pkgver//\./\_}_Linux_64bit.tar.gz"
)
sha256sums=(
  'f65a401daad8e16f29f7b2ff062a559999b6a8d44606db36cdf803de0cd7816d'
)

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  local _gendesk_options=(
    -q -f -n
    --pkgname="${_pkgname}"
    --pkgdesc="$pkgdesc"
    --name="Sourcetrail"
    --exec="${_pkgname}"
    --categories="Development"
    --startupnotify=true
    --mimetypes="application/x-sourcetrail"
  )

  gendesk "${_gendesk_options[@]}"
}

package() {
  install -dm755 "${pkgdir:?}/opt/$_pkgname"
  bsdtar --strip-components 1 \
    -C "${pkgdir:?}/opt/$_pkgname" \
    -xf "${pkgname}-${pkgver}.tar.gz"

  rm -rf "${pkgdir:?}/opt/$_pkgname"/{install,uninstall}.sh

  install -dm755 "${pkgdir:?}/usr/bin"
  ln -s "/opt/$_pkgname/Sourcetrail.sh" "${pkgdir:?}/usr/bin/$_pkgname"

  install -Dm644 "${pkgdir:?}/opt/$_pkgname/share/icons/hicolor/256x256/apps/sourcetrail.png" "${pkgdir:?}/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 "${srcdir:?}/$_pkgname.desktop" -t "${pkgdir:?}/usr/share/applications/"
}

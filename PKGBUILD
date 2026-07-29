# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reeden-bin
_pkgname=reeden
_appname=Reeden
pkgver=1.37.1+728
pkgrel=1
pkgdesc='Modern cross-platform ebook reader (prebuilt binary)'
arch=('x86_64')
url='https://reeden.app/cn/download'
license=('unknown')
depends=('gtk3' 'libayatana-appindicator' 'sqlite' 'xdg-user-dirs')
provides=('reeden')
conflicts=('reeden')
options=('!strip')
source=("${_appname}-${pkgver}-linux-x86_64.deb::https://download.reeden.app/${_appname}/${pkgver}/${_appname}-${pkgver}-linux-x86_64.deb")
sha256sums=('e93fc5ae74cdc9edda5bede7e4206024dad7fc3277e75655d583e0fd0c8416f8')

package() {
  local _extractdir

  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_appname}-${pkgver}-linux-x86_64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.zst"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/usr/share/reeden/reeden' "${pkgdir}/usr/bin/reeden"

  sed -i \
    -e 's/^Categories=.*/Categories=Office;Viewer;/' \
    "${pkgdir}/usr/share/applications/reeden.desktop"
}

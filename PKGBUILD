# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reeden
_pkgname=reeden
_appname=Reeden
pkgver=1.40.1+741
pkgrel=1
pkgdesc='Modern cross-platform ebook reader (prebuilt binary)'
arch=('x86_64')
url='https://reeden.app/cn/download'
license=('NOASSERTION')
depends=('gtk3' 'libayatana-appindicator' 'sqlite' 'xdg-user-dirs')
provides=("reeden-bin=${pkgver}")
options=('!strip')
source=("${_appname}-${pkgver}-linux-x86_64.deb::https://download.reeden.app/${_appname}/${pkgver}/${_appname}-${pkgver}-linux-x86_64.deb")
sha256sums=('064506ba2461c82ce43241d8d10d85296d974482c2ef3b74a66fbbfc39931613')

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

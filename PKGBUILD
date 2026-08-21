# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reeden
_pkgname=reeden
_appname=Reeden
pkgver=1.38.1+733
pkgrel=1
pkgdesc='Modern cross-platform ebook reader (prebuilt binary)'
arch=('x86_64')
url='https://reeden.app/cn/download'
license=('NOASSERTION')
depends=('gtk3' 'libayatana-appindicator' 'sqlite' 'xdg-user-dirs')
provides=("reeden-bin=${pkgver}")
options=('!strip')
source=("${_appname}-${pkgver}-linux-x86_64.deb::https://download.reeden.app/${_appname}/${pkgver}/${_appname}-${pkgver}-linux-x86_64.deb")
sha256sums=('cc60ce0b1fefc090e464e925cc8fb5c7f600cc7df3d4f688ae44dad31ad8076c')

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

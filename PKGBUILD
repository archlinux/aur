# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reeden
_pkgname=reeden
_appname=Reeden
pkgver=2.0.0+808
pkgrel=1
pkgdesc='Modern cross-platform ebook reader (prebuilt binary)'
arch=('x86_64')
url='https://reeden.app/cn/download'
license=('NOASSERTION')
depends=('gtk3' 'libayatana-appindicator' 'sqlite' 'xdg-user-dirs')
provides=("reeden-bin=${pkgver}")
options=('!strip')
source=("${_appname}-${pkgver}-linux-x86_64.deb::https://download.reeden.app/${_appname}/${pkgver}/${_appname}-${pkgver}-linux-x86_64.deb")
sha256sums=('955133ead3091a14d6645b371216fc25a89a98c5fbf9927db6baae356aff3f69')

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

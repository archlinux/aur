# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-02-14.


_pkgname=maperitive
pkgname="${_pkgname}-bin"
epoch=0
pkgver=2.4.3
pkgrel=3
pkgdesc="A desktop application which renders maps in real time using OpenStreetMap (OSM) and other sources of data."
_osmurl="https://wiki.openstreetmap.org/wiki/Maperitive"
_upstreamurl="http://maperitive.net"
url="${_osmurl}"
_downloadurl="${_upstreamurl}/download/Maperitive-latest.zip"
arch=(
  'i686'
  'x86_64'
)
license=('LicenseRef-custom')
depends=(
  "bash"
  "mono>=2.6"
)
makedepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
replaces=()
install="${_pkgname}.install"
_target="${_pkgname}-${pkgver}.zip"
source=(
  "${_target}::${_downloadurl}"
  "maperitive.sh"
  "fake-elinks.sh"  # If 'elinks' is found, then it opens a help page in the terminal first, and only continues to run if 'elinks' is quit. We want to avoid this, so we installed a "elinks" fake script that does nothing and prepend it's directory to '$PATH'.
)

sha256sums=(
  "ca1b25463e028d463492f8904c8ef3f0bbd2896be37fb2bcfad0cc780f733449"  # Upstream binary zipfile
  "99d577bbea7a28bf0ecea4bd03ce6fb48410fe9c9ccafa78944f5d872648b97b"  # maperitive.sh
  "ef336669dbe7c61e8b12a154dfb8ae1b74fea2053aa355c64b0f046126705a62"  # fake-elinks.sh
)

prepare() {
  cd "${srcdir}"
  printf '%s\n' "${_osmurl}" > "info.url"
}

package() {
  cd "${srcdir}"

  _instdirbase='/usr/share/maperitive'
  _instdirinstall="${pkgdir}/${_instdirbase}"
  install -dvm755 "${_instdirinstall}"

  cp -rv "${srcdir}/Maperitive"/* "${_instdirinstall}"

  find "${_instdirinstall}" -type f -name '*.exe' -or -name '*.sh' | while read _execfile; do
    chmod -v a+x "${_execfile}"
  done

  install -Dvm755 "${srcdir}/maperitive.sh"   "${pkgdir}/usr/bin/maperitive"
  install -Dvm755 "${srcdir}/fake-elinks.sh"  "${_instdirinstall}/fake/elinks"  # If 'elinks' is found, then it opens a help page in the terminal first, and only continues to run if 'elinks' is quit. We want to avoid this, so we installed a "elinks" fake script that does nothing and prepend it's directory to '$PATH'.

  cd "${srcdir}/Maperitive"
  install -dvm755           "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 -t        "${pkgdir}/usr/share/doc/${_pkgname}" 'ReadMe.txt' "${srcdir}/info.url"
  ln -sv "${_instdirbase}"/docs "${pkgdir}/usr/share/doc/${_pkgname}"/docs

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  'License.txt'
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/License.txt" "${pkgdir}/usr/share/doc/${_pkgname}/License.txt"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gcsfuse"
pkgname="${_pkgname}-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
arch=('aarch64' 'x86_64')
url="https://cloud.google.com/storage/docs/gcs-fuse"
_url="https://github.com/GoogleCloudPlatform/${_pkgname}"
license=('Apache-2.0')
depends=('fuse')
optdepends=('google-cloud-sdk: authentication helper')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_arm64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_amd64.deb")
noextract=("${source_aarch64[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums=('b869f4bab7ee866cd6477101f4cc0bb355cecc1c196f452fcff542b505e5693d'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('54d168ce28718ff4c5039a652ee3fcad87f2432fe439307bc7d87569fd02a5e0')
sha256sums_x86_64=('721881d3d5617c65f4aa1d762d4cbe0a978052c1e5fba594cabdca2eb5bc1571')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  mv -f "sbin"/* "usr/bin"/
  rm -rf "sbin"

  cd "usr"
  rm -rf "share"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

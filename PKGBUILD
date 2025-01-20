# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gcsfuse"
pkgname="${_pkgname}-bin"
pkgver=2.8.0
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
noextract=("${_pkgsrc}-"{aarch64,x86_64}".deb")
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_arm64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_amd64.deb")
sha256sums=('ad6381340439e637008634fedc8dd13edeb0ab9db52c17137c8664bb186b626f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('c40314e98476606cac427d7a88b4789de746dc7e99aef8d360902b0b612d07fa')
sha256sums_x86_64=('3315a448935ae369ea1781cae4bbcb4f26c84539ed6f13f0c21db300508840ce')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  mv -f "sbin"/* "usr/bin"/
  rm -rf "sbin"

  cd "usr"
  rm -rf "share"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"

  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

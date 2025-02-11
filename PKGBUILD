# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gcsfuse"
pkgname="${_pkgname}-bin"
pkgver=2.9.1
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
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_arm64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_amd64.deb")
sha256sums=('ad6381340439e637008634fedc8dd13edeb0ab9db52c17137c8664bb186b626f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('15635497bb4e0248fd67d66edf8be133d936fde4910a3af8d90dd6a899597fc4')
sha256sums_x86_64=('fb5600c719b1f1ef7abb4166510ddbd68fd548be6ffcb4fe17fbdc40ab7805c9')

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
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

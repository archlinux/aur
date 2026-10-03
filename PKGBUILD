# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='amdcovc'
pkgver='0.4.1.2'
pkgrel='2'
pkgdesc='Control AMD Overdrive settings with or without X'
arch=('x86_64' 'aarch64')
depends=('ocl-icd' 'pciutils' 'ncurses')
makedepends=('opencl-headers')
license=('GPL-2.0-only')
_uri="github.com/matszpk/${pkgname}"
url="https://${_uri}"
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/${pkgver}")
sha256sums=('0eade87f70a51c4e059aa664ac98c9bd0f418e9954754665df4bc3e56e8f623f')

prepare() {
  # Use distro flags
  sed --in-place \
    --expression 's|CXXFLAGS =|CXXFLAGS +=|g' \
    --expression 's|LDFLAGS =|LDFLAGS +=|g' \
  "${pkgname}-${pkgver}/Makefile"
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}" \
  CXXLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}" \
  LDFLAGS="${LDFLAGS}" \
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0775 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

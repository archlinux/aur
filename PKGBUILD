# Maintainer: Cedric Roijakkers <cedric at roijakkers dot be>
# Contributor: mrxx <mrxx at cyberhome dot at>

_name=dislocker
pkgname=${_name}-mbedtls3
pkgver=0.7.3
pkgrel=1
pkgdesc="Read/write BitLocker-encrypted volumes (built against mbedtls3)"
arch=('x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL-2.0-or-later')
depends=('fuse' 'mbedtls3' 'ruby')
makedepends=('cmake')
conflicts=('dislocker')
provides=('dislocker')
optdepends=('ntfs-3g: NTFS file system support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8d5275577c44f2bd87f6e05dd61971a71c0e56a9cbedf000bd38deadd8b6c1e6')

prepare() {
  cd "$srcdir/${_name}-${pkgver}"

  # Fix inapt variable naming
  sed -i 's/true/trueval/g' src/config.c

  # File.exists? was removed in Ruby 3.2+, use File.exist?
  sed -i 's/File\.exists?/File.exist?/g' src/dislocker-find.rb.in
}

build() {
  cd "$srcdir/${_name}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Dlibdir=/usr/lib \
        -DPOLARSSL_INCLUDE_DIRS=/usr/include/mbedtls3 \
        -DPOLARSSL_LIBRARIES=/usr/lib/mbedtls3/libmbedcrypto.so \
        -D WARN_FLAGS:STRING="-Wall -Wextra"

  # mbedtls 3.x renamed config.h -> mbedtls_config.h and sha256_ret -> sha256
  # must run on the header cmake generates from ssl_bindings.h.in
  sed -i 's|mbedtls/config.h|mbedtls/mbedtls_config.h|;s|mbedtls_sha256_ret|mbedtls_sha256|' \
    include/dislocker/ssl_bindings.h

  make
}

check() {
  cd "$srcdir/${_name}-${pkgver}"
  # Smoke-test the C binaries from the source tree (mirrors upstream travis-test).
  # dislocker-find is a Ruby script requiring libdislocker installed to /usr/lib,
  # so it can only be tested after installation and is skipped here.
  local bin
  for bin in dislocker-fuse dislocker-file dislocker-metadata dislocker-bek; do
    "./src/$bin" -h >/dev/null 2>&1 || { echo "FAIL: $bin -h"; return 1; }
  done
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_name}/README"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${_name}/CHANGELOG"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

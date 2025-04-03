# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.7.3
pkgrel=6
pkgdesc="Read/write BitLocker-encrypted volumes"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls' 'ruby')
makedepends=('make' 'cmake')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=($url/archive/v$pkgver.tar.gz)
sha1sums=('1b40d70030cf914e86da8960fac83e9922ede04a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix inapt variable naming
  sed -i 's/true/trueval/g' src/config.c

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Dlibdir=/usr/lib \
        -DC_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/include/ruby-3.3.5/" \
        -D WARN_FLAGS:STRING="-Wall -Wextra" \

  # Fix mbedtls3 incompatibility
  mbedtlsver=$(LANG=C pacman -Qi mbedtls | awk '/^Version/ { print $3 }' | cut -d'.' -f 1)
  [ ${mbedtlsver} -ge 3 ] && sed -i 's|mbedtls/config.h|mbedtls/mbedtls_config.h|;s|mbedtls_sha256_ret|mbedtls_sha256|' include/dislocker/ssl_bindings.h

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

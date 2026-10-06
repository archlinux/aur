# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=libjasmin-easycrypt-bin
pkgver=2026.09.0
pkgrel=1
pkgdesc="EasyCrypt libraries used for verifying Jasmin implementations"
arch=('x86_64')
url="https://github.com/jasmin-lang/jasmin"
license=('MIT')

# Runtime dependencies available in official repositories
depends=()

# Tools required to extract the Debian package
makedepends=('binutils' 'tar')

# Debian packages
_pkgname=libjasmin-easycrypt

# Debian package version (may include dashes, unlike pkgver)
_debver="${pkgver}-1"

source=(
  "${_pkgname}_${_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/j/jasmin-compiler/${_pkgname}_${_debver}_amd64.deb"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/jasmin-lang/jasmin/v${pkgver}/LICENSE"
)

sha256sums=('950604d7ae822e2d892cf9007439686e3dde07efd7fe87169049cc1725781ce6'
            'c7232c2cda11e4270104f2fd4bfbc7b368f536ad58271a9ad2775d1000aefc05')

package() {
  cd "$srcdir"

  # Extract the Debian package
  ar x "${_pkgname}_${_debver}_amd64.deb"

  # Extract data archive (format may vary)
  if [ -f data.tar.xz ]; then
    tar -xf data.tar.xz -C "$pkgdir"
  elif [ -f data.tar.gz ]; then
    tar -xf data.tar.gz -C "$pkgdir"
  elif [ -f data.tar.zst ]; then
    tar -xf data.tar.zst -C "$pkgdir"
  fi

  # The Debian copyright file is empty, so ship the upstream MIT license text
  install -Dm644 "$srcdir/LICENSE-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Drop the Debian documentation directory (empty copyright + changelog)
  rm -rf "$pkgdir/usr/share/doc"
}

# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=easycrypt-bin
pkgver=2026.02
pkgrel=1
pkgdesc="Interactive framework for cryptographic proofs (EasyCrypt)"
arch=('x86_64')
url="https://github.com/EasyCrypt/easycrypt"
license=('MIT')

# Runtime dependencies available in official repositories
depends=(
  'ocaml'
  'gmp'
  'mpfr'
  'why3-bin'
)

# Tools required to extract the Debian package
makedepends=('binutils' 'tar')

# Debian packages
_pkgname=easycrypt

# Debian version string used in the source URL
_debver="${pkgver}-1"

source=(
  "${_pkgname}_${_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/e/easycrypt/${_pkgname}_${_debver}_amd64.deb"
)

sha256sums=('f4d9fa9b8a73d0d1d2fef3da242608654491c881fe9005a3f51f68b644f75bfd')

package() {
  cd "$srcdir"

  # Extract the Debian package
  ar x "${_pkgname}_${_debver}_amd64.deb"

  # Extract the data archive (format may vary)
  if [ -f data.tar.xz ]; then
    tar -xf data.tar.xz -C "$pkgdir"
  elif [ -f data.tar.gz ]; then
    tar -xf data.tar.gz -C "$pkgdir"
  elif [ -f data.tar.zst ]; then
    tar -xf data.tar.zst -C "$pkgdir"
  fi

  # Remove Debian-specific changelog files
  if [ -d "$pkgdir/usr/share/doc/$_pkgname" ]; then
    rm -f "$pkgdir/usr/share/doc/$_pkgname/changelog.Debian"*
  fi

  # Install license file if provided
  if [ -f "$pkgdir/usr/share/doc/$_pkgname/copyright" ]; then
    install -Dm644 \
      "$pkgdir/usr/share/doc/$_pkgname/copyright" \
      "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  fi
}

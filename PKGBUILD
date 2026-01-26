# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=libjasmin-easycrypt-bin
pkgver=2025.06.3
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
_debver="${pkgver}-1+trixie"

source=(
  "${_pkgname}_${_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/j/jasmin-compiler/${_pkgname}_${_debver}_amd64.deb"
)

sha256sums=('cccbf27a7070c26e2dff230c10c6395743b40ef7b41cfa50770926ea38c4f22d')

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

  # Install license or copyright if present
  if [ -f "$pkgdir/usr/share/doc/$_pkgname/copyright" ]; then
    install -Dm644 \
      "$pkgdir/usr/share/doc/$_pkgname/copyright" \
      "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  fi

  # Remove Debian-specific changelog files
  if [ -d "$pkgdir/usr/share/doc/$_pkgname" ]; then
    rm -f "$pkgdir/usr/share/doc/$_pkgname/changelog.Debian"*
  fi
}

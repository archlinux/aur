# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=easycrypt-bin
pkgver=2025.11
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

sha256sums=('e2cd61fa526d60516d4242ccd74183ef31e9e296efb0d2264098bdb9510ab7b1')

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

  # Move libraries from multiarch to Arch standard lib directory
  if [ -d "$pkgdir/usr/lib/x86_64-linux-gnu" ]; then
    for lib in "$pkgdir/usr/lib/x86_64-linux-gnu/"*.so*; do
      [ -e "$lib" ] || continue
      install -Dm755 "$lib" "$pkgdir/usr/lib/$(basename "$lib")"
    done
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu" 2>/dev/null || true
  fi

  # Create standard library symlinks if needed
  cd "$pkgdir/usr/lib"
  for lib_file in *.so.*; do
    base=$(echo "$lib_file" | sed 's/\(.so\).*/\1/')
    ln -sf "$lib_file" "$base"
  done

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

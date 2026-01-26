# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=jasmin-compiler-bin
pkgver=2025.06.3
pkgrel=1
pkgdesc="Compiler for the Jasmin language for high-assurance and high-speed cryptography"
arch=('x86_64')
url="https://github.com/jasmin-lang/jasmin"
license=('MIT')

depends=(
  'ocaml'
  'gmp'
  'mpfr'
  'ppl'
)

makedepends=('binutils' 'tar')

# Debian packages
_pkgname="jasmin-compiler"

# Debian package versions
_jasmin_debver="${pkgver}-1+trixie"
_apron_debver="0.9.15-1+trixie"

source=(
  "${_pkgname}_${_jasmin_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/j/${_pkgname}/${_pkgname}_${_jasmin_debver}_amd64.deb"
  "libapron_${_apron_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/a/apron/libapron_${_apron_debver}_amd64.deb"
)

sha256sums=('74f0c88b6c398c1527b691a68038cfc59812bd85def271be9d7e2e7fe1e34354' '3705a1761c289e690d0d9d408d10e0302da2f0d96fdbc7690db5eb27479e59f9')

package() {
  cd "$srcdir"

  # Extract Jasmin compiler
  ar x "${_pkgname}_${_jasmin_debver}_amd64.deb"
  for f in data.tar.*; do
    [ -f "$f" ] && tar -xf "$f" -C "$pkgdir"
  done

  # Extract Apron libraries
  ar x "libapron_${_apron_debver}_amd64.deb"
  for f in data.tar.*; do
    [ -f "$f" ] && tar -xf "$f" -C "$pkgdir"
  done

  # Move libraries from Debian multiarch directory to Arch lib directory
  if [ -d "$pkgdir/usr/lib/x86_64-linux-gnu" ]; then
    for lib in "$pkgdir/usr/lib/x86_64-linux-gnu/"*.so*; do
      [ -e "$lib" ] || continue
      install -Dm755 "$lib" "$pkgdir/usr/lib/$(basename "$lib")"
    done
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu" 2>/dev/null || true
  fi

  # Remove Debian-specific changelog files
  if [ -d "$pkgdir/usr/share/doc/$_pkgname" ]; then
    rm -f "$pkgdir/usr/share/doc/$_pkgname/changelog.Debian"*
  fi

  # Install license file if present
  if [ -f "$pkgdir/usr/share/doc/$_pkgname/copyright" ]; then
    install -Dm644 \
      "$pkgdir/usr/share/doc/$_pkgname/copyright" \
      "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  fi
}

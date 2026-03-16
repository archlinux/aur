# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=jasmin-compiler-bin
pkgver=2026.03.0
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
_jasmin_debver="${pkgver}-1"
_apron_debver="0.9.15-1"

source=(
  "${_pkgname}_${_jasmin_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/j/${_pkgname}/${_pkgname}_${_jasmin_debver}_amd64.deb"
  "libapron_${_apron_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/a/apron/libapron_${_apron_debver}_amd64.deb"
)

sha256sums=('419e0287e6ae4188552288e837ecd03e926a8cd19910778bacda40507e87b7a5' 'c32aa0507c4afa33063bc8bb7bf64c1782684b723301ae35061736363a4ee555')

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

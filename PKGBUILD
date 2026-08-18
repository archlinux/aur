# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=jasmin-compiler-bin
pkgver=2026.03.2
pkgrel=2
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

# Upstream ships fully stripped binaries: skip strip/debug package generation
options=('!strip' '!debug')

# Debian packages
_pkgname="jasmin-compiler"

# Debian package versions
_jasmin_debver="${pkgver}-1"
_apron_debver="0.9.15-1"

source=(
  "${_pkgname}_${_jasmin_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/j/${_pkgname}/${_pkgname}_${_jasmin_debver}_amd64.deb"
  "libapron_${_apron_debver}_amd64.deb::https://repo.formosa-crypto.org/debian/pool/main/a/apron/libapron_${_apron_debver}_amd64.deb"
)

sha256sums=('4835908c5f00d13390cc41959ddaaf3cd2436be795e5bf7fdab4e888c49915c3' 'c32aa0507c4afa33063bc8bb7bf64c1782684b723301ae35061736363a4ee555')

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

  # Shared libraries must be executable
  chmod 755 "$pkgdir"/usr/lib/*.so

  # Remove Debian-specific changelog files
  rm -f "$pkgdir"/usr/share/doc/*/changelog.Debian* \
        "$pkgdir"/usr/share/doc/*/changelog.gz

  # Upstream ships an empty debian/copyright, the real license lives in /usr/doc
  install -Dm644 "$pkgdir/usr/doc/jasmin/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Move docs out of the non-standard /usr/doc
  install -Dm644 "$pkgdir/usr/doc/jasmin/README.md" \
    "$pkgdir/usr/share/doc/$_pkgname/README.md"
  rm -rf "$pkgdir/usr/doc"
  rm -f "$pkgdir/usr/share/doc/$_pkgname/copyright" \
        "$pkgdir/usr/share/doc/libapron/copyright"
}

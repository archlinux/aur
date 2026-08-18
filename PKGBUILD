# Maintainer: Davide Carnemolla <herbrant@protonmail.com>

pkgname=why3-bin
pkgver=1.8.2
pkgrel=2
pkgdesc="Software verification platform for deductive program verification"
arch=('x86_64')
url="https://gitlab.inria.fr/why3/why3"
license=('LGPL2.1')

# Prebuilt Debian binaries: no debug symbols to extract and nothing to strip,
# so skip both to avoid a wall of gdb-add-index/readelf errors during makepkg
options=('!strip' '!debug')

# Runtime dependencies — most must be provided by Arch packages
depends=(
  'ocaml'
)

makedepends=('binutils' 'tar')

# Debian packages
_pkgname=why3

# Debian package version string from stable (trixie)
_debver="1.8.2-3+b2"

source=(
  "${_pkgname}_${_debver}_amd64.deb::https://deb.debian.org/debian/pool/main/w/${_pkgname}/${_pkgname}_${_debver}_amd64.deb"
)

sha256sums=('26391efd4f33c8d6e241cf32ce162a1968354b0d89d59b9adccbeb0354795b45')

package() {
  cd "$srcdir"

  # Extract the .deb archive
  ar x "why3_${_debver}_amd64.deb"

  # Extract the data archive
  if [ -f data.tar.xz ]; then
    tar -xf data.tar.xz -C "$pkgdir"
  elif [ -f data.tar.gz ]; then
    tar -xf data.tar.gz -C "$pkgdir"
  elif [ -f data.tar.zst ]; then
    tar -xf data.tar.zst -C "$pkgdir"
  fi

  # Strip Debian-specific docs
  if [ -d "$pkgdir/usr/share/doc/${_pkgname}" ]; then
    rm -f "$pkgdir/usr/share/doc/${_pkgname}/changelog.Debian"*
  fi

  # Install license if present
  if [ -f "$pkgdir/usr/share/doc/${_pkgname}/copyright" ]; then
    install -Dm644 \
      "$pkgdir/usr/share/doc/why3/copyright" \
      "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  fi
}

# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase=ctrulib
pkgname="$_pkgbase-git"
pkgver=r686.e7ea04e
pkgrel=1
pkgdesc="C library for writing user mode arm11 code for the 3DS (CTR)"
arch=('i686' 'x86_64')
url="https://github.com/smealum/ctrulib"
license="ZLIB"
depends=('devkitarm')
makedepends=('git')
optdepends=('doxygen: to generate HTML documentation, rebuild after installing')
options=('!strip' 'staticlibs')

source=("$_pkgbase::git+https://github.com/smealum/ctrulib")
sha1sums=('SKIP')

# We need to call it libctru since some homebrews hardcode that path…
_libname=libctru

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd "$srcdir/$_pkgbase"
#  git apply /tmp/rmdir.patch
#}

build() {
  cd "$srcdir/$_pkgbase/libctru"
  unset CFLAGS
  source /etc/profile.d/devkitarm.sh
  make

  # Don’t fail when doxygen isn’t present.
  make dox || true
}

package() {
  source /etc/profile.d/devkitarm.sh
  export _DEVKITPRO="$pkgdir/$DEVKITPRO"

  cd "$srcdir/$_pkgbase"
  install -dm755 "$_DEVKITPRO/examples"
  cp -r examples "$_DEVKITPRO/examples/3ds"

  cd libctru
  install -dm755 "$_DEVKITPRO/$_libname"
  cp -r include lib "$_DEVKITPRO/$_libname"

  # Don’t fail when doxygen isn’t present.
  hash doxygen && (
    install -dm755 "$pkgdir/usr/share/doc"
    cp -r docs "$pkgdir/usr/share/doc/$_pkgbase"
  )

  # Make $CTRULIB available system-wide.
  install -dm755 "$pkgdir/etc/profile.d"
  echo "export CTRULIB='$DEVKITPRO/$_libname'" > "$pkgdir/etc/profile.d/$_pkgbase.sh"
  chmod +x "$pkgdir/etc/profile.d/$_pkgbase.sh"
}

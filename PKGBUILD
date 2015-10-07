# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase=ctrulib
pkgname="$_pkgbase-git"
pkgver=r804.b9e5ddb
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

  # We need to fake the DEVKITPRO variable for make install to work.
  export _DEVKITPRO="$DEVKITPRO"
  export DEVKITPRO="$pkgdir/$_DEVKITPRO"

  cd "$srcdir/$_pkgbase"
  install -dm755 "$DEVKITPRO/examples"
  cp -r examples "$DEVKITPRO/examples/3ds"

  cd libctru
  make DESTDIR="$pkgdir/" install

  # Don’t fail when doxygen isn’t present.
  hash doxygen && (
    install -dm755 "$pkgdir/usr/share/doc"
    cp -r docs "$pkgdir/usr/share/doc/$_pkgbase"
  )

  # Make $CTRULIB available system-wide.
  install -dm755 "$pkgdir/etc/profile.d"
  echo "export CTRULIB='$_DEVKITPRO/$_libname'" > "$pkgdir/etc/profile.d/$_pkgbase.sh"
  chmod +x "$pkgdir/etc/profile.d/$_pkgbase.sh"
}

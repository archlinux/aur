# Maintainer: Alain Kalker <a "dot" c "dot" kalker {at} gmail "dot" com>
pkgname=livegrep-git
pkgver=577.a449e49
pkgrel=1
pkgdesc="Interactively grep source code"
arch=('i686' 'x86_64')
url="https://github.com/nelhage/livegrep"
license=('BSD')
# Codesearch uses private APIs of the RE2 library, so it needs access to
# uninstalled header files. Also, it needs to be linked to libre2.a, which
# the re2 package in the AUR doesn't install, so we build and install
# a local copy of RE2
_re2_pkgname=re2
_re2_pkgver=20130802
depends=('nodejs' 'libgit2' 'google-gflags' 'json-c')
makedepends=('git' 'boost' 'sparsehash')
provides=('livegrep')
conflicts=('livegrep')
install=$pkgname.install
_gitname=livegrep
source=("git://github.com/nelhage/$_gitname"
        "https://re2.googlecode.com/files/${_re2_pkgname}-${_re2_pkgver}.tgz")
md5sums=('SKIP'
         'e5e52f0f9b8705d29161a896fb459c55')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  # Build and install libre2 locally
  cd "$srcdir/$_re2_pkgname"
  make prefix=/usr
  make prefix=/usr DESTDIR="$srcdir/$_re2_pkgname" install

  cd "$srcdir/$_gitname"
  # Link to libjson-c
  sed -i -e 's/-ljson/-ljson-c/' Makefile
  # Fix insecure RPATH
  sed -i -e '/-Wl\$(comma)-R%\/lib/d' Makefile
  # Add paths to RE2 headers and static library
  make CPPFLAGS="$CPPFLAGS -I$srcdir/$_re2_pkgname" libre2="$srcdir/$_re2_pkgname/usr"
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m755 "$pkgdir/usr/lib/$pkgname"
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a codesearch package.json web munin "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # Install BSD licenses
  install -Dm644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/$_re2_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

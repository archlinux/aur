# Maintainer:
# Contributor: Jan Fader <jan.fader@web.de>

## useful links:
# http://packages.debian.org/unstable/sound/mp3rename

: ${_pkgrel_debian:=13}

_pkgname="mp3rename"
pkgname="$_pkgname"
pkgver=0.6
pkgrel=14
pkgdesc="Rename mp3 files based on id3tags"
url="https://salsa.debian.org/debian/mp3rename"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=('glibc')

_pkgsrc="$_pkgname-$pkgver.orig"
_dl_url="http://ftp.debian.org/debian/pool/main/m/mp3rename"
source=(
  "$_dl_url/${_pkgname}_$pkgver.orig.tar.gz"
  "$_dl_url/${_pkgname}_$pkgver-${_pkgrel_debian}.debian.tar.xz"
  "mp3rename-jf-long-options.patch"
)

sha256sums=(
  '3bd0c73d542901a012ace7a16957ff79a8b297ed98a412004320a22dcfdc8c5e'
  '388dcab2f4deb34a0a857c2fe7c10d2e34b00ac8af56e8bdc004ff8e7da22966'
  '2cf135666f30e315e1023302229a3b9df4db31a78339cb70c00b5efd45a32ee5'
)

prepare() {
  cd "$_pkgsrc"

  # apply debian patches
  xargs -a "$srcdir/debian/patches/series" -d "\n" -i -P 1 \
    -- patch -p 1 -i "$srcdir/debian/patches/{}"

  # apply long-options patch
  patch -p 1 -i "$srcdir/mp3rename-jf-long-options.patch"
}

build() {
  cd "$_pkgsrc"
  make || return 1
}

package() {
  cd "$_pkgsrc"
  PREFIX="$pkgdir" make install
  install -Dm644 "$srcdir/debian/$_pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}

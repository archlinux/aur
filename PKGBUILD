# Maintainer:
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Franziskus Kiefer <franziskuskiefer@gmail.com>

_pkgname="nspr"
pkgname="$_pkgname-hg"
pkgver=4.35.r4.g3e25d69ba6b2
pkgrel=1
pkgdesc="Netscape Portable Runtime"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64)
license=(MPL GPL)

depends=(glibc sh)
makedepends=(mercurial zip)

conflicts=('nspr')
provides=("nspr=${pkgver%.r*}")

_pkgsrc="$_pkgname"
source=("hg+https://hg.mozilla.org/projects/nspr")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  hg log -r . --template '{latesttag}.r{latesttagdistance}.g{node|short}\n' \
    | sed 's/^[a-zA-Z_]*//;s/_RTM//;s/_\([a-zA-Z][a-zA-Z0-9]\+\)/\1/;s/_/./g' \
    | tr '[:upper:]' '[:lower:]'
}

prepare() {
  cd "$_pkgsrc"

  local _configure_options=(
    --prefix=/usr
    --libdir=/usr/lib
    --includedir=/usr/include/nspr
    --enable-optimize
    --disable-debug
    --enable-64bit
  )

  ./configure "${_configure_options[@]}"
}

build() {
  cd "$_pkgsrc"
  make ${SOURCE_DATE_EPOCH:+
    SH_NOW="${SOURCE_DATE_EPOCH}000000"
    SH_DATE="$(date --utc --date="@$SOURCE_DATE_EPOCH" '+%Y-%m-%d %T')"
  }
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install

  ln -s nspr.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nspr.pc"

  rm -r "$pkgdir"/usr/bin/{compile-et.pl,prerr.properties} \
        "$pkgdir"/usr/include/nspr/md
}


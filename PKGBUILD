# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgname=lib32-nspr-hg
# TODO: read version from source
pkgver=4.29
pkgrel=1
pkgdesc="Netscape Portable Runtime (32-bit)"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64)
license=(MPL GPL)
depends=(lib32-glibc nspr)
makedepends=(zip)
provides=(lib32-nspr)
conflicts=(lib32-nspr)
source=("hg+https://hg.mozilla.org/projects/nspr")
sha256sums=('SKIP')

pkgver() {

  #Thanks Kozeid

  cd "nspr"

  printf "%s.r%s.%s" \
  "$(hg log -r . -T "{latesttag}" | sed 's/^release-//')" \
  "$(hg identify -n)" \
  "$(hg identify -i)"
}

prepare() {
  cd nspr
}

build() {
  cd nspr
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --includedir=/usr/include/nspr \
      --enable-optimize \
      --disable-debug \
      --disable-64bit
  make ${SOURCE_DATE_EPOCH:+
    SH_NOW="${SOURCE_DATE_EPOCH}000000"
    SH_DATE="$(date --utc --date="@$SOURCE_DATE_EPOCH" '+%Y-%m-%d %T')"
  }
}

package() {
  cd nspr
  make DESTDIR="$pkgdir" install
  ln -s nspr.pc "$pkgdir/usr/lib32/pkgconfig/mozilla-nspr.pc"
  rm -r "$pkgdir"/usr/bin/{compile-et.pl,prerr.properties} \
        "$pkgdir"/usr/include/nspr/md
  rm -r "$pkgdir"/usr/{bin,share,include}
}

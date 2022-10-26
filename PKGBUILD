# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=sortdir
pkgver=0.6
pkgrel=6
pkgdesc='Have [almost] any application sort its directory listings'
arch=('x86_64' 'armv7h' 'aarch64')
url='http://ftp.uhulinux.hu/sources/sortdir'
license=('GPL2')
provides=('sortdir')
conflicts=('sortdir')
source=(
  "$url/$pkgname-$pkgver.tar.gz"
  "$pkgname.sh"
)
_libname="lib$pkgname"
_soname="$_libname.so"

build() {
  cd "$pkgname-$pkgver" || exit 1

  export CFLAGS="$CFLAGS $LTOFLAGS -shared -ldl -fPIC"

  gcc $CFLAGS $LDFLAGS -o "$_soname" "${_libname}.c"
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 "$_soname"                 "$pkgdir/usr/lib/$_soname.$pkgver"
  ln -srf "$pkgdir/usr/lib/$_soname.$pkgver" "$pkgdir/usr/lib/$_soname"

  for readme in README_{EN,HU}; do
    install -Dm0644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
  done

  install -Dm0755 "$startdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

post_install() {
  ldconfig
}

post_upgrade() {
  post_install "$@"
}

sha256sums=(
  '62acb494d995e868d721d01e2d00e525f2ead23670ba23272d529a7606eebd2e'
  'b35551be49b7a5346f191ac64ad294f13e2216012371a3b50e75fbba953ae1a7'
)
sha512sums=(
  'b20db137a559fef9962a842b84fd177206af2d3f64399c1fe11f34add00b5350d2f3e33a453d87c49860259d0a9b99853ced06f84848c538a3b9321bd0f6b210'
  '9ba569fa5b0707d77f2810e3944950214b21c4ddf1f0c26417f67c0aa4fb6ebf1088560f7a37162f150976cba62267cf33053c4adba3f5e97169e42cd6f2722a'
)
b2sums=(
  '2ecb715e454d796bfd1ae6888f294a51ed2af13970cb5f204de76e35065568ed4ab31b694b9f1f7a64b119c0aeca113d8ad9c3f1cf03e32524b4de770e65686f'
  '2092c115eb17ea2b70caedbe619aa9965be8ef5b7e857bdc3616cee6943b413b671a9e4f7e5c5aacd7372ff3598336d245a3e5ac0660cc3bcfc9a5c9099a8336'
)

# eof

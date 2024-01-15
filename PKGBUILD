# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=sortdir
pkgver=0.6
pkgrel=8
pkgdesc='Have [almost] any application sort its directory listings'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='http://ftp.uhulinux.hu/sources/sortdir'
license=('GPL-2.0-or-later')
source=(
  "$url/$pkgname-$pkgver.tar.gz"
  "$pkgname.sh"
)
depends=('glibc' 'sh')

_libname="lib$pkgname"
_soname="$_libname.so"

build() {
  cd "$pkgname-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  export CFLAGS="$CFLAGS $LTOFLAGS -shared -ldl -fPIC"

  gcc $CFLAGS $LDFLAGS -o "$_soname" "${_libname}.c"
}

package() {
  install -vDm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  cd "$pkgname-$pkgver"

  install -vDm0755 "$_soname"                 "$pkgdir/usr/lib/$_soname.$pkgver"
  ln -srf "$pkgdir/usr/lib/$_soname.$pkgver" "$pkgdir/usr/lib/$_soname"

  for _readme in README_{EN,HU}; do
    install -vDm0644 "$_readme" "$pkgdir/usr/share/doc/$pkgname/$_readme"
  done

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
b2sums=(
  '2ecb715e454d796bfd1ae6888f294a51ed2af13970cb5f204de76e35065568ed4ab31b694b9f1f7a64b119c0aeca113d8ad9c3f1cf03e32524b4de770e65686f'
  '2092c115eb17ea2b70caedbe619aa9965be8ef5b7e857bdc3616cee6943b413b671a9e4f7e5c5aacd7372ff3598336d245a3e5ac0660cc3bcfc9a5c9099a8336'
)

# eof

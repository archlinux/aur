# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: jiangxq <jiangxueqian at gmail dot com>
# Contributor: zh99998 <zh99998@gmail.com>
# Contributor: 4679kun <admin at 4679 dot us>
# Contributor: ehs2013 <bvs@ge.krtac.win>

_pkgname=shadowsocks-libev
pkgname=shadowsocks-libev-ipv6first
pkgver=2.4.6
pkgrel=1
pkgdesc='A lightweight secured socks5 proxy for embedded devices and low end boxes (Server resolve IPv6 first)'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocks/shadowsocks-libev'
license=('GPL3')
depends=('libcap' 'openssl' 'libsodium' 'libev' 'udns' 'zlib')
makedepends=('git')
conflicts=('shadowsocks-libev')
provides=('shadowsocks-libev')
install=${_pkgname}.install
source=("git+https://github.com/shadowsocks/${_pkgname}.git#tag=v$pkgver"
        'ipv6.patch'
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service'
        'shadowsocks-libev-redir@.service'
        'shadowsocks-libev-tunnel@.service')

sha512sums=('SKIP'
            '456498dd00d6ce900882aa2cc66814f4c6c56cda938a83886f24bae759722bf6a8903d3112ee829ca635a4a8af8eb827815ecb9d44904021e41943e99b98b125'
            '96e5c9ba04a8d45fa57728aeb5282cf25fce42baf2c2221c5040cced89196b25d2c212472ba9b3f53bdce93ad1edd5f06e42ec62ef212764349c1dab24dde16a'
            '73925959731b7ab6e2b3900662f4b67a9986b798b1a4a943307c87574c9069e32a0c2298cf6e9adb895fe71316a3bac09cb684c54e8a1350566b2fe7526c1cff'
            'bc336201afdc556130fc0bcacaf8be1588640d9d5426637eca8db473389910f6bfba39672cd69e7fa90548fe83cf8e6006f0f27dab7c937501faa1cdd09629c5'
            'd03e0af078a4c996f300c773dd4f13b20f28717913bfe2c58bf7894fa6673940a4a0d9357464dc46956d83ca1dcdab73dd97569e2a95fb6f22ac72571c4f23be')

build() {
  cd "$srcdir/$_pkgname"
  patch -p0 < ../ipv6.patch
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --enable-system-shared-lib
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-redir@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-redir@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-tunnel@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-tunnel@.service"
}

# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>
# Contributor: Lobo Torres <lobo@quiltro.org>
# -*- mode: sh -*-

pkgname='betula'
pkgver=1.5.0
pkgrel=1
pkgdesc='Self-hosted personal link collection manager'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://git.sr.ht/~bouncepaw/betula"
license=('AGPL3')
depends=('sqlite' 'glibc')
makedepends=('go')
source=("v$pkgver.tar.gz::https://git.sr.ht/~bouncepaw/betula/archive/v$pkgver.tar.gz"
        "betula.service"
        "sysusers-betula.conf"
        "tmpfiles-betula.conf")
sha512sums=('ed72b0aa740a75bb6366cfe203191ce9e13901c84449e5c2949f7dc1a964532c5924ac8218080cc0b74fee80ac72725d6982d7aefca5f9a4a135fef961a99665'
            '09a770e73cbfd3f0e1f95dc0ef638f71cae2abb8b3a462bb2107c5c4d2caa02e9c6ed4328ad11b0eadab5619cd31f39150077447f059427781d12ecacc0d7641'
            '64a833456140c1fccf70ba5dfc8070f4039eaf904c5a487af817c64658c47077dcf45a0529aedd6bb7a72ace7524c8ef622b60eb75819b2abb016968e796ba49'
            'a8581fbd0a5918cb1a5dcd6a980f921e8c356f3effd35dc8ab91e4600723f3f6e5c101142488e8dca7ffdd73abaf2df726f5750f30baaea4289614bf9ba99dfd')

prepare() {
  cd "$pkgname-v$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-v$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -extldflags \"${LDFLAGS}\" -X main.version=$pkgver" \
    -tags "libsqlite3 linux" \
    -o build \
     ./cmd/betula
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm0755 "build/betula" "$pkgdir/usr/bin/betula"
  install -Dm0644 "README.md"    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir"/betula.service "$pkgdir"/usr/lib/systemd/system/betula.service
  install -Dm644 "$srcdir"/sysusers-betula.conf "$pkgdir"/usr/lib/sysusers.d/betula.conf
  install -Dm644 "$srcdir"/tmpfiles-betula.conf "$pkgdir"/usr/lib/tmpfiles.d/betula.conf
}

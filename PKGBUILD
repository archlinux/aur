# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>
# Contributor: Lobo Torres <lobo@quiltro.org>
# -*- mode: sh -*-

pkgname='betula'
pkgver=1.8.1
pkgrel=1
pkgdesc='Self-hosted personal link collection manager'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://codeberg.org/bouncepaw/betula"
license=('AGPL-3.0-only')
depends=('sqlite' 'glibc')
makedepends=('go')
source=("betula-v$pkgver.tar.gz::https://codeberg.org/bouncepaw/betula/archive/v$pkgver.tar.gz"
        "betula.service"
        "sysusers-betula.conf"
        "tmpfiles-betula.conf")
sha512sums=('d87d06ff4706547d768f58b2bee82421688aba2439b3f8e81ad2c8362243d515f9b2def8b9f94200b0d74a8a72f776b521a678987021902ca41e32bf9e3e24b0'
            'f2da249caf061664620d547104875aaa5380a2bab6e109ec064abc13440697fba68e444bddc0f14de37507dda8ab09a641ac8f6f1cacfa557e5488d1337aadfa'
            '64a833456140c1fccf70ba5dfc8070f4039eaf904c5a487af817c64658c47077dcf45a0529aedd6bb7a72ace7524c8ef622b60eb75819b2abb016968e796ba49'
            'a8581fbd0a5918cb1a5dcd6a980f921e8c356f3effd35dc8ab91e4600723f3f6e5c101142488e8dca7ffdd73abaf2df726f5750f30baaea4289614bf9ba99dfd')

prepare() {
  cd "$pkgname"
  mkdir -p build
}

build() {
  cd "$pkgname"

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
  cd "$pkgname"

  install -Dm0755 "build/betula" "$pkgdir/usr/bin/betula"
  install -Dm0644 "README.md"    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir"/betula.service "$pkgdir"/usr/lib/systemd/system/betula.service
  install -Dm644 "$srcdir"/sysusers-betula.conf "$pkgdir"/usr/lib/sysusers.d/betula.conf
  install -Dm644 "$srcdir"/tmpfiles-betula.conf "$pkgdir"/usr/lib/tmpfiles.d/betula.conf
}

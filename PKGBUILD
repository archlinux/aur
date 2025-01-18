# Maintainer: envolution
# Contributor: éclairevoyant
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=owncast
pkgver=0.2.1
pkgrel=1
pkgdesc='Self-hosted live video streaming (chat included)'
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/owncast/owncast/archive/refs/tags/v${pkgver}.tar.gz"
  owncast.tempfiles.conf
  owncast.users.conf
  owncast.service
)
b2sums=('6b28be597b6c1089d0a207b114f789cb1e5c215aa7fa7529600fc3112ba3654d73aa51b4d809e2cf036be88a0c8fdedd7ca6abdc4bf32ac401b48b57f46120f4'
        '4cfc8fff50a032f849eea3ff2b1193f5d1cf3c2f5ed995621c63b2cf273af4298271941f27f2aa3c6bc96d2cc3262da1f65f3d251f973aa5fe0cbbfe824f0042'
        '157be9c742c578f9096b32b877dae28627783f55bf6c5ca575bfa60b8b329c3096e4e1ebacc2b1eac7f6804fa6692dac89360d4160921f867a1a3f14954b3d4a'
        '4466d8017f264a7b7be432418ac6ba76c610459754ca85f10403a8f4577227588c26911738e3726349c3cdf1c041219a3c4d6840bfa4959f965678dfb97343ef')
options=(emptydirs)
install=$pkgname.install

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -X main.version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  install -vDm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 $pkgname.users.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 $pkgname.tempfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  cd $pkgname-$pkgver
  install -vDm755 $pkgname -t "$pkgdir/usr/bin/"
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:

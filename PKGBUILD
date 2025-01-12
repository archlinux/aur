# Maintainer: envolution
# Contributor: éclairevoyant
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=owncast
pkgver=0.2.0
pkgrel=1
pkgdesc='Self-hosted live video streaming (chat included)'
url="https://github.com/owncast/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  owncast.tempfiles.conf
  owncast.users.conf
  owncast.service
)
b2sums=('3290319be8b46ad4aeef69366793b2ad0bb341afaed87d6aa81025decd329905968452429bc492e3682f544aac07366d0051011d76edb217b6c836999f064b17'
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

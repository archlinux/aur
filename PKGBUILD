# Maintainer: envolution
# Contributor: éclairevoyant
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=owncast
pkgver=0.2.1
pkgrel=3
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
b2sums=('fd9a0837e6df00e24891bed53c6c62648303efce48e3f57e73967e5d329f4146b01ea52bbcfcb52f8ddd480005b25c79be9383969ffe3da11ec00a9e640a4b37'
        '1cbb1583a031ebb62cc340e565da4562a1eee77e1ec01dffa6b99eb155c9ea7a8000cebf95093f1a5af197ab3b45e69bb13bfcbc81137d79b93c68f7d5ed5584'
        '157be9c742c578f9096b32b877dae28627783f55bf6c5ca575bfa60b8b329c3096e4e1ebacc2b1eac7f6804fa6692dac89360d4160921f867a1a3f14954b3d4a'
        '4466d8017f264a7b7be432418ac6ba76c610459754ca85f10403a8f4577227588c26911738e3726349c3cdf1c041219a3c4d6840bfa4959f965678dfb97343ef')
options=(emptydirs !strip)
install=$pkgname.install

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/rev-parse.*show-toplevel/{c\
    cd /usr/share/webapps/owncast\
    rm -rf web/node_modules web/package-lock.json
    }' build/web/bundleWeb.sh
  sed -i 's/npm.*silent.*install.*/npm install/' build/web/bundleWeb.sh

}
build() {
  cd "$pkgname-$pkgver"
  # Build backend
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" -ldflags "-extldflags '${LDFLAGS}' -s -w -X main.version=${pkgver}"
}

package() {
  install -vDm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 $pkgname.users.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 $pkgname.tempfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  cd $pkgname-$pkgver
  install -vdm755 "$pkgdir/usr/share/webapps/$pkgname/static"
  cp -R web "$pkgdir/usr/share/webapps/$pkgname/"
  install -Dm755 build/web/bundleWeb.sh -t "$pkgdir/usr/share/webapps/$pkgname"
  install -vDm755 $pkgname -t "$pkgdir/usr/bin/"
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:

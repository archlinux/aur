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
makedepends=(git go npm nvm)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/owncast/owncast/archive/refs/tags/v${pkgver}.tar.gz"
  owncast.tempfiles.conf
  owncast.users.conf
  owncast.service
)
b2sums=('6b28be597b6c1089d0a207b114f789cb1e5c215aa7fa7529600fc3112ba3654d73aa51b4d809e2cf036be88a0c8fdedd7ca6abdc4bf32ac401b48b57f46120f4'
        'e59e3063497f6e3644a5d39fba1195ce787b828e98a1c3d6570e44361487685fe9f532210c465abbac756362ae5a3da29f252f2c554e95c7ad627e3c92ac349d'
        '157be9c742c578f9096b32b877dae28627783f55bf6c5ca575bfa60b8b329c3096e4e1ebacc2b1eac7f6804fa6692dac89360d4160921f867a1a3f14954b3d4a'
        '4466d8017f264a7b7be432418ac6ba76c610459754ca85f10403a8f4577227588c26911738e3726349c3cdf1c041219a3c4d6840bfa4959f965678dfb97343ef')
options=(emptydirs !strip)
install=$pkgname.install

_ensure_local_nvm() {
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  nvm install --lts=iron
}

build() {
  cd "$pkgname-$pkgver"
  # Build backend
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" -ldflags "-extldflags '${LDFLAGS}' -s -w -X main.version=${pkgver}"

  #Build frontend
  _ensure_local_nvm
  cd web
  npm install
}

package() {
  install -vDm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 $pkgname.users.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 $pkgname.tempfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  cd $pkgname-$pkgver
  install -vdm755 "$pkgdir/var/lib/$pkgname"
  cp -R web "$pkgdir/var/lib/$pkgname/"
  echo "lts/iron" >"$pkgdir"/var/lib/"$pkgname"/web/.nvmrc
  chown -R owncast:owncast "$pkgdir/var/lib/$pkgname/web"
  install -vDm755 $pkgname -t "$pkgdir/usr/bin/"
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:

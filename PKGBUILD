# Maintainer: ml <ml@visu.li>
# to build in clean chroot build helm-diff from AUR, then pass to build cmd:
# $ extra-x86_64-build -- -I helm-diff-3.1.3-2-x86_64.pkg.tar.zst
pkgname=helmsman
pkgver=3.6.3
pkgrel=1
pkgdesc='Helm Charts as Code'
arch=('x86_64' 'i686')
url='https://github.com/Praqma/helmsman'
license=('MIT')
depends=('helm-diff' 'kubectl')
optdepends=(
  'ruby-hiera-eyaml: backend for secret encryption'
  'helm-secrets: backend for secret encryption')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('05ce86066028ed0fbb99902018953107432727abe297745de4013815b5bf6781')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  # man makepkg(8), https://github.com/Praqma/helmsman/blob/master/Makefile
  TZ=UTC printf -v _date '%(%d%m%y)T' "${SOURCE_DATE_EPOCH:- -1}"
  go build -ldflags "-linkmode=external -X main.version=v$pkgver-$_date" ./cmd/helmsman
}

check() {
  cd "$pkgname-$pkgver"
  go test -short ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # README, docs and examples
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a docs examples -t "$pkgdir/usr/share/doc/$pkgname"
}

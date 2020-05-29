# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>
_pkgname=google-safebrowsing
pkgname=${_pkgname}-git
pkgver=r53.bbf0d20
pkgrel=1
pkgdesc="Google SafeBrowsing API"
url="https://github.com/google/safebrowsing/"
license=('Apache')
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$_pkgname::git+https://github.com/google/safebrowsing.git"
  "service"
  "config"
  "sysusers.conf"
  "tmpfiles.conf"
)
arch=('x86_64')
noextract=()
makedepends=(git go)
depends=(glibc)
backup=(
	"etc/google-safebrowsing/config"
)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" "$_pkgname/build/"*
  install -dm750 "$pkgdir/etc/$_pkgname"
  install -Dm644 -t "$pkgdir/etc/$_pkgname" config
  install -Dm644 "service" $pkgdir/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 "sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
sha256sums=('SKIP'
            '137639f360bf8d543795e5ae26bf5f53755abcff16bdac86a49deabf59bf6a3b'
            '67a1ecce83116dc1c1f5d969afe14c620dd0f421969648ecd26a88fa8b6cfd39'
            '2454d1de95e33172759f6f1643082bc1a8bc3090c8ea939142c2d70cc78300c8'
            '8df8dc5a1a8e482c4d8b044ffe055e37a0219ad63fe4da0c31e7c364e96b3c03')

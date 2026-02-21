# Maintainer: le0nxx <leonlawxx@outlook.sg>
_name=dae
pkgname=${_name}-kix-git
pkgver=r4baacef
pkgrel=2
pkgdesc="由 kix fork 的 dae 分支版本"
arch=('x86_64' 'aarch64')
conflicts=($_name)
provides=($_name)
url="https://github.com/olicesx/dae"
license=('AGPL-3.0-or-later')

depends=()
optdepends=(
  'v2ray-geoip: geoip database'
  'v2ray-domain-list-community: domain rules'
)
makedepends=('git' 'go' 'base-devel' 'clang' 'llvm' 'libbpf' 'linux-headers' 'linux-api-headers') 
source=(
        "${pkgname}::git+${url}.git"
        "geoip.dat::https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
	      "geosite.dat::https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"
)
sha256sums=(
	"SKIP"
	"SKIP"
	"SKIP"
)
options=('!debug')

pkgver() {
  cd "$pkgname"
  local desc
  if desc=$(git describe --long --tags 2>/dev/null); then
    echo "$desc" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    # no tags present, use abbreviated commit and date
    echo "r$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  local safe_cflags
  safe_cflags="${CFLAGS//-march=[^ ]*/}"
  safe_cflags="${safe_cflags//-mtune=[^ ]*/}"
  CFLAGS="$safe_cflags" make
}

package() {
  cd "$pkgname"
  install -Dm755 dae "$pkgdir/usr/bin/dae"
  install -Dm644 "install/dae.service" "$pkgdir/usr/lib/systemd/system/dae.service"
  install -Dm644 "example.dae" "$pkgdir/etc/dae/example.dae"
  install -Dm640 "install/empty.dae" "${pkgdir}/etc/dae/config.dae"

	mkdir -p "${pkgdir}/usr/share/dae/"
	cp ../geoip.dat "${pkgdir}/usr/share/dae/geoip.dat"
	cp ../geosite.dat "${pkgdir}/usr/share/dae/geosite.dat"
}
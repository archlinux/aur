# Maintainer: ml <ml@visu.li>
pkgname=etcdadm
pkgver=0.1.5
pkgrel=1
pkgdesc='Commandline tool for operating an etcd cluster'
arch=('x86_64')
url='https://github.com/kubernetes-sigs/etcdadm'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ad5a828d09e154b745fce0cd74d0257f61307ed4323a54272d3e2512d5a37eb9')

build() {
  local _commit='' _ver=${pkgver%.?}
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)

  local -a _x=(
    buildDate="$(TZ=UTC printf '%(%FT%T)TZ' "$SOURCE_DATE_EPOCH")"
    gitCommit="${_commit:?}"
    gitTreeState="clean"
    gitVersion="v$pkgver"
    gitMajor="${_ver%.?}"
    gitMinor="${_ver#?.}"
  )
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o "$pkgname" -ldflags "-linkmode=external ${_x[*]/#/-X=k8s.io/component-base/version.}" main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

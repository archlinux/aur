# Maintainer: Danny Grove <aur@dannygrove.com>
pkgname=ksops-dry-run
_dryrunver=0.2.0
_ksopsver=4.5.1
pkgver=${_dryrunver}_${_ksopsver}
pkgrel=1
pkgdesc="Kustomize plugin to fake the decryption of ksops secrets"
url="https://github.com/joshdk/$pkgname"
_ksopsurl="https://github.com/viaduct-ai/kustomize-sops"
license=("MIT")
arch=("x86_64" "aarch64")
makedepends=("go")
conflicts=("kustomize-sops" "ksops-bin")
source=("$url/archive/refs/tags/v$_dryrunver.tar.gz" "$_ksopsurl/archive/refs/tags/v$_ksopsver.tar.gz")
sha256sums=('80690d0d702b997aeb1ae6d6a7dc8ea8800d64c7307c004209387947bbd33aa2' 'c3cd2b77e6adb4cc84bcaad8cbd751ee0c633bed2f835ac85ce2bc969d21a88b')

build() {
  pushd "kustomize-sops-$_ksopsver"
  export CGO_ENABLED=0
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-trimpath -modcacherw"
  go build -o _ksops .
  popd

  pushd "$pkgname-$_dryrunver"
  export CGO_ENABLED=0
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-trimpath -buildvcs=false -modcacherw"
  go build -ldflags "-s -w -X main.version=$pkgver -buildid= " -o ksops .
  popd
}

package() {
  install -D -m 0644 -t $pkgdir/usr/share/licenses/kustomize-sops/ $srcdir/kustomize-sops-$_ksopsver/LICENSE
  install -D -m 0755 -t $pkgdir/opt/kustomize/viaduct.ai/v1/ksops/ $srcdir/kustomize-sops-$_ksopsver/_ksops
  install -D -m 0644 -t $pkgdir/usr/share/licenses/$pkgname/LICENSE $srcdir/$pkgname-$_dryrunver/LICENSE.txt
  install -D -m 0755 -t $pkgdir/opt/kustomize/viaduct.ai/v1/ksops/ $srcdir/$pkgname-$_dryrunver/ksops
}

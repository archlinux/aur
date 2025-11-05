# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# SPDX-License-Identifier: 0BSD
_pkbase=cluster-api
pkgname=clusterctl
pkgver=1.11.3
pkgrel=1
pkgdesc='Cluster API command line interface'
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/${_pkbase}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('59bf1aa1460714dd4047184412eaeac0ac10617149cb1155e20dfb004b7dfce9')

prepare(){
  cd "$_pkbase-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkbase-$pkgver"
  local pattern='([0-9]+)\.([0-9]+)\.[0-9]+.*'
  [[ $pkgver =~ $pattern ]]
  local major=${BASH_REMATCH[1]}
  local minor=${BASH_REMATCH[2]}
  local ld_flags=(
    -linkmode=external
    -X "sigs.k8s.io/cluster-api/version.gitVersion=$pkgver"
    -X "sigs.k8s.io/cluster-api/version.gitMajor=$major"
    -X "sigs.k8s.io/cluster-api/version.gitMinor=$minor"
  )
  local go_flags=(
    -buildmode=pie
    -trimpath
    "-ldflags=${ld_flags[*]}"
    -mod=readonly
    -modcacherw
  )
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build "${go_flags[@]}" -o build ./cmd/clusterctl
}

package() {
  cd "$_pkbase-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

 # bash completion
 install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
 "build/$pkgname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  # fish completion
  install -dm 755 "$pkgdir/usr/share/fish/completions"
  "build/$pkgname" completion fish > "$pkgdir/usr/share/fish/completions/$pkgname.fish"

  # zsh completion
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "build/$pkgname" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

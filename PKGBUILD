# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# SPDX-License-Identifier: 0BSD
_pkgbase=cluster-api
_pkgname=clusterctl
pkgname=clusterctl-1.10
pkgver=1.10.9
pkgrel=1
pkgdesc='Cluster API command line interface for version v1beta1 clusters'
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache-2.0')
makedepends=('go')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/${_pkgbase}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('609a84d163f50aaba378f9fd39ef0cf3c3df1af2fe45aca09701be9bce2bc6f5')

prepare(){
  cd "$_pkgbase-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgbase-$pkgver"
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
  go build "${go_flags[@]}" -o build "./cmd/$_pkgname"
}

package() {
  cd "$_pkgbase-$pkgver"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

 # bash completion
 install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
 "build/$_pkgname" completion bash | sed "s/$_pkgname/$pkgname/g" > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  local comp_pkgname=${pkgname//[.-]/_}

  # fish completion
  install -dm 755 "$pkgdir/usr/share/fish/completions"
  "build/$_pkgname" completion fish \
    | sed "s/$_pkgname/$pkgname/g" \
    | sed "s/__${pkgname}_comp_results/__${comp_pkgname}_comp_results/g" \
    | sed "s/__${pkgname}_perform_completion_once_result/__${comp_pkgname}_perform_completion_once_result/g" \
    > "$pkgdir/usr/share/fish/completions/$pkgname.fish"

  # zsh completion
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "build/$_pkgname" completion zsh | sed "s/$_pkgname/$pkgname/g" > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

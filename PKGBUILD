# Contributor: ml <>
# Maintainer: Nogweii <packages@nogweii.net>
pkgname=sonobuoy
pkgver=0.57.2
pkgrel=1
pkgdesc='Diagnostic tool for Kubernetes clusters'
arch=('x86_64')
url='https://github.com/vmware-tanzu/sonobuoy'
license=('Apache')
depends=('glibc')
optdepends=(
  'docker: sonobuoy images subcommand'
  'kubectl: advanced workflows')
makedepends=('go' 'git' 'libarchive' 'make')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8cc661fefbc959262991d4cc4076577e428d10b08aa0682ec32a5ff0bca56e07')
sha512sums=('cebcdc01131a81dd0ee6e420213eddfdeaf736cc3e728307f4757c410546c01704150e4a580e0e95f0393934d0d1d930c48756e3582156050c5d250dc9007123')
b2sums=('6f518c694c71e64f0579063b74090a72ad406e98cd596722ce10f6cffeab61f0173cfdbd5386e520a67aca8a11b55701646d99cfe0606c44dfcb206a0943968e')

build() {
  local _commit _defines
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  cd "${srcdir}/$pkgname-$pkgver" || exit
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  _defines=(
    "github.com/vmware-tanzu/sonobuoy/pkg/buildinfo.Version=v$pkgver"
    "github.com/vmware-tanzu/sonobuoy/pkg/buildinfo.GitSHA=$_commit"
  )
  go build -o "$pkgname" -ldflags "-linkmode=external ${_defines[*]/#/-X=}" main.go
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  go test -v ./...
}

package() {
  cd "${srcdir}/$pkgname-$pkgver" || exit
  install --verbose -Dm755 "$pkgname" -t "$pkgdir/usr/bin"

  install --verbose -dp --mode=0644 "$pkgdir/usr/share/docs/"
  mv -v "site/content/docs/main/" "$pkgdir/usr/share/docs/$pkgname"

  "${pkgdir}/usr/bin/sonobuoy" completion bash | install --verbose -D --mode=0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/sonobuoy"
  "${pkgdir}/usr/bin/sonobuoy" completion fish | install --verbose -D --mode=0644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/sonobuoy.fish"
  "${pkgdir}/usr/bin/sonobuoy" completion zsh | install --verbose -D --mode=0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_sonobuoy"
}

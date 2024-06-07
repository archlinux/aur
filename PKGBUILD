# Contributor: ml <>
# Maintainer: Nogweii <packages@nogweii.net>
pkgname=sonobuoy
pkgver=0.57.1
pkgrel=2
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
sha256sums=('c4a3a7c000678176851b6d2a296644a1ae23a3df307afe69cb33832b7ec2ed44')
sha512sums=('90f6ca5191db72166e952a51148fa943068792f53f81a2887e4fe88cb1f4573c081265d42fb07749bc0b6f08b9f194d789352327363ff2f2da587ca14115a722')
b2sums=('6bd2dfdbb15677748771ae0582cd7af0dead6078b238e9cd62c8662cbec642e772d6362971df7c19438b7f3f383d90cea549ef157b9acad7d95af3b98bd79795')

build() {
  local _commit _defines
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  cd "$pkgname-$pkgver"
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
  cd "${pkgname}-${pkgver}"

  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install --verbose -Dm755 "$pkgname" -t "$pkgdir/usr/bin"

  install --verbose -dp --mode=0644 "$pkgdir/usr/share/docs/$pkgname/"
  mv "site/content/docs/v$pkgver" "$pkgdir/usr/share/docs/$pkgname"

  "${pkgdir}/usr/bin/sonobuoy" completion bash | install --verbose -D --mode=0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/sonobuoy"
  "${pkgdir}/usr/bin/sonobuoy" completion fish | install --verbose -D --mode=0644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/sonobuoy.fish"
  "${pkgdir}/usr/bin/sonobuoy" completion zsh | install --verbose -D --mode=0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_sonobuoy"
}

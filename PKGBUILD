# Contributor: ml <>
# Maintainer: Nogweii <packages@nogweii.net>
pkgname=sonobuoy
# renovate: datasource=github-releases depName=vmware-tanzu/sonobuoy
pkgver=0.57.3
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
sha256sums=('d581032898c17f1df6db90e85aae8dae6429e8cd2a1b54e1728ddeaa7d9a989c')
sha512sums=('3d3c0223e297fad5bb010660cc756c1e233e2053e1d3dd578f06dd4a6a6e5a5f2849ebe624bf52818a6597d904688093287b695a958d542c8a22833f96ed5b2e')
b2sums=('282ca1efe14416ce0a050094e1069fd89c68e515b78f712043252a2c2965b6da3c691940ba0c85a531a61b3ac6101388a7acd25b74a3dfc532de1e65d0ac2493')

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

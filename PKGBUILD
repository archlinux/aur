# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>

pkgname=wait4x
pkgver=1.1.0
pkgrel=1
pkgdesc="Waiting for a port to enter into specify state"
arch=('x86_64' 'x86' 'aarch64' 'armhf' 'ppc64le' 's390x' 'armv7')
url="https://github.com/atkrad/wait4x"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atkrad/wait4x/archive/v${pkgver}.tar.gz")
sha256sums=('baf2c8523cfa339b5c806abad686f47456322fbd08b9e3bf0b4a83f9f902cb88')

build() {
	local _commit
	local _commit_datetime
	_commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
	_commit_datetime="$(TZ=UTC date -d @$(stat -c '%Y' $pkgname-$pkgver) '+%FT%TZ')"

	cd "$pkgname-$pkgver"

	export CGO_ENABLED=1
 	export CGO_CFLAGS="$CFLAGS"
 	export CGO_CPPFLAGS="$CPPFLAGS"
 	export CGO_CXXFLAGS="$CXXFLAGS"
 	export CGO_LDFLAGS="$LDFLAGS"
 	export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw -trimpath'
	go build -v -ldflags "-linkmode=external -X github.com/atkrad/wait4x/internal/app/wait4x/cmd.AppVersion=$pkgver -X github.com/atkrad/wait4x/internal/app/wait4x/cmd.GitCommit=${_commit:0:8} -X github.com/atkrad/wait4x/internal/app/wait4x/cmd.BuildTime=$_commit_datetime" -o "$pkgname" cmd/wait4x/main.go
	
	./"$pkgname" version
	./"$pkgname" completion bash > completions/bash
	./"$pkgname" completion zsh > completions/zsh
	./"$pkgname" completion fish > completions/fish
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"

	install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}

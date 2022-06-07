# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x
pkgver=2.4.0
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64' 'x86' 'aarch64' 'armhf' 'ppc64le' 's390x' 'armv7')
url="https://github.com/atkrad/wait4x"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atkrad/wait4x/archive/v${pkgver}.tar.gz")
sha256sums=('de8f209251a5d081eb193ec8110c30e3a8e298fb1ee4be838df70034e2e30006')

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
	./"$pkgname" completion bash > "$pkgname.bash"
	./"$pkgname" completion zsh > "$pkgname.zsh"
	./"$pkgname" completion fish > "$pkgname.fish"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"

	install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 "$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}

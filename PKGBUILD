# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>

pkgname=wait4x
pkgver=0.4.0
pkgrel=2
pkgdesc="Waiting for a port to enter into specify state"
arch=('x86_64' 'x86' 'aarch64' 'armhf' 'ppc64le' 's390x' 'armv7')
url="https://github.com/atkrad/wait4x"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atkrad/wait4x/archive/v${pkgver}.tar.gz")
sha256sums=('50add18f5e726160ae7656d71b9ed736d9ff386bc0b6fe95824e00359eeb52ff')

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
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
}

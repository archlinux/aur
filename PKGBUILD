# Maintainer: Ícar <aur@icarns.xyz>

pkgname=landrun-git
pkgver=v0.1.11.r5.e9ef54c
pkgrel=1
pkgdesc="Run any Linux process in a secure, unprivileged sandbox using Landlock LSM"
arch=(x86_64)
url="https://github.com/Zouuup/landrun"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
        cd "$srcdir/${pkgname%-git}"
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
        go build -o landrun cmd/landrun/main.go
}

package() {
        cd "$srcdir/${pkgname%-git}"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
        install -Dm755 landrun "${pkgdir}/usr/bin/${pkgname%-git}"
}

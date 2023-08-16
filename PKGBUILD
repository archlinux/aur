# Maintainer: matrix <thysupremematrix atttt tuta dotttt io>
pkgname=vencord-x11-git
_pkgname=vencord
pkgver=1.3.1.r3.g463a661
pkgrel=2
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("vencord::git+https://github.com/Vencord/Installer.git")
depends=("libx11" "libglvnd")
makedepends=("git" "go")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	go mod tidy
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	
	
	cd "$srcdir/$_pkgname"
	go build -v -ldflags "-s -w -X 'main.InstallerGitHash=$(git rev-parse --short HEAD)' -X 'main.InstallerTag=$(git describe --tags | sed "s/-.*//")'" -o build
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 build/VencordInstaller "$pkgdir"/usr/bin/VencordInstaller
}


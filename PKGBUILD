# Maintainer: matrix <thysupremematrix atttt tuta dotttt io>
pkgname=vencord-x11-git
_pkgname=vencord
pkgver=1.3.1.r3.g463a661
pkgrel=3
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("vencord::git+https://github.com/Vencord/Installer.git" "vencord.png" "VencordInstaller.desktop")
depends=("libx11" "libglvnd")
makedepends=("git" "go")
sha256sums=('SKIP'
            'cc0723d0e0cc2ba5baf631656cdf34f4ce8d1ac9cb92602280ca6f3cd08e1352'
            'bd12e933431fb764de9cb68ff95b26bef50075b6620e2df7b5a625472d6aec4d')

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
	install -Dm755 build/VencordInstaller "$pkgdir/usr/bin/VencordInstaller"
	
	cd "$srcdir"
	install -Dm644 vencord.png "$pkgdir/usr/share/pixmaps/vencord.png"
	install -Dm644 VencordInstaller.desktop "$pkgdir/usr/share/applications/VencordInstaller.desktop"
}


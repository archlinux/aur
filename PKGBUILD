# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vencord-installer
pkgver=1.4.2
pkgrel=1
pkgdesc="A cross platform gui/cli app for installing Vencord"
arch=('x86_64')
url="https://github.com/Vencord/Installer"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'glibc' 'libgcc' 'libstdc++' 'libglvnd' 'libx11')
makedepends=('go' 'git' 'libxrandr' 'libxcursor' 'libxinerama' 'libxi')
source=("${pkgname}::git+$url.git#tag=v${pkgver}")
sha256sums=('b6f63ae1ce979ce34ff7316dfcebf66bfd86d29119213c2943a56ce8d8aede45')

prepare() {
	cd "$srcdir/$pkgname"
	GOPATH="$srcdir" go mod download -modcacherw
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOPATH="$srcdir"
	go build --tags cli -v -ldflags "-s -w -X 'vencordinstaller/buildinfo.InstallerGitHash=$(git rev-parse --short HEAD)' -X 'vencordinstaller/buildinfo.InstallerTag=$(git describe --tags | sed "s/-.*//")'" -o vencordinstallercli
	go build -v -ldflags "-s -w -X 'vencordinstaller/buildinfo.InstallerGitHash=$(git rev-parse --short HEAD)' -X 'vencordinstaller/buildinfo.InstallerTag=$(git describe --tags | sed "s/-.*//")'" -o vencordinstaller

}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 vencordinstallercli "$pkgdir/usr/bin/vencordinstallercli"
	install -Dm755 vencordinstaller "$pkgdir/usr/bin/vencordinstaller"

	install -Dm644 winres/icon.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/vencordinstaller.png"
	mkdir -p "$pkgdir/usr/share/applications"
	cat <<EOF >> "$pkgdir/usr/share/applications/vencordinstaller.desktop"
[Desktop Entry]
Version=$pkgver
Type=Application
Name=VencordInstaller
Comment=$pkgdesc
Icon=vencordinstaller
TryExec=vencordinstaller
Exec=vencordinstaller
Categories=Utility;
Keywords=Discord;Vencord;
EOF
}

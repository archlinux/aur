# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-files-git
_pkgname=dux-files
_binname=dfiles
_appid=dev.duxlabs.files
_portalservice=org.freedesktop.impl.portal.desktop.dfiles.service
pkgver=2.0.0.r1.gf646769
pkgrel=1
pkgdesc='File manager for Wayland from Dux Labs (git)'
arch=('x86_64' 'aarch64')
url="https://github.com/duxlabs-dev/$_pkgname"
license=('MIT')
depends=('quickshell' 'qt6-declarative')
optdepends=('dms-shell: dynamic theming via Dux Shell colors'
            'bubblewrap: run external thumbnailers in a sandbox'
            'ffmpegthumbnailer: video thumbnails'
            'poppler: pdf thumbnails'
            'gvfs: network shares and the trash on removable drives'
            'udisks2: the devices sidebar'
            'polkit: retry denied operations as administrator'
            'xdg-desktop-portal: use dfiles as the file chooser')
makedepends=('git' 'go>=2:1.27')
provides=("$_binname=$pkgver" "$_pkgname=$pkgver")
conflicts=("$_binname" "$_pkgname" 'dux-files-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule sync
	git submodule update --init --recursive
}

pkgver() {
	cd "$srcdir/$pkgname"
	if git describe --tags --long >/dev/null 2>&1; then
		git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
	else
		printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$srcdir/$pkgname/core"

	local VERSION BUILD_TIME COMMIT
	VERSION="$(git describe --tags --always 2>/dev/null | sed 's/^v//' || echo dev)"
	BUILD_TIME="$(date -u '+%Y-%m-%d_%H:%M:%S')"
	COMMIT="$(git rev-parse --short=8 HEAD 2>/dev/null || echo unknown)"

	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	export GOMODCACHE="$srcdir/gomodcache"
	export GOTOOLCHAIN=local

	make sync-shell

	go build -tags withshell \
		-ldflags "-s -w -X main.Version=${VERSION} -X main.BuildTime=${BUILD_TIME} -X main.Commit=${COMMIT}" \
		-o bin/$_binname ./cmd/$_binname

	mkdir -p bin/completions
	bin/$_binname completion bash > "bin/completions/$_binname"
	bin/$_binname completion zsh  > "bin/completions/_$_binname"
	bin/$_binname completion fish > "bin/completions/$_binname.fish"
}

check() {
	cd "$srcdir/$pkgname/core"
	export CGO_ENABLED=0 GOMODCACHE="$srcdir/gomodcache" GOTOOLCHAIN=local
	go test ./... || true
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "core/bin/$_binname" "$pkgdir/usr/bin/$_binname"

	install -Dm644 "core/bin/completions/$_binname"      "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "core/bin/completions/_$_binname"     "$pkgdir/usr/share/zsh/site-functions/_$_binname"
	install -Dm644 "core/bin/completions/$_binname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"

	install -Dm644 "assets/$_appid.svg"          "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
	install -Dm644 "assets/$_appid.desktop"      "$pkgdir/usr/share/applications/$_appid.desktop"
	install -Dm644 "assets/$_appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"
	install -Dm644 "assets/$_appid.policy"       "$pkgdir/usr/share/polkit-1/actions/$_appid.policy"

	install -Dm644 "assets/dbus/$_appid.FileManager1.service" "$pkgdir/usr/share/dbus-1/services/$_appid.FileManager1.service"
	install -Dm644 "assets/dbus/$_portalservice"              "$pkgdir/usr/share/dbus-1/services/$_portalservice"
	install -Dm644 "assets/portal/$_binname.portal"           "$pkgdir/usr/share/xdg-desktop-portal/portals/$_binname.portal"

	install -Dm644 "assets/systemd/$_binname.service" "$pkgdir/usr/lib/systemd/user/$_binname.service"

	install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

pkgname=codeswitch
_pkgname=code-switch
pkgver=0.1.8
pkgrel=1
pkgdesc="CodeSwitch desktop app (Wails)"
arch=('x86_64' 'aarch64')
url="https://github.com/daodao97/$_pkgname"
license=('Apache-2.0 LICENSE') # Update if upstream differs
depends=('gtk3' 'webkit2gtk-4.1' 'nss' 'libnotify' 'libsecret' 'libxkbcommon' 'libx11' 'libxrandr')
makedepends=('git' 'go' 'nodejs' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daodao97/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"codeswitch.desktop"
	"codeswitch.png")
b2sums=('3a8b467ecfb5136231818abcdec62ab18c57a334fb6069eba6119748ff6f50d85568b41ff5dedd755a3709d0f3dcdc0fe7956c0556d4904e9d827cb98caac5e5'
        '654a8ff6c3b3a6f46da2b55134c9787bf4eba9108f732f5fc421bc7bc98c807bf41223e86ae1e610c58107f5033752e087443a13d81e003e553a8f9eb5902526'
        '1cc876b1ae79a567ca36c78fa47e58e537928791c8e13cf4cd12b8f9ec8d75c7a061ab46d18c7c3e0fd98477625ea85e7446a5025ba499ed0da2b7c0b1a0c4f0')

build() {
	export GOPATH="${srcdir}/gopath"
	export GOBIN="${GOPATH}/bin"
	export PATH="${GOBIN}:${PATH}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly"

	cd "${srcdir}/${_pkgname}-${pkgver}"

	pushd frontend >/dev/null
	npm install --cache "${srcdir}/npm-cache"
	popd >/dev/null

	go install github.com/wailsapp/wails/v3/cmd/wails3@latest

	wails3 task common:update:build-assets
	wails3 task common:generate:bindings
	# Avoid AppImage generation (fails in minimal build env); only build native binary.
	wails3 task linux:build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	local binary=""
	if [[ -x bin/CodeSwitch ]]; then
		binary="bin/CodeSwitch"
	elif [[ -x bin/codeswitch ]]; then
		binary="bin/codeswitch"
	elif [[ -x build/bin/CodeSwitch ]]; then
		binary="build/bin/CodeSwitch"
	elif [[ -x build/bin/codeswitch ]]; then
		binary="build/bin/codeswitch"
	else
		printf 'codeswitch binary not found after build\n' >&2
		return 1
	fi

	install -Dm755 "$binary" "${pkgdir}/usr/bin/codeswitch"
	install -Dm644 "$srcdir/codeswitch.desktop" "${pkgdir}/usr/share/applications/codeswitch.desktop"
	install -Dm644 "$srcdir/codeswitch.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/codeswitch.png"

	if [[ -f LICENSE ]]; then
		install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
}

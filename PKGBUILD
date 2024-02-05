# Maintainer: eNV25 <env252525@gmail.com>

pkgname=ff2mpv-rust
pkgver=1.1.1.1
pkgrel=1
pkgdesc="Native messaging host for ff2mpv written in Rust"
arch=('x86_64')
url="https://github.com/ryze312/ff2mpv-rust"
license=('GPL3')
conflicts=("ff2mpv-native-messaging-host-git" "ff2mpv-native-messaging-host-librewolf-git")
provides=("ff2mpv-native-messaging-host-git" "ff2mpv-native-messaging-host-librewolf-git")
optdepends=(
	'mpv: open links in mpv'
	#"ff2mpv: browser extension"
	"chromium: supported browser"
	"firefox: supported browser"
	"firefox-developer-edition: supported browser"
	"google-chrome: supported browser"
	"librewolf: supported browser"
	"microsoft-edge: supported browser"
	"vivaldi: supported browser"
)
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver::git+https://github.com/ryze312/ff2mpv-rust#commit=4aa4ca5")

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

prepare() {
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" \
		--manifest-path="./$pkgname-$pkgver/Cargo.toml"
}

build() {
	cargo build --frozen --release --all-features \
		--manifest-path="./$pkgname-$pkgver/Cargo.toml"
	"target/release/$pkgname" manifest | jq '.path |= "/usr/bin/ff2mpv-rust"' >manifest.json
	# add support for chrome extension https://chrome.google.com/webstore/detail/ff2mpv/ephjcajbkgplkjmelpglennepbpmdpjg
	# https://github.com/DanSM-5/ff2mpv/blob/master/ff2mpv.json
	jq 'del(.allowed_extensions) | .allowed_origins |= ["chrome-extension://ephjcajbkgplkjmelpglennepbpmdpjg/"]' <manifest.json >manifest-chrome.json
}

check() {
	cargo test --frozen --all-features \
		--manifest-path="./$pkgname-$pkgver/Cargo.toml"
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	# paths from `pacman -Fyx 'native-messaging-hosts/'` and ff2mpv-native-messaging-host-{,librewolf}-git
	for _path in \
		usr/lib/mozilla/native-messaging-hosts \
		usr/lib/librewolf/native-messaging-hosts; do
		install -Dm644 manifest.json "$pkgdir/$_path/ff2mpv.json"
	done
	for _path in \
		etc/chromium/native-messaging-hosts \
		etc/vivaldi/native-messaging-hosts \
		etc/opt/chrome/native-messaging-hosts \
		etc/opt/edge/native-messaging-hosts; do
		install -Dm644 manifest-chrome.json "$pkgdir/$_path/ff2mpv.json"
	done
}

sha256sums=('SKIP')

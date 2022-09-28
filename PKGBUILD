# Maintainer: eNV25 <env252525@gmail.com>

pkgname=ff2mpv-go-git
pkgver=1.0.1.r1.639496c
pkgrel=4
pkgdesc="Native messaging host for ff2mpv written in Go. Includes manifest json for many browsers."
arch=(x86_64 i686 aarch64 arm armv6h armv7h)
url="https://git.clsr.net/util/ff2mpv-go"
license=('custom: public domain')
depends=(mpv)
makedepends=(git go jq)
optdepends=(
#	"ff2mpv: browser extension"
	"chromium: supported browser"
	"firefox: supported browser"
	"firefox-developer-edition: supported browser"
	"google-chrome: supported browser"
	"librewolf: supported browser"
	"microsoft-edge: supported browser"
	"vivaldi: supported browser"
)
conflicts=("${pkgname%-git}" "ff2mpv-native-messaging-host-git" "ff2mpv-native-messaging-host-librewolf-git")
provides=("${pkgname%-git}" "ff2mpv-native-messaging-host-git" "ff2mpv-native-messaging-host-librewolf-git")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -E '
		s/([^-]*-)g/r\1/
		s/-/./g
		s/^v//
	'
}

build() {
	cd "$pkgname"
	go build -o "${pkgname%-git}"
}

package() {
	cd "$pkgname"
	install -Dm755 "${pkgname%-git}" "$pkgdir/usr/lib/${pkgname%-git}/ff2mpv"
	# paths from `pacman -Fyx 'native-messaging-hosts/'` and ff2mpv-native-messaging-host-{,librewolf}-git
	for _path in \
		usr/lib/mozilla/native-messaging-hosts \
		usr/lib/librewolf/native-messaging-hosts \
	; do
		"$pkgdir/usr/lib/${pkgname%-git}/ff2mpv" --manifest |
			# fix path
			jq '.path |= $path' --arg path "/usr/lib/${pkgname%-git}/ff2mpv" |
			install -Dm644 /dev/stdin "$pkgdir/$_path/ff2mpv.json"
	done
	for _path in \
		etc/chromium/native-messaging-hosts \
		etc/vivaldi/native-messaging-hosts \
		etc/opt/chrome/native-messaging-hosts \
		etc/opt/edge/native-messaging-hosts \
	; do
		"$pkgdir/usr/lib/${pkgname%-git}/ff2mpv" --manifest |
			# fix path
			jq '.path |= $path' --arg path "/usr/lib/${pkgname%-git}/ff2mpv" |
			# remove firefox support
			jq 'del(.allowed_extensions)' |
			# add support for chrome extension https://chrome.google.com/webstore/detail/ff2mpv/ephjcajbkgplkjmelpglennepbpmdpjg
			# https://github.com/DanSM-5/ff2mpv/blob/master/ff2mpv.json
			jq '.allowed_origins |= . + ["chrome-extension://ephjcajbkgplkjmelpglennepbpmdpjg/"]' |
			install -Dm644 /dev/stdin "$pkgdir/$_path/ff2mpv.json"
	done
}

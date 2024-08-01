pkgname=livekit-git
pkgver=1.7.0.r63.g18fd6228
pkgrel=1
epoch=1
pkgdesc="End-to-end stack for WebRTC. SFU media server and SDKs."
arch=("any")
url="https://github.com/livekit/livekit"
license=("GPL-2.0-or-later")
depends=()
makedepends=('go' 'git' "mage" "bubblewrap")
backup=()
source=("git+https://github.com/livekit/livekit.git")
sha256sums=('SKIP')
provides=(livekit)
#install="livekit.install"

function pkgver() {
	cd "${srcdir}/livekit"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	# Setup a bubblewrap jail so it won't mess up host environment.
	if [ -d "${srcdir}/build-jail" ]; then
		rm -rf "${srcdir}/build-jail"
	fi
	mkdir "${srcdir}/build-jail" -p
	cp -a "${srcdir}/livekit"/* "${srcdir}/build-jail"
	bwrap --dev-bind / / \
		--tmpfs ~ \
		--tmpfs /tmp \
		--bind "${srcdir}/build-jail" /tmp/build \
		--chdir /tmp/build \
		-- go mod download
}

function build() {
	cd "${srcdir}/build-jail"
	bwrap --dev-bind / / \
		--tmpfs ~ \
		--tmpfs /tmp \
		--bind "${srcdir}/build-jail" /tmp/build \
		--chdir /tmp/build \
		-- mage
}

#function check() {
#	cd "${srcdir}/livekit"
#	go test ./...
#}

function package() {
	install -Dm755 "${srcdir}/build-jail/bin/livekit-server" "${pkgdir}/usr/bin/livekit-server"
	install -Dm644 "${srcdir}/livekit/config-sample.yaml" "${pkgdir}/etc/livekit/config.yaml"
}

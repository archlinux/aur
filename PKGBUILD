pkgname=snotify-git
pkgver=0.1.0.r7.g03631efc
pkgrel=1
epoch=1
pkgdesc="Play sounds when reciving a notification."
arch=("any")
url="https://github.com/Kimiblock/snotify"
license=("GPL-2.0-or-later")
depends=("dbus" "glibc" "pipewire" "pipewire-audio" "pipewire-pulse" "wireplumber")
makedepends=('go' 'git')
conflicts=('snotify')
backup=()
source=("git+https://github.com/Kimiblock/snotify.git")
sha256sums=('SKIP')
install="snotify.install"
provides=("snotify")

function pkgver() {
	cd "${srcdir}/snotify"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/snotify"
}

function build() {
	cd "${srcdir}/snotify"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

function check() {
	cd "${srcdir}/snotify"
	go test ./...
}

function package() {
	install -Dm755 "${srcdir}/snotify/snotify" "${pkgdir}/usr/bin/snotify"
	install -Dm644 "${srcdir}/snotify/snotify.service" "${pkgdir}/usr/lib/systemd/user/snotify.service"
	install -Dm644 "${srcdir}/snotify/message.ogg" "${pkgdir}/opt/snotify/message.ogg"
}

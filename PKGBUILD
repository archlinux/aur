pkgname=snotify-git
pkgver=r25.6ae844f
pkgrel=1
pkgdesc="Play sounds when reciving a notification."
arch=("any")
url="https://github.com/Kimiblock/snotify"
license=("GPL-2.0-or-later")
depends=("mpv" "dbus" "glibc")
makedepends=('go' 'git')
conflicts=('snotify')
backup=()
source=("git+https://github.com/Kimiblock/snotify.git")
sha256sums=('SKIP')
install="snotify.install"

function pkgver() {
	cd "${srcdir}/snotify"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

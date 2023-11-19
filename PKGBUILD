# Maintainer: Kimiblock Moe

pkgname=matrix-federation-tester-git
arch=('x86_64')
backup=("etc/default/matrix-federation-tester")
pkgver=r119.d48d783
pkgrel=1
pkgdesc="Tester for matrix federation written in golang."
url=https://github.com/matrix-org/matrix-federation-tester
license=("none")
depends=()
source=("git+https://github.com/matrix-org/matrix-federation-tester.git" "matrix-federation-tester.service")
makedepends=("go")
sha256sums=("SKIP" "SKIP")
provides=("matrix-federation-tester")
install=matrix-federation-tester.install

function pkgver(){
	cd matrix-federation-tester
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build(){
	cd "${srcdir}/matrix-federation-tester"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

function check() {
	cd "${srcdir}/matrix-federation-tester"
	go test ./...
}

function package(){
	cd matrix-federation-tester
	install -Dm755 "${srcdir}/matrix-federation-tester/matrix-federation-tester" "${pkgdir}/usr/bin/matrix-federation-tester"
	install -Dm644 "${srcdir}/matrix-federation-tester.service" "${pkgdir}/usr/lib/systemd/system/matrix-federation-tester.service"
	mkdir -p "${pkgdir}/etc/default"
	touch "${pkgdir}/etc/default/matrix-federation-tester"
	mkdir -p "${pkgdir}/usr/lib/sysusers.d"
	echo 'u	matrix-federation-tester	-	"Matrix Federation Tester"	-	-' >"${pkgdir}/usr/lib/sysusers.d/matrix-federation-tester.conf"
	mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
	echo 'f	/etc/default/matrix-federation-tester	0660	matrix-federation-tester	root' >"${pkgdir}/usr/lib/tmpfiles.d/matrix-federation-tester.tmpfiles"
}


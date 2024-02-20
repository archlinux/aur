# Maintainer: Nikko <nikko@faint.day>
pkgname=qbittorrent-clientblocker-git
pkgver=2.7.r11.g4dc4a36
pkgrel=1
pkgdesc="A peer manager for qBittorrent"
arch=('any')
url="https://github.com/Simple-Tracker/qBittorrent-ClientBlocker"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go>=1.20.13')
optdepends=('qbittorrent-nox: the actual program for bittorrent')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}/config.json")
source=("${pkgname%-git}::git+https://github.com/Simple-Tracker/qBittorrent-ClientBlocker.git#branch=master"
		"qbittorrent-clientblocker.service"
		"qbittorrent-clientblocker@.service")
sha256sums=('SKIP'
            'dc90349aa648b12f3981ad1a42d49f35339eaee17032dd3e49891b1a37b821a2'
            '024433398f84af587504da822575060ebaee01eaac39bfbaeb76f0d13a98726a')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"

	local ldflags="-s -w -linkmode external -X main.programVersion=${pkgver} -extldflags '${LDFLAGS}'"
	go build \
		-o ${pkgname%-git} \
		-buildmode=pie \
		-trimpath \
		-ldflags="${ldflags}" \
		-mod=readonly -modcacherw \
		.
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	install -Dm 755 ${pkgname%-git} -t "${pkgdir}/usr/bin"
	install -Dm 644 config.json -t "${pkgdir}/etc/${pkgname%-git}"
	install -Dm 644 "${srcdir}/qbittorrent-clientblocker.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "${srcdir}/qbittorrent-clientblocker@.service" -t "${pkgdir}/usr/lib/systemd/system"
}

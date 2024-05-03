# Maintainer: Nikko <nikko@faint.day>
pkgname=qbittorrent-clientblocker-git
pkgver=3.2
pkgrel=1
pkgdesc="A peer manager for qBittorrent"
arch=('x86_64' 'aarch64')
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
            '74b976ae930e0cebeb24340f14fa7bbbe215eed534aca69bd0ab09b86dd51499'
            '7317cf944db6349f8348756041029f0a16e344e2bc5fb894adc3f2ef40fb688a')

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

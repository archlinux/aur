# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui at riseup dot net>

pkgname=ntfysh
pkgver=1.30.1
pkgrel=1
pkgdesc="Send push notifications to your phone or desktop using PUT/POST "
arch=("x86_64")
url="https://ntfy.sh"
license=('GPL2')
makedepends=('go' 'git')
conflicts=(ntfysh-bin ntfy)
source=("$pkgname::git+https://github.com/binwiederhier/ntfy.git#tag=v$pkgver"
	"ntfy.sysusers"
        )
b2sums=('SKIP'
        '958bdfc80eeb8ed62508593a94b379d7c099373a4ed2af3eaeedebdca05519378e2bc20940950db4f848be0575cebe16bcb79b794133e8f4467418f8e34278ca')

build() {
	cd "${pkgname}"

	# cli-deps-static-sites target
	mkdir -p server/docs server/site
	touch server/docs/index.html server/site/app.html

	# cli-linux-server target
	mkdir -p dist/ntfy_linux_server server/docs

	export GOPATH="${srcdir}/go"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	export CGO_ENABLED=1
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-o dist/ntfy_linux_server/ntfy \
		-tags sqlite_omit_load_extension,osusergo,netgo \
		-ldflags \
		"-linkmode=external -extldflags=-static -s -w -X main.version=${pkgver} -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date +%s)"
}

package() {
	cd "${pkgname}"

	install -Dm755 "dist/ntfy_linux_server/ntfy" 	"${pkgdir}/usr/bin/ntfy"
	install -Dm644 "client/ntfy-client.service" 	"${pkgdir}/usr/lib/systemd/system/ntfy-client.service"
	install -Dm644 "client/client.yml" 		"${pkgdir}/etc/ntfy/client.yml"
	install -Dm644 "server/ntfy.service" 		"${pkgdir}/usr/lib/systemd/system/ntfy.service"
	install -Dm644 "server/server.yml" 		"${pkgdir}/etc/ntfy/server.yml"
	install -Dm644 "README.md" 			"${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" 			"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/ntfy.sysusers" 	"${pkgdir}/usr/lib/sysusers.d/ntfy.conf"
}

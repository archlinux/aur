# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainers: Luiz Ribeiro <luizribeiro@gmail.com>, Tom Wambold <tom5760@gmail.com>

#Unresolved issues:
#  https://bbs.archlinux.org/viewtopic.php?id=292194
#  oauth2-proxy W: ELF file ('usr/bin/oauth2-proxy') lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.


pkgname=oauth2-proxy
pkgver=7.6.0
pkgrel=3
pkgdesc="A reverse proxy that provides authentication with Google, Keycloak, GitHub or other providers."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/oauth2-proxy/oauth2-proxy"
license=('MIT')
depends=(glibc)
makedepends=(go)
backup=('etc/oauth2-proxy.cfg')
install=oauth2-proxy.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oauth2-proxy/oauth2-proxy/archive/v${pkgver}.tar.gz")
sha256sums=('2beac9e817d59b37f2277efefeda68447418355792a60da709a80c278628fcd8')

prepare() {
	sed -i -e 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' -e 's/www-data/oauth2-proxy/' -e '/^#/d' "${pkgname}-${pkgver}/contrib/${pkgname}.service.example"
}

build() {
	mkdir -p github.com/${pkgname}

	mv "${pkgname}-${pkgver}" github.com/oauth2-proxy/oauth2-proxy
	mkdir -p deps dist

	# Force fail on missing IBT / SHSTK
	#	LDFLAGS+=' -Wl,-z,cet-report=error'
		## github.com/oauth2-proxy/oauth2-proxy/v7
		#/usr/lib/go/pkg/tool/linux_amd64/link: running gcc failed: exit status 1
		#/usr/bin/ld: /tmp/go-link-1117948769/go.o: error: missing IBT and SHSTK properties
		#/usr/bin/ld: /tmp/go-link-1117948769/000019.o: error: missing IBT and SHSTK properties
		#collect2: error: ld returned 1 exit status

	# oauth2-proxy W: ELF file ('usr/bin/oauth2-proxy') lacks FULL RELRO, check LDFLAGS.
	# oauth2-proxy W: ELF file ('usr/bin/oauth2-proxy') lacks PIE.
	# https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath"
	export GOPATH="$(pwd)/deps:$(realpath $(pwd)/..)"
	cd github.com/oauth2-proxy/oauth2-proxy

	# Default version variable to $pkgver instead of "undefined" as the buildtime version detection in the Makefile fails
	sed -i "s,VERSION = \"undefined\",VERSION = \"${pkgver}\"," version.go

	go build -o ../../../dist/oauth2-proxy
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"

	install -Dm 644 github.com/oauth2-proxy/oauth2-proxy/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install dist/oauth2-proxy "${pkgdir}/usr/bin/oauth2-proxy"
	install github.com/oauth2-proxy/oauth2-proxy/contrib/oauth2-proxy.cfg.example "${pkgdir}/etc/oauth2-proxy.cfg"
	install github.com/oauth2-proxy/oauth2-proxy/contrib/oauth2-proxy.service.example "${pkgdir}/usr/lib/systemd/system/oauth2-proxy.service"
}

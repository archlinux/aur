# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainers: Luiz Ribeiro <luizribeiro@gmail.com>, Tom Wambold <tom5760@gmail.com>

#Unresolved issues:
#  https://bbs.archlinux.org/viewtopic.php?id=292194
#  oauth2_proxy W: ELF file ('usr/bin/oauth2-proxy') lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.


pkgname=oauth2_proxy
pkgver=7.6.0
pkgrel=1
pkgdesc="A reverse proxy that provides authentication with Google, Github or other providers."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/oauth2-proxy/oauth2-proxy"
license=('MIT')
depends=(glibc)
makedepends=(go)
backup=('etc/oauth2_proxy.cfg')
install=oauth2_proxy.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oauth2-proxy/oauth2-proxy/archive/v${pkgver}.tar.gz"
        'oauth2_proxy.service')
sha256sums=('2beac9e817d59b37f2277efefeda68447418355792a60da709a80c278628fcd8'
            'b8de9626474527b75cec9d23a621af4ef2d35ff13aff1a0b8a1a22fef262c970')

build() {
	mkdir -p github.com/oauth2-proxy

	mv "oauth2-proxy-${pkgver}" github.com/oauth2-proxy/oauth2-proxy
	mkdir -p deps dist

	# Force fail on missing IBT / SHSTK
	#	LDFLAGS+=' -Wl,-z,cet-report=error'
		## github.com/oauth2-proxy/oauth2-proxy/v7
		#/usr/lib/go/pkg/tool/linux_amd64/link: running gcc failed: exit status 1
		#/usr/bin/ld: /tmp/go-link-1117948769/go.o: error: missing IBT and SHSTK properties
		#/usr/bin/ld: /tmp/go-link-1117948769/000019.o: error: missing IBT and SHSTK properties
		#collect2: error: ld returned 1 exit status

	# oauth2_proxy W: ELF file ('usr/bin/oauth2-proxy') lacks FULL RELRO, check LDFLAGS.
	# oauth2_proxy W: ELF file ('usr/bin/oauth2-proxy') lacks PIE.
	# https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOPATH="$(pwd)/deps:$(realpath $(pwd)/..)"
	cd github.com/oauth2-proxy/oauth2-proxy

	# Default version variable to $pkgver instead of "undefined" as the buildtime version detection in the Makefile fails
	sed -i "s,VERSION = \"undefined\",VERSION = \"${pkgver}\"," version.go

	go build -o ../../../dist/oauth2-proxy -trimpath
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"

	install -Dm 644 github.com/oauth2-proxy/oauth2-proxy/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install dist/oauth2-proxy "${pkgdir}/usr/bin/oauth2-proxy"
	install github.com/oauth2-proxy/oauth2-proxy/contrib/oauth2-proxy.cfg.example "${pkgdir}/etc/oauth2_proxy.cfg"
	install oauth2_proxy.service "${pkgdir}/usr/lib/systemd/system/oauth2_proxy.service"
}

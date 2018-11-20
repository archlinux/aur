# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh
pkgver=1.5.0
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=57')
makedepends=('go' 'go-bindata' 'dep' 'git')
optdepends=('upx: compress binary')
conflicts=('browsh-bin' 'browsh-git')
options=('!strip')
noextract=("${pkgname}-${pkgver}-an.fx.xpi")
source=("https://github.com/${pkgname}-org/${pkgname}/archive/v${pkgver}.tar.gz"
		"https://github.com/${pkgname}-org/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-an.fx.xpi")

prepare() {
	## Go is fussy.
	export GOPATH="${srcdir}/.gopath"
	export _interfacer="${GOPATH}/src/${pkgname}/interfacer"
	mkdir -p "${GOPATH}/src"
	mv "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${pkgname}"
	cd "${_interfacer}"

	echo Turn webext into an embeddable binary...
	xpipath="$(mktemp -d)"
	cp "${srcdir}/${pkgname}-${pkgver}-an.fx.xpi" "${xpipath}/${pkgname}.xpi"
	if [ $(which upx 2>/dev/null) ]; then
		_compress="-nocompress"
	else
		_compress=""; fi
	go-bindata	$_compress\
				-prefix "${xpipath}"\
				-pkg $pkgname\
				-o "${_interfacer}/src/${pkgname}/webextension.go"\
				"${xpipath}/${pkgname}.xpi"
	rm -r "${xpipath}"

	echo Install $pkgname dependencies...
	dep ensure
}

build() {
	export GOPATH="${srcdir}/.gopath"
	export _interfacer="${GOPATH}/src/${pkgname}/interfacer"
	cd "$_interfacer"
	echo Build ${pkgname}...
	go build	-x\
				-gcflags "all=-trimpath=${GOPATH}"\
				-asmflags "all=-trimpath=${GOPATH}"\
				-o "${srcdir}/${pkgname}" ./src/main.go
	strip --strip-all "${srcdir}/${pkgname}"
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${pkgname} with UPX...
		upx --best "${srcdir}/${pkgname}"; fi
}

package() {
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}
sha512sums=('1ba4ac0e5d217201d626f62a7dd91dc6364e81b1ba633221d23b21f231334e8d241dfa9827d8dc064502838a6bfc1232b915678120eb3dd6ad99c75c5d51fe39'
            '1e8efff581313c73e993c74a24cfe577b2694abdf259ca647d6fa88d4bf7930e6f3641444f5178f3c5166a8a32930a0f75cdb780a0fcb4581bdea0ecbb8c942c')

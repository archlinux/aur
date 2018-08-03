# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh
pkgver=1.4.12
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
sha512sums=('9b26989f723732240dd52b07f2803a78ada0ee79ddeb4a2541564da554ff0db3539ec9df86ea040ac35d5acd5ab2af587b9f40a99b6a6e852e500a4ca9b0f3ba'
			'68a6a4d5b97aa7471a63a247c53d50b74f6bcba7c5e727f3aa4bf12f738f93585bcab9f6ad62733ffc34b04108c8b6a7d94b99dc6d823a4f58b6363a1ed114c8')

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

# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh
pkgver=1.5.2
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=63')
makedepends=('go' 'go-bindata' 'dep' 'git')
optdepends=('upx: compress binary')
conflicts=('browsh-bin' 'browsh-git')
options=('!strip')
noextract=("${pkgname}-${pkgver}-an.fx.xpi")
source=("https://github.com/${pkgname}-org/${pkgname}/archive/v${pkgver}.tar.gz"
		"https://github.com/${pkgname}-org/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-an.fx.xpi")
sha256sums=('c1a39b8982caa3cf96d67ff4e8b2d6fd80746a8f3ddd13f0650cbc875ca7b8fd'
			'c3b475953de61a930c12c89cde3d2630e511b28ddbd21da7830e02173df32a2d')


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
		upx "${srcdir}/${pkgname}"; fi
}

package() {
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

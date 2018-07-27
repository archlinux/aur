# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh
pkgver=1.4.9
pkgrel=3
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=57')
makedepends=('go' 'go-bindata' 'dep' 'git')
optdepends=('upx: compress binary')
conflicts=('browsh-bin' 'browsh-git')
options=('!strip')
noextract=("${pkgname}.xpi")
source=("https://github.com/${pkgname}-org/${pkgname}/archive/v${pkgver}.tar.gz"
		"https://github.com/${pkgname}-org/${pkgname}/releases/download/v1.4.9/${pkgname}-${pkgver}-an.fx.xpi")
sha512sums=('cda0af1e45d16405fc00804c3c95c16de830ab9e151dc93ae05f71f1c42b9d90baa02ceff9fb6d9e35d7c6dc294d0795e0be92be46f2b7be69296a28774f2340'
			'3420427a7d5abd26962079a75cb1ddd1bfaa0f1ce03094802efcab7b0555ebe87c1b7f48a611e500547589e09e69b6eba9f7bad3225adb19155026470746570d')

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
		_compress="-nocompress"; else
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
	echo Build ${pkgname}...
	cd "$_interfacer"
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

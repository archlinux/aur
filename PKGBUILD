# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh
pkgver=1.8.0
pkgrel=1
GOVERSION=1.18
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
makedepends=('git' 'npm')
optdepends=('upx: compress binary')
depends=('firefox>=63')
conflicts=('browsh-bin' 'browsh-git')
options=('!strip')
noextract=("${pkgname}-${pkgver}-an.fx.xpi")
source=("https://github.com/${pkgname}-org/${pkgname}/archive/v${pkgver}.tar.gz"
		"https://github.com/${pkgname}-org/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.xpi"
		"https://dl.google.com/go/go${GOVERSION}.linux-amd64.tar.gz")
sha256sums=('81b1f9d725527f851457046845f8ed0d1fdd00fdc97d3c19e69c0bc5a7e70cd3'
            'd76c566dfe278181d62ca57dcb2c728b4372ff31d28f6a3b21c6adb3e11ffa90'
            'e85278e98f57cdb150fe8409e6e5df5343ecb13cebf03a5d5ff12bd55a80264f')


prepare() {
	cw=$(pwd)
	export GOPATH=$cw/home/go
	mkdir -p $GOPATH
	export GOROOT=$cw/go
	mkdir -p $GOROOT
	export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
	if [[ -e "${GOPATH}/src/github.com/browsh-org" ]]
	then
		rm -r "${GOPATH}/src/github.com/browsh-org"
	fi
	mkdir -p "${GOPATH}/src/github.com/browsh-org/${pkgname}"
  	ln -sf  "../../../../../../${pkgname}-${pkgver}/interfacer/" "${GOPATH}/src/github.com/browsh-org/${pkgname}/interfacer"
	_interfacer="${GOPATH}/src/github.com/browsh-org/${pkgname}/interfacer"
	
	go install github.com/shuLhan/go-bindata/v4/cmd/go-bindata@master

	cd ${_interfacer}
	

	echo Turn webext into an embeddable binary...
	xpipath="$(mktemp -d)"
	cp "${srcdir}/${pkgname}-${pkgver}.xpi" "${xpipath}/${pkgname}.xpi"
	if [ $(which upx 2>/dev/null) ]; then
		_compress="-nocompress"
	else
		_compress=""; fi
	go-bindata	$_compress\
				-prefix "${xpipath}"\
				-pkg $pkgname\
				-o "${_interfacer}/src/${pkgname}/${pkgname}.xpi"\
				"${xpipath}/${pkgname}.xpi"
	rm -r "${xpipath}"

}

build() {
	cw=$(pwd)
	export GOPATH=$cw/home/go
	ls $GOPATH
	export GOROOT=$cw/go
	export _interfacer="${GOPATH}/src/github.com/browsh-org/${pkgname}/interfacer"


	cd "$_interfacer"
	echo Build ${pkgname}...
	local webextension="src/browsh/browsh.xpi"
	md5sum "$webextension"
	go build	-x\
				-gcflags "all=-trimpath=${GOPATH}"\
				-asmflags "all=-trimpath=${GOPATH}"\
				 -o "${srcdir}/${pkgname}" ./cmd/browsh 
	strip --strip-all "${srcdir}/${pkgname}"
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${pkgname} with UPX...
		upx "${srcdir}/${pkgname}"; fi
}

package() {
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

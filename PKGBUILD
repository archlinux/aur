# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh
pkgver=1.8.0
pkgrel=2
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
makedepends=('git' 'go')
optdepends=('upx: compress binary')
depends=('firefox>=63')
conflicts=('browsh-bin' 'browsh-git')
options=('!strip')
noextract=("${pkgname}-${pkgver}-an.fx.xpi")
source=("https://github.com/${pkgname}-org/${pkgname}/archive/v${pkgver}.tar.gz"
		"https://github.com/${pkgname}-org/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.xpi"
		)
sha256sums=('81b1f9d725527f851457046845f8ed0d1fdd00fdc97d3c19e69c0bc5a7e70cd3'
            'd76c566dfe278181d62ca57dcb2c728b4372ff31d28f6a3b21c6adb3e11ffa90'
			)


prepare() {
	cw=$(pwd)
	export GOPATH=$cw/go
	mkdir -p $GOPATH
	export PATH=$GOPATH/bin:$PATH
	if [[ -e "${GOPATH}/src/github.com/browsh-org" ]]
	then
		rm -r "${GOPATH}/src/github.com/browsh-org"
	fi
	mkdir -p "${GOPATH}/src/github.com/browsh-org/${pkgname}"
	_interfacer="${GOPATH}/src/github.com/browsh-org/${pkgname}/interfacer"
  	ln -sf  "../../../../../${pkgname}-${pkgver}/interfacer/" "${_interfacer}"
	cp "${srcdir}/${pkgname}-${pkgver}.xpi" "${_interfacer}/src/${pkgname}/${pkgname}.xpi"
}

build() {
	cw=$(pwd)
	export GOPATH=$cw/go
	_interfacer="${GOPATH}/src/github.com/browsh-org/${pkgname}/interfacer"
	cd "$_interfacer"
	echo Build ${pkgname}...
	local webextension="src/browsh/browsh.xpi"
	go build	-x -modcacherw \
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

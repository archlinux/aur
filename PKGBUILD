# Maintainer alx365
# Maintainer:  Travis Collins <erbrecht at pobox dot com>
pkgname='noisetorch-git'
pkgver=0.9.0.r5.ge7072b2
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/lawl/NoiseTorch
license=('GPL3')
depends=('pulseaudio' 'polkit')
makedepends=('git' 'go' 'cmake')
provides=('noisetorch')
conflicts=("noisetorch-bin" "noisetorch")
install="${pkgname}.install"
source=('git+https://github.com/lawl/NoiseTorch.git'
        "${pkgname}.install")
sha256sums=('SKIP'
            'eb72a0bb2a89deac6cb4ddb35ed9385e744e7d47a90f8ffe904673d91c6611cd')

pkgver() {
	cd NoiseTorch
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NoiseTorch
	export GOPATH="$srcdir/go"
	go clean -modcache
}

build() {
	cd NoiseTorch/c/ladspa
	make
	cd ${srcdir}/NoiseTorch
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	echo "go cppflags $CGO_CPPFLAGS"
	echo "go cflags   $CGO_CFLAGS"
	echo "go cxxflags $CGO_CXXFLAGS"
	echo "go ldflags  $CGO_LDFLAGS"
	echo "go flags    $GOFLAGS"
	mkdir -p bin/
	go generate
	go build -o bin/noisetorch
	go clean -modcache
}

package() {
	cd NoiseTorch
	install -D -m755 bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	sed -i 's/noisetorch.png/noisetorch/g' "assets/noisetorch.desktop"
	install -D -m644 assets/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"
	install -D -m644 assets/icon/noisetorch.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}

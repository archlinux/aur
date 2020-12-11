# Maintainer alx365
# Maintainer:  Travis Collins <erbrecht at pobox dot com>
pkgname='noisetorch-git'
pkgver=0.8.2.r0.g39c1e37
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/lawl/NoiseTorch
license=('GPL3')
depends=('noise-suppression-for-voice' 'pulseaudio' 'polkit')
makedepends=('git' 'go' 'cmake')
provides=('noisetorch')
conflicts=("noisetorch-bin" "noisetorch")
install="${pkgname}.install"
source=('git+https://github.com/lawl/NoiseTorch.git'
        'main.patch'
        'module.patch'
        "${pkgname}.install")
sha256sums=('SKIP'
            '4a71c81fdb7dddc90cea893e4a1ff904180c6d7908ed765298549f538183d881'
            '9849d5ffbe1eb757419ee3e766105d7511f3eb47a49284d51ca6c530751fc455'
            'eb72a0bb2a89deac6cb4ddb35ed9385e744e7d47a90f8ffe904673d91c6611cd')

pkgver() {
	cd NoiseTorch
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NoiseTorch
	#git submodule init
	#git config submodule.librnnoise_ladspa.url $srcdir/noise-suppression-for-voice
	#git submodule update
	patch -u main.go ../main.patch
	patch -u module.go ../module.patch
	export GOPATH="$srcdir/go"
	go clean -modcache
}

build() {
	cd NoiseTorch
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

# Maintainer:  Travis Collins <erbrecht at pobox dot com>
pkgname='noisetorch'
pkgver=0.8.2
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/lawl/NoiseTorch
license=('GPL3')
depends=('noise-suppression-for-voice' 'pulseaudio' 'polkit')
makedepends=('git' 'go' 'cmake')
provides=('noisetorch')
conflicts=("noisetorch-bin" "noisetorch-git")
source=("${pkgver}-${pkgrel}.tar.gz::https://github.com/lawl/NoiseTorch/archive/${pkgver}.tar.gz"
        "main.patch"
        "module.patch"
        "version.go")
sha256sums=('81324dcf91976cdc601af79843083210e2a18ff77f6a89a26cd810430b144b9d'
            '1f9c2adab9d86fe8882de78e162045426f3be704f21476dfd6590a8de2c8048b'
            '9849d5ffbe1eb757419ee3e766105d7511f3eb47a49284d51ca6c530751fc455'
            '1f2f114638a818fe87ad10b9c7eab91f75f75f1d4e49c0a69f989f76a0d9d0a2')

prepare() {
	cd NoiseTorch-${pkgver}
	patch -u main.go ../main.patch
	patch -u module.go ../module.patch
	sed "s/VERSIONTOKEN/${pkgver}/" ../version.go > version.go
	export GOPATH="$srcdir/go"
	go clean -modcache
}

build() {
	cd NoiseTorch-${pkgver}
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
	cd NoiseTorch-${pkgver}
	install -D -m755 bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	sed -i 's/noisetorch.png/noisetorch/g' "assets/noisetorch.desktop"
	install -D -m644 assets/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"
	install -D -m644 assets/icon/noisetorch.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}

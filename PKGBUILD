# Maintainer alx365
# Maintainer:  Travis Collins <erbrecht at pobox dot com>
# Maintainer gileri
pkgname='noisetorch-git'
pkgver=0.12.2.r15.g3b04af2
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/noisetorch/NoiseTorch
license=('GPL3')
depends=('polkit' 'hicolor-icon-theme')
optdepends=('pulseaudio' 'pipewire>=0.3.28')
makedepends=('git' 'go' 'cmake')
provides=('noisetorch')
conflicts=('noisetorch')
install="${pkgname}.install"
source=('git+https://github.com/noisetorch/NoiseTorch.git'
        'git+https://github.com/noisetorch/c-ringbuf.git'
        'git+https://github.com/noisetorch/rnnoise.git'
        "${pkgname}.install")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '171a4179c7e0f3a018a314893e81e598c02cfee274c90d715a302660af920eba')

pkgver() {
	cd NoiseTorch
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NoiseTorch
	git submodule init
	git config submodule.c/c-ringbuf.url $srcdir/c-ringbuf
	git config submodule.c/rnnoise.url $srcdir/rnnoise
	git -c protocol.file.allow=always submodule update
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
	vendor_flags="-X main.version=${pkgver} -X main.distribution=archlinux"
	go build -ldflags "$vendor_flags -linkmode=external" -o bin/noisetorch
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

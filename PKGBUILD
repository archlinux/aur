# Maintainer alx365
# Maintainer:  Travis Collins <erbrecht at pobox dot com>
pkgname='noisetorch-git'
pkgver=0.5.3.beta.r2.gc07c021
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/lawl/NoiseTorch
license=('GPL3')
depends=('pulseaudio' 'polkit')
makedepends=('git' 'go' 'cmake')
provides=('noisetorch')
conflicts=("noisetorch-bin")
install="${pkgname}.install"
source=('git+https://github.com/lawl/NoiseTorch.git'
        'git+https://github.com/werman/noise-suppression-for-voice'
        "${pkgname}.install"
        'main.patch')
sha256sums=('SKIP'
            'SKIP'
            'eb72a0bb2a89deac6cb4ddb35ed9385e744e7d47a90f8ffe904673d91c6611cd'
            '1154f0c21715d6fd8e29570ada853622b8923750aaa066833b76c571774dd8d2')

pkgver() {
	cd NoiseTorch
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NoiseTorch
	git submodule init
	git config submodule.librnnoise_ladspa.url $srcdir/noise-suppression-for-voice
	git submodule update
	patch -u main.go ../main.patch
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
	make
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

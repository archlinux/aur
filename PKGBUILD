# Maintainer alx365
# Maintainer:  Travis Collins <erbrecht at pobox dot com>
pkgname='noisetorch-git'
pkgver=0.4.0.beta.r1.gaa3fce2
pkgrel=1
pkgdesc='Real-time microphone noise suppression on Linux.'
arch=('x86_64')
url=https://github.com/lawl/NoiseTorch
license=('GPL3')
depends=('pulseaudio' 'polkit')
makedepends=('git' 'go' 'cmake')
optdepends=('hicolor-icon-theme')
provides=('noisetorch')
conflicts=("noisetorch-bin")
source=('git+https://github.com/lawl/NoiseTorch.git'
        'git+https://github.com/werman/noise-suppression-for-voice'
        'config.patch')
sha256sums=('SKIP'
            'SKIP'
            '5fa20a867ffea6356e496d1d6353c5eef5940d416f90b2df926e5bf4c9ea8865')

pkgver() {
	cd NoiseTorch
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NoiseTorch
	git submodule init
	git config submodule.librnnoise_ladspa.url $srcdir/noise-suppression-for-voice
	git submodule update
	patch -u config.go ../config.patch
}

build() {
	cd NoiseTorch
	make
}

package() {
	cd NoiseTorch
	install -D -m755 bin/noisetorch "${pkgdir}/usr/bin/noisetorch"
	install -D -m644 assets/noisetorch.desktop \
		"${pkgdir}/usr/share/applications/noisetorch.desktop"

	if [[ -d "/usr/share/icons/hicolor/256x256/apps/"  ]]
	then
		install -D -m644 assets/icon/noisetorch.png \
			"${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
	fi
}

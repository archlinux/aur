# Maintainer: spider-mario <spidermario@free.fr>
pkgname=mini-audicle
pkgver=1.5.2.0
pkgrel=1
pkgdesc='Integrated Development + Performance Environment for ChucK'
arch=('x86_64')
url="https://github.com/ccrma/miniAudicle"
license=('GPL')
groups=('multimedia')
depends=('qt6-base' 'qscintilla-qt6' 'libsndfile'
# Uncomment one of the following three lines depending on the backend that you
# want. Also uncomment the corresponding make target in build() below.
# Default: PulseAudio
         'libpulse'
#        'alsa-lib'
#        'jack'
)
makedepends=('git' 'rtaudio')
optdepends=('chuck: for documentation and command line interface')
source=('git+https://github.com/ccrma/miniAudicle.git#tag=de3c3a49816f77681e038fbcd13877ec92c01c07'
	'git+https://github.com/ccrma/chuck.git'
	'git+https://github.com/ccrma/chugins.git'
        'miniAudicle.desktop'
	'rtaudio.patch')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '44219938670cd42953c2e948702adea3a33efd99c858638c0b0f824defede799937cc0c49459c10820b44d9fce56c2a071c893fef4b8b27c7e08b348be5c9d7d'
        '1288e3aa8af0b5e09c00575344cf2142696e7e0c346d6a789aaa9fce7879d463cd876796d3641ca48d430c9fa5f137255bd1ea9b40e8bdc27b34b3daf6ac6f1c')

prepare() {
	cd miniAudicle/src
	git apply -3 "$srcdir"/rtaudio.patch
	git submodule init
	git config submodule.src/chuck.url "$srcdir/chuck"
	git config submodule.src/chugins.url "$srcdir/chugins"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd miniAudicle/src
	export QMAKE=qmake6
	make \
		linux-pulse
#		linux-alsa
#		linux-jack
}

package() {
	install -Dm644 miniAudicle.desktop "$pkgdir"/usr/share/applications/miniAudicle.desktop

	cd miniAudicle/src
	install -Dm755 miniAudicle "$pkgdir"/usr/bin/miniAudicle
	install -Dm644 qt/icon/miniAudicle.png "$pkgdir"/usr/share/pixmaps/miniAudicle.png
}

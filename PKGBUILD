# Maintainer: Patrick Desaulniers <patrick dot desaulniers36 at gmail dot com>

pkgname=librearp-git
pkgver=r265.b0f7798
pkgrel=1
pkgdesc="A pattern-based arpeggio generator plugin"
arch=('x86_64')
url="https://gitlab.com/LibreArp/LibreArp.git"
license=('GPL')
depends=('freetype2' 'alsa-lib' 'gcc-libs' 'glibc' 'libx11' 'libxext' 'libxinerama' 'curl')
makedepends=('jack' 'libxcursor' 'git' 'libxrandr' 'libxcomposite' 'cmake' 'ninja')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://gitlab.com/LibreArp/LibreArp.git#branch=develop"
	"git+https://github.com/juce-framework/JUCE.git")
md5sums=('SKIP'
	'SKIP')

pkgver() {
    cd LibreArp

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd LibreArp

    git submodule init
    git config submodule.Vendor/juce.url $srcdir/JUCE
    git -c protocol.file.allow=always submodule update
}

build() {
    cd LibreArp

    mkdir -p build && cd build
    cmake -G Ninja ..
    ninja
}

package() {
    cd LibreArp

    install -d "$pkgdir/usr/lib/vst3"
    cp -rfd "build/LibreArp_artefacts/VST3/LibreArp.vst3/" -t "${pkgdir}/usr/lib/vst3/"

    install -vDm 755 "build/LibreArp_artefacts/Standalone/LibreArp" -t "${pkgdir}/usr/bin/"
}

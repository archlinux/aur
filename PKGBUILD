# Maintainer: Patrick Desaulniers <patrick dot desaulniers36 at gmail dot com>

pkgname=librearp-git
pkgver=r150.11ca65f
pkgrel=1
pkgdesc="A pattern-based arpeggio generator plugin"
arch=('x86_64')
url="https://gitlab.com/LibreArp/LibreArp.git"
license=('GPL')
depends=('freetype2' 'alsa-lib' 'gcc-libs' 'glibc' 'libx11' 'libxext' 'libxinerama' 'curl')
makedepends=('jack' 'libxcursor' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://gitlab.com/LibreArp/LibreArp.git"
	"git+https://github.com/steinbergmedia/vst3sdk.git"
	"git+https://gitlab.com/LibreArp/JUCE.git"
	"git+https://git.iem.at/zmoelnig/FST.git")
md5sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

pkgver() {
    cd LibreArp

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd LibreArp

    git submodule init
    git config submodule.Vendor/fst.url $srcdir/FST
    git config submodule.Vendor/juce.url $srcdir/JUCE
    git config submodule.Vendor/vst3sdk.url $srcdir/vst3sdk
    git submodule update

    git apply --ignore-whitespace JUCE_GPL_patch.patch
}

build() {
    cd LibreArp

    make -C ./Vendor/juce/extras/Projucer/Builds/LinuxMakefile
    ./Vendor/juce/extras/Projucer/Builds/LinuxMakefile/build/Projucer --resave LibreArp.jucer

    CONFIG="Release_64" make -C Builds/LinuxMakefile
}

package() {
    cd LibreArp

    install -vDm 755 "Builds/LinuxMakefile/build/LibreArp.so" -t "${pkgdir}/usr/lib/vst"
    install -vDm 755 "Builds/LinuxMakefile/build/LibreArp" -t "${pkgdir}/usr/bin/"
}

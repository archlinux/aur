# Maintainer: Patrick Desaulniers <patrick dot desaulniers36 at gmail dot com>

pkgname=librearp-git
pkgver=r143.d24d06f
pkgrel=1
pkgdesc="A pattern-based arpeggio generator plugin"
arch=('i686' 'x86_64')
url="https://gitlab.com/LibreArp/LibreArp.git"
license=('GPL')
depends=('freetype2' 'alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxext' 'libxinerama')
makedepends=('jack' 'libxcursor' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://gitlab.com/LibreArp/LibreArp.git")
md5sums=('SKIP')

pkgver() {
    cd LibreArp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd LibreArp
    git submodule update --init --recursive
    git apply --ignore-whitespace JUCE_GPL_patch.patch
}

build() {
    cd LibreArp
    make -C ./Vendor/juce/extras/Projucer/Builds/LinuxMakefile
    ./Vendor/juce/extras/Projucer/Builds/LinuxMakefile/build/Projucer --resave LibreArp.jucer

    # FIXME
    CPPFLAGS="$CPPFLAGS -I ../../Vendor/fst/" make -C Builds/LinuxMakefile
}

package() {
    cd LibreArp
    install -vDm 755 "Builds/LinuxMakefile/build/LibreArp.so" -t "${pkgdir}/usr/lib/vst"
    install -vDm 755 "Builds/LinuxMakefile/build/LibreArp" -t "${pkgdir}/usr/bin/"
}

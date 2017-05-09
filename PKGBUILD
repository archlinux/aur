# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=digitsvst-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r7.f5ee4aa
pkgrel=1
pkgdesc="Digits is an advanced phase distortion synthesizer"
arch=('x86_64' 'i686')
url="https://github.com/LouisGorenfeld/DigitsVst"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git://github.com/LouisGorenfeld/DigitsVst"
    "http://www.steinberg.net/sdk_downloads/vstsdk367_03_03_2017_build_352.zip"
)
noextract=()
md5sums=(
    'SKIP'
    'b4ed4f4f4be77b267f1821fc1413ea36'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    mkdir sdks
    cp -r "$srcdir/VST_SDK/VST2_SDK" "sdks/vstsdk2.4"
}

build() {
	cd "$srcdir/${pkgname%-git}/linux"
	make $BUILD_FLAGS -f Digits.make
}


package() {
	cd "$srcdir/${pkgname%-git}/linux"
    install -D -m 755 "DigitsVST.so" "$pkgdir/usr/lib/vst/DigitsVST.so"
    cd "$srcdir/${pkgname%-git}"
    install -D -m 644 "Digits Manual.pdf" "$pkgdir/usr/share/doc/digits/Digits Manual.pdf"
    cd "$srcdir/${pkgname%-git}/patches"
    for file in */*.fxp
    do
        install -D -m 644 "$file" "$pkgdir/usr/share/digits/presets/$file"
    done
    
}

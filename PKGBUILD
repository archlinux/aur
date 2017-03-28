_pkg=soundclip
_ver=0.1
pkgname="${_pkg}-git"
pkgver="${_ver}.3841f84"
pkgrel=1
pkgdesc='Theatre Sound Cue Management'
arch=('i686' 'x86_64')
url='https://github.com/soundclip/soundclip'
license=('GPL')
depends=('java-runtime>=8' 'gstreamer')
makedepends=('maven>=3' 'java-environment-jdk>=8')
source=("${pkgname}::git+${url}.git"
        'soundclip-launcher'
        'soundclip.desktop')
sha256sums=('SKIP'
            '26e71d5998b5341a670d9eea0be21c14a90546a9052e3a606d52bcafbe210dfe'
            'ed8a89f67ee4b0c0fe831da35d2fd0d3731f951c723068949705aed6d9ffdba3')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "$_ver.%s" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    mvn package
}

package() {
    install -Dm644 "$srcdir/$pkgname/Soundclip/target/Soundclip-$_ver-SNAPSHOT-jar-with-dependencies.jar" "$pkgdir/usr/share/java/soundclip/soundclip.jar"
    install -Dm755 soundclip-launcher "$pkgdir/usr/bin/soundclip"
    install -Dm644 soundclip.desktop "$pkgdir/usr/share/applications/soundclip.desktop"
    install -Dm644 "$srcdir/$pkgname/Soundclip/src/main/resources/img/icon/icon_512x512.png" "$pkgdir/usr/share/pixmaps/soundclip.png"
}
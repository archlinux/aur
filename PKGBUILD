# Maintainer: Jonathan Dönszelmann <jonabent@gmail.com>
pkgname=webdsl-git
pkgver=r4090.56b29075
pkgrel=3
pkgdesc=""
arch=(x86_64)
url=""
license=('Apache License 2.0')
groups=()
depends=('java-runtime' 'ant')
makedepends=('java-environment' 'ant' 'wget' 'autoconf' 'automake' 'maven' 'eclipse-ecj')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('webdsl::git+https://github.com/webdsl/webdsl#branch=master' 'nailgun::git+https://aur.archlinux.org/nailgun-git#branch=master')
noextract=()
md5sums=('SKIP' 'SKIP') 

prepare() {
   cd "webdsl"
   git clean -fXd
}

pkgver() {
    cd "webdsl"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "nailgun"
    makepkg -si --noconfirm
    cd ..

    mkdir -p "$srcdir"/build
    cd "webdsl"

    #echo "libwebdsl-front.rtree: src-gen/org/webdsl/webdsl_front/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
    #echo "libwebdsl-generator.rtree: src-gen/org/webdsl/webdsl_generator/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
    #echo "libjava-transformations.rtree: src-gen/org/webdsl/java_transformations/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
    #echo "libwrite-files.rtree: src-gen/org/webdsl/write_files/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
    #echo "libstatistics.rtree: src-gen/org/webdsl/statistics/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
    #echo "libback-end-transformations.rtree: src-gen/org/webdsl/back_end_transformations/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
    #echo "libto-java-servlet.rtree: src-gen/org/webdsl/to_java_servlet/Main.java" >> "$srcdir"/webdsl/src/Makefile.am
        
    ./bootstrap
    ./configure --prefix="$srcdir/build"
    make -j1
}

package() {
    cd "webdsl"

    make install
    ls -la "$srcdir"/build/* 

    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share
    cp -r "$srcdir"/build/bin/* "$pkgdir"/usr/bin
    cp -r "$srcdir"/build/share/* "$pkgdir"/usr/share

}

# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: Simon Lipp <sloonz+aur at gmail dot com>

pkgname=javahelp2
pkgver=2.0.05.r90
pkgrel=3
# manual versioning
source=("${pkgname}::git+https://github.com/javaee/javahelp.git#commit=3ca862d8626096770598a3a256886d205246f4a4"
# https://github.com/javaee/javahelp/issues/47
        'compilation-version.patch')
sha256sums=('SKIP'
            '2aedeaa3857c6de9a26e761c4d03ec5bc4d2a1d52e9820221a7dbef6c23e5d46')
pkgdesc="Java based help system"
arch=('any')
url="https://javaee.github.io/javahelp/"
license=('custom' 'CDDL' 'GPL2')
makedepends=('apache-ant' 'git')
depends=('java-runtime')

prepare(){
    cd "${srcdir}/${pkgname}"
    # http://openjdk.java.net/jeps/182
    # > In JDK 9 and going forward, javac will use a "one + three back" policy of supported source and target options.
    # NOTE: I just hope, that it'll compile right.
    < "${srcdir}/compilation-version.patch" \
        sed "s/@VERSION@/$(javac -version 2>&1 |
            sed -e 's/^javac\s\+\([0-9]\+\.[0-9]\+\).*$/\1/g')/g" | patch -p1
}

build(){
    cd "${srcdir}/${pkgname}/javahelp_nbproject"
    ant release
}

package() {
    cd "${srcdir}/${pkgname}/javahelp_nbproject/dist/lib"
    install -dm755 "${pkgdir}/usr/share/java/javahelp"
    install -m644 -- *.jar "${pkgdir}/usr/share/java/javahelp"
    cd ../bin
    install -m644 -- *.jar "${pkgdir}/usr/share/java/javahelp"
    cd ../../lib
    # These are jars from tomcat5 and jdic-stub.jar
    install -m644 -- *.jar "${pkgdir}/usr/share/java/javahelp"

    install -dm755 "${pkgdir}/usr/share/licenses"
    install -D -m644 -- "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

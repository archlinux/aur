# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Maintainer: alexisph@gmail.com
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: Simon Lipp <sloonz+aur at gmail dot com>

pkgname=javahelp2
# manual versioning
pkgver=2.0.05.r90
pkgrel=7
pkgdesc="Java based help system"
url="https://javaee.github.io/javahelp/"
license=('custom' 'CDDL' 'GPL2')
arch=('any')
depends=('java-runtime')
makedepends=('ant' 'git')
source=("${pkgname}::git+https://github.com/javaee/javahelp.git#commit=3ca862d8626096770598a3a256886d205246f4a4"
        'java9-fix.patch')
sha512sums=('SKIP'
            '089c778aa937cd288aeae6cc87aaa3747925bf32871266d5f1d2e243b105fb70823a9f4903e4c0fcb60f4c73ea62c2a2927ef56315a826c454a5be9b72b425a6')

prepare () {
    cd "${pkgname}"
    patch -Np1 -i ../java9-fix.patch
}

build() {
    cd "${pkgname}/javahelp_nbproject"
    # http://openjdk.java.net/jeps/182
    # > In JDK 9 and going forward, javac will use a "one + three back" policy of supported source and target options.
    # NOTE: I just hope, that it'll compile right.

    #local MAKEPKG_JAVA_VERSION=
    if [ -z $MAKEPKG_JAVA_VERSION ]; then
        local MAKEPKG_JAVA_VERSION="$(sed -ne 's/^JAVA_VERSION="\([0-9]\+\.[0-9]\+\).*"$/\1/p' /usr/lib/jvm/default/release)"
        if [ -z $MAKEPKG_JAVA_VERSION ]; then
          error    "No Java version information. Set MAKEPKG_JAVA_VERSION variable"
          plainerr "in PKGBUILD or in the shell environment to a value that is accepted"
          plainerr "by ant -Djavac.source and -Djavac.target options (e.g. 1.8, 11, 17, 20, ...)"
          # or fix your setup
          exit 1
        fi
        # accepted: 1.8, 17
        # not accepted: 17.0
        case $MAKEPKG_JAVA_VERSION in
          1.*) ;;
          *) MAKEPKG_JAVA_VERSION="${MAKEPKG_JAVA_VERSION%.*}" ;;
        esac
    fi
    msg2 "Using Java version $MAKEPKG_JAVA_VERSION"
    ant -Djavac.source="$MAKEPKG_JAVA_VERSION" -Djavac.target="$MAKEPKG_JAVA_VERSION" release
}

package() {
    cd "${pkgname}/javahelp_nbproject/dist/lib"
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

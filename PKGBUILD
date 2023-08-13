# Maintainer: Victor Dmitriev <mrvvitek@gmail.com>
# XXX The build is broken, requires old jogl (older then 2.1.5?)
# project seems unmaintained, up-to-date maintained version is in Scilab source tree

pkgname=scirenderer
# manual versioning
# ab7f8d318cad6d45e5ffebb88c84cbebf25f48e6 is 1.1.0, untagged
# 1.0.9.r2.gab7f8d3
pkgver=1.1.0
pkgrel=2
pkgdesc='A rendering library based on JoGL'
arch=('any')
url="https://gitlab.com/scilab/forge/scirenderer"
license=('custom:CeCILL2.0')
depends=('java-runtime' 'jogl')
makedepends=('git' 'ant' 'java-environment')
source=('git+https://gitlab.com/scilab/forge/scirenderer.git#commit=ab7f8d318cad6d45e5ffebb88c84cbebf25f48e6'
    'build.xml.patch'
    'scirenderer-libs.properties.patch')
sha512sums=('SKIP'
            '161386cb4257c4d78221dcd1203e93af310198b1136f777e702754294d533f633f77ccd100021c9be0399b3c6aff74ac5892ea583cff229397ed9112d8ee3129'
            'b466c970072550300cc3f8275c6633e74535380b8eb0620dabe0f315ad2acb52d8392ae9f9a64b2e79c8c8675d7581c41f94e20c8651d775acf0096004156456')

prepare () {
    cd scirenderer
    # http://openjdk.java.net/jeps/182
    # > In JDK 9 and going forward, javac will use a "one + three back" policy of supported source and target options.
    # NOTE: I just hope, that it'll compile right.

    #local MAKEPKG_JAVA_VERSION=
    if [ -z $MAKEPKG_JAVA_VERSION ]; then
        local MAKEPKG_JAVA_VERSION="$(sed -ne 's/^JAVA_VERSION="\([0-9]\+\.[0-9]\+\).*"$/\1/p' /usr/lib/jvm/default/release)"
        if [ -z $MAKEPKG_JAVA_VERSION ]; then
            error    "No Java version information. Set MAKEPKG_JAVA_VERSION variable"
            plainerr "in PKGBUILD or in the shell environment to a value that is accepted"
            plainerr "by ant -Djavac.source and -Djavac.target options (e.g. 1.8,
            11, 17, 20, ...)"
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
    sed "s/%VERSION%/$MAKEPKG_JAVA_VERSION/g" < ../build.xml.patch | patch -Np0
    patch -Np0 -i ../scirenderer-libs.properties.patch
}

build() {
    cd scirenderer
    ant jar
}

#checkdepends=('jlatexmath')
#check() {
#    cd scirenderer
#    ant all-examples
#}

package() {
    cd scirenderer
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "jar/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

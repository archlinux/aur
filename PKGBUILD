# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: Artyom Olshevskiy <siasia@siasia>

pkgname='java-service-wrapper'
pkgver=3.5.35
pkgrel=1
pkgdesc="Enables a Java Application to be run as a Windows Service or Unix Daemon"
url="https://wrapper.tanukisoftware.com/doc/english/introduction.html"
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('GPL2')
conflicts=('java-service-wrapper-bin')
makedepends=('apache-ant' 'java-environment>=7')
source=("https://wrapper.tanukisoftware.com/download/${pkgver}/wrapper_${pkgver}_src.tar.gz"
        'java10.patch')
sha256sums=('82f7d89414ce4ff0cdbb8357d779362bb5ddf068aede20a4a56627ed55e25e56'
            'af0f8fb43e22b5499376a633fea106654a30bb9000f00e6d68bfa603c422746f')

prepare() {
    cd "${srcdir}/wrapper_${pkgver}_src"

    if [[ $(javac -version |grep 10.0) ]]; then
        sed -i "build.xml" \
            -e "s:value=\"1.4\":value=\"1.10\":"
        patch -Np0 -i "$srcdir/java10.patch"
    else
        sed -i "build.xml" \
            -e "s:value=\"1.4\":value=\"1.7\":"
    fi

    # Prevent building the testsuite on the x64, this requires the cunit pkg
    # from the AUR, its a pain and useless to keep it a build-dep
    sed -i "src/c/Makefile-linux-x86"*.make \
        -e "s|all: .*|all: init wrapper libwrapper.so|"
}

build() {
    cd "${srcdir}/wrapper_${pkgver}_src"
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh
    export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/default}"

    [[ "$CARCH" = @(x86_64|aarch64) ]] && _bits=64    || _bits=32
    [[ "$CARCH" = arm*              ]] && _arch=armhf || _arch=x86

    ant -Dbits="$_bits" -Ddist.arch="$_arch" jar compile-c-unix
}

package() {
    cd "${srcdir}/wrapper_${pkgver}_src"
    install -Dm755 bin/wrapper       "${pkgdir}/usr/bin/java-service-wrapper"
    install -Dm644 lib/libwrapper.so "${pkgdir}/usr/lib/java-service-wrapper/libwrapper.so"
    install -Dm644 lib/wrapper.jar   "${pkgdir}/usr/share/java/wrapper-${pkgver}.jar"
    install -Dm644 doc/wrapper-community-license*.txt "${pkgdir}/usr/share/licenses/java-service-wrapper/LICENSE"
    ln -s /usr/share/java/wrapper-${pkgver}.jar "${pkgdir}/usr/share/java/wrapper.jar"
}

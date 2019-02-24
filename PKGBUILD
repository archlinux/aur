# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

# Comment out if you want to build all language translations
export LG2=en

pkgname=i2p-dev
pkgver=0.9.38.9
pkgrel=1
pkgdesc="A distributed anonymous network (daily mtn->git sync)"
url="https://geti2p.net"
license=('GPL2')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('java-runtime>=11' 'java-service-wrapper' 'gmp')
makedepends=('java-environment>=11' 'apache-ant' 'git')
[[ "$LG2" != 'en' ]] && makedepends+=('gettext')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-bin')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
options=(!strip)

_tomcatver=9.0.16
_gitname=i2p.i2p
_commit=master

source=("git+https://github.com/i2p/${_gitname}.git#commit=${_commit}"
        "http://apache.mirrors.pair.com/tomcat/tomcat-9/v${_tomcatver}/bin/apache-tomcat-${_tomcatver}.tar.gz"
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')
sha256sums=('SKIP'
            '1f45dd960c6cbc044e75ce0ed5ae5d3af62aff0152fa56b8160d2e3dc23f417a'
            'ff9942ca43715b5095b0118e306c8aec1af7c68c18e8959dba10d86eac8efbfd'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            '72c0944cd2b04c747673a534475f2ec42c64d52fdda76714f1165c4655113de2'
            '41756375ef2e8323147cec31a8675b2bc11109451f9185c036ff32d26d6c9b99')

pkgver() {
    cd "$_gitname"
    echo "$(grep 'VERSION =' core/java/src/net/i2p/CoreVersion.java \
        |sed 's/.*= "//;s/";//').$(grep 'BUILD =' router/java/src/net/i2p/router/RouterVersion.java \
        |sed 's/.*= //;s/;//')"
}

prepare() {
    cd "$_gitname"

    sed -i build.properties \
        -e 's:javac.version=.*:javac.version=11:'
    sed -i {router,core}/java/build.xml \
        -e 's:1.7:11:'

    sed -i build.xml \
        -e "s:value=\"8.5.38\":value=\"${_tomcatver}\":"
    cd apps/jetty
    rm -rf apache-tomcat-8.5.38
    ln -sf "$srcdir"/apache-tomcat-${_tomcatver} .
}

build_jbigi() {
    msg "Building libjbigi..."
    cd "$srcdir/$_gitname/core/c/jbigi"
    CFLAGS+=" -fPIC -Wall"
    INCLUDES="-I./jbigi/include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjbigi.so"
    gcc -c $CFLAGS $INCLUDES jbigi/src/jbigi.c
    gcc $LDFLAGS $INCLUDES -o libjbigi.so jbigi.o -lgmp
    install -Dm644 libjbigi.so "$srcdir/$_gitname/pkg-temp/lib/libjbigi.so"
}

build_jcpuid() {
if [[ "$CARCH" != @(arm)* ]]; then
    msg "Building libjcpuid..."
    cd "$srcdir/$_gitname/core/c/jcpuid"
    INCLUDES="-I./include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjcpuid-${CARCH}-linux.so"
    gcc $CFLAGS $LDFLAGS $INCLUDES src/jcpuid.c -o libjcpuid-${CARCH}-linux.so
    install -Dm644 libjcpuid-${CARCH}-linux.so "$srcdir/$_gitname/pkg-temp/lib/libjcpuid.so"
fi
}

build() {
    source /etc/ant.conf
    export ANT_OPTS="-Dfile.encoding=UTF-8"
    export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/default}"

    build_jbigi
    build_jcpuid

    cd "$srcdir/$_gitname"
    ant -Dworkspace.version=$(git rev-parse --short $_commit) preppkg-linux
}

package() {
    cd "$pkgdir"

    install -dm755 "usr/bin"
    install -dm755 "opt/i2p"

    cp -r "$srcdir/$_gitname"/pkg-temp/* "opt/i2p"

    install -Dm644 "$srcdir/router.config"     "opt/i2p/router.config"
    install -Dm644 "$srcdir/wrapper.config"    "opt/i2p/wrapper.config"
    install -Dm755 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"
    install -Dm644 "$srcdir/i2prouter.service" "usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/{eepget,i2prouter}

    chmod  -x opt/i2p/*.config
    chmod 755 opt/i2p
    chown  -R 985:985 opt/i2p

    echo 'u i2p 985 "I2P Router" /opt/i2p /bin/sh' |
    install -Dm644 /dev/stdin "usr/lib/sysusers.d/i2p.conf"
    echo 'd /run/i2p 0700 i2p i2p' |
    install -Dm644 /dev/stdin "usr/lib/tmpfiles.d/i2p.conf"

    sed -i opt/i2p/{eepget,wrapper.config} \
        -e 's:%INSTALL_PATH:/opt/i2p:g'
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.4.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
    sed -i opt/i2p/i2ptunnel.config \
        -e "s:tunnel.6.startOnLoad=.*:tunnel.6.startOnLoad=false:"
    rm -r opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper}
}

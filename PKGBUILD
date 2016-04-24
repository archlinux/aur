# Maintainer: skydrome <skydrome at@at i2pmail do.t org>
# Contributors:

_fred=#tag=build01472
_contrib=#tag=v50
_wot=#tag=build0018
#_wot=#commit=f8d98130e65de53bb315312f6300ebd28d7399c2
_keyutils=#tag=v5026
_upnp=#tag=10007

pkgname=freenet
pkgver=0.7.5.1472
pkgrel=1
_pkgver=0.7.5
pkgdesc="An encrypted network without censorship"
url="https://downloads.freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'

depends=('java-runtime>=7' 'gmp' 'java-service-wrapper')
makedepends=('java-environment>=7' 'apache-ant' 'git')
checkdepends=('junit')
# comment out to run unit tests
BUILDENV+=('!check')

backup=('opt/freenet/wrapper.config'
        'opt/freenet/conf/freenet.ini')

_plugins=('WebOfTrust' 'UPnP' 'KeyUtils')

# these are packages we need to download to prevent ant from
# downloading them itself we are also going to build as much
# as we can from source, including this array
_deps=("http://downloads.sourceforge.net/project/sevenzip/LZMA%20SDK/4.65/lzma465.tar.bz2"
       "league-lzmajio-0.95-0-gd38bf5c.tar.gz::https://codeload.github.com/league/lzmajio/legacy.tar.gz/0.95"
       "http://downloads.sourceforge.net/project/bitcollider/jBitcollider%20%28Java%29/0.8/jBitcollider-0.8.zip"
       "https://www.spaceroots.org/software/mantissa/mantissa-7.2-src.zip"
       "${url}/contrib/db4o-7.4-java.zip")

# ant will extract these
noextract=('lzma465.tar.bz2'
           'league-lzmajio-0.95-0-gd38bf5c.tar.gz'
           'jBitcollider-0.8.zip'
           'mantissa-7.2-src.zip'
           'db4o-7.4-java.zip'
           'commons-compress.jar'
           'bcprov-jdk15on-154.jar')

# here we have only java-commons-compress coming prebuilt by
# the freenetproject, the rest we build ourselves
source=("git+https://github.com/freenet/fred.git${_fred}"
        "git+https://github.com/freenet/contrib.git${_contrib}"
        "git+https://github.com/freenet/plugin-UPnP.git${_upnp}"
        "git+https://github.com/freenet/plugin-KeyUtils.git${_keyutils}"
        "git+https://github.com/freenet/plugin-WebOfTrust.git${_wot}"
        "${url}/alpha/opennet/seednodes.fref"
        "IpToCountry.dat::http://software77.net/geo-ip/?DL=4"
        "${url}/contrib/jar/latest/commons-compress.jar"
        "https://www.bouncycastle.org/download/bcprov-jdk15on-154.jar"
        "http://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.bz2"
        "https://raw.githubusercontent.com/i2p/i2p.i2p/master/core/c/jcpuid/src/jcpuid.c"
        "https://raw.githubusercontent.com/i2p/i2p.i2p/master/core/c/jcpuid/include/jcpuid.h"
        'fred.properties' 'contrib.properties' 'run.sh'
        'freenet.service' 'freenet.ini' 'wrapper.config'
        "${_deps[@]}")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '16924be3c8f1322b659f3ff08060a43f45f2e8de6f95af28d86fe9876e79008d'
            'd0ae14598f9c528d2ab7bb8ed00e785a5440f692712cd362d69328aba25efb57'
            '96effcca2581c1ab42a4828c770b48d54852edf9e71cefc9ed2ffd6590571ad1'
            'f1ecddb5395892e0b2e6282bc3a1437d06afa52758057850ecccfa0a79c45c5d'
            '9ec758801a9864ae10caf851ee60ed22c3ef44428e77689c203d9b890921a6d2'
            '236adfd42be0a7a74f2dec1356e517442b2ddcbb5d44cb0dab3671b6fddfca79'
            '865c1f259d9c544861cc12b4ea64ad35ec6388c1392b3e5247eaed0f316e42b7'
            '9912dcfc8f30143b68e6f9c51505ae921100eb6b24690a8680582bb23559d95a'
            '434f67e2e86edb555b7dfb572a52d7ff719373989e1f1830f779bfccc678539f'
            'c0ce093a098d91dee6be294f8a2fc929aabad95612f994933194d0da5c4cdd25'
            'f7bceda39b36d1d79e70c8ba8e0e68d4cfe060b16e67d8341078af5fda13b405'
            'c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e'
            '265f7ed2dd4fecb058884d3f8974674b06e0be46131c3b2bc6a310373937d2ef'
            'b36482ee9e919c669bb1797ff7e50f57edf505af67664e280fe1dff361861044'
            'e438135d69139ed4fa44400f416ea73935d16afe50dfe490b7bba0602ee89476'
            '73f307a8cbd114fdc0af8daa067994a2cdc364c4053e6734d16b8dd1d5a0469f')

pkgver() {
    cd "$srcdir/fred"
    echo "${_pkgver}.$(git describe |sed 's/build0//;s/-/./g')"
}

if [[ "$CARCH" = 'i686' ]]; then
     _arch=x86
    __arch=i386
else
     _arch=x86_64
    __arch=amd64
fi

prepare() {
    cd "$srcdir/fred"

    rm -rf contrib
    ln -sf ../contrib contrib
    mkdir -p contrib/freenet-ext/{dist,lib}

    # no need to fetch this file every time freenet starts as its only updated
    # monthly, if it even changes at all
    sed -i src/freenet/node/updater/NodeUpdateManager.java \
        -e "s:updateIPToCountry =.*:updateIPToCountry = false;:"

    # had a hard time building these sources, we'll use the prebuilt jars
    cp "$srcdir/commons-compress.jar" contrib/freenet-ext/dist

    # this is done to satisfy ant
    ln -sf /usr/share/java/wrapper.jar contrib/freenet-ext/dist/
    ln -sf /usr/share/java/{hamcrest-core,junit}.jar lib/
    ln -sf "$srcdir"/ant-contrib/{ant-contrib-1.0b3,ant-contrib}.jar
    cp "$srcdir"/bcprov-jdk15on-154.jar lib/bcprov.jar
    cp "$srcdir"/{lzma465.tar.bz2,league-lzmajio-0.95-0-gd38bf5c.tar.gz,jBitcollider-0.8.zip,mantissa-7.2-src.zip,db4o-7.4-java.zip} contrib/freenet-ext/lib

    # we're going to compile our own C libraries
    cd "$srcdir/contrib"
    rm -rf NativeBigInteger/lib/net/i2p/util/*
    rm -rf NativeThread/lib/freenet/support/io/*.so
    rm -rf onion-fec/bin/lib/{freebsd,linux,win32}-*

    # these are from the I2P project
    cd "$srcdir/contrib/jcpuid"
    rm -rf lib/freenet/support/CPUInformation/* include/jcpuid.h
    ln -sf "$srcdir"/jcpuid.h include/
    ln -sf "$srcdir"/jcpuid.c src/
}

build() {
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh
    export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/default}"

    build_jbigi
    build_nativethread
    build_jcpuid
    build_fec

    msg "Building Contrib Modules..."
    cd "$srcdir/fred/contrib/freenet-ext"
    ant -propertyfile "$srcdir/contrib.properties" \
        -Djava.class.dirs.user="$srcdir/ant-contrib"

    # ant doesnt seem to put all the required folders into the
    # freenet-ext.jar correctly, make sure to do it here
    cd dist
    for dep in bitcollider-core commons-compress db4o lzmajio mantissa wrapper
    do
        jar xf "${dep}.jar"
    done
    jar uf freenet-ext.jar com net org SevenZip

    msg "Building Freenet..."
    cd "$srcdir/fred"
    ant package-only -propertyfile "$srcdir/fred.properties" \
        -f build-clean.xml -Ddoc.skip=true

    build_plugins
}

build_jbigi() {
    msg "Building NativeBigInt..."
    cd "$srcdir/contrib/NativeBigInteger"

    _objdir='lib/net/i2p/util'
    CFLAGS+=" -fPIC -Wall"
    INCLUDES="-I./jbigi/include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjbigi.so -lgmp"
    rm -f *.o *.so

    set -x
    gcc -c $CFLAGS $INCLUDES jbigi/src/jbigi.c
    gcc $LDFLAGS jbigi.o -o "$_objdir"/libjbigi-linux-none.so
    set +x
}

build_nativethread() {
    msg "Building NativeThread..."
    cd "$srcdir/contrib/NativeThread"

    _objdir='lib/freenet/support/io'
    INCLUDES="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,llibnative.so -lc"
    rm -f *.o *.so NativeThread.h

    set -x
    javah -o NativeThread.h -classpath ../../fred/src freenet.support.io.NativeThread
    gcc -c $CFLAGS $INCLUDES NativeThread.c
    gcc $LDFLAGS NativeThread.o -o "$_objdir"/libNativeThread-${__arch}.so
    set +x
}

build_jcpuid() {
    msg "Building NativeCPUID..."
    cd "$srcdir/contrib/jcpuid"

    _objdir='lib/freenet/support/CPUInformation'
    INCLUDES="-I./include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjcpuid-x86-linux.so"
    rm -f *.o *.so

    set -x
    gcc -c $CFLAGS $INCLUDES src/jcpuid.c
    gcc $LDFLAGS jcpuid.o -o "$_objdir"/libjcpuid-${_arch}-linux.so
    set +x
}

build_fec() {
    msg "Building onion-fec..."
    cd "$srcdir/contrib/onion-fec/src/csrc"

    _objdir='../../bin/lib/linux-${_arch}'
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro"
    INCLUDES="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    _CLASSPATH="-classpath ../ com.onionnetworks.fec"

    mkdir -p "$_objdir"
    rm -f *.o *.so *.S com_*.h

    set -x
    javah -o com_onionnetworks_fec_Native8Code.h  ${_CLASSPATH}.Native8Code
    javah -o com_onionnetworks_fec_Native16Code.h ${_CLASSPATH}.Native16Code
    gcc -S $CFLAGS fec.c -DGF_BITS=8  -o fec8.S
    gcc -S $CFLAGS fec.c -DGF_BITS=16 -o fec16.S
    gcc -c $CFLAGS $INCLUDES fec-jinterf.c -DGF_BITS=8  -o fec8-jinterf.o
    gcc -c $CFLAGS $INCLUDES fec-jinterf.c -DGF_BITS=16 -o fec16-jinterf.o
    gcc -c $CFLAGS fec8.S  -DGF_BITS=8  -o fec8.o
    gcc -c $CFLAGS fec16.S -DGF_BITS=16 -o fec16.o
    gcc $LDFLAGS fec8.o fec8-jinterf.o   -o "$_objdir"/libfec8.so
    gcc $LDFLAGS fec16.o fec16-jinterf.o -o "$_objdir"/libfec16.so
    set +x
}

build_plugins() {
    for plugin in ${_plugins[@]}; do
        msg "Building Plugin ${plugin}..."
        cd "$srcdir/plugin-${plugin}"
        ant dist \
            -Dfreenet-cvs-snapshot.location=../fred/dist/freenet.jar \
            -Dfreenet-ext.location=../contrib/freenet-ext/dist/freenet-ext.jar \
            -Djunit.location=/usr/share/java/junit.jar \
            -Dtest.skip=true
    done
}

check() {
    cd "$srcdir/fred"

    # these tests use alot of memory and can cause OOM's
    rm -f test/freenet/client/async/{*Storage,ClientRequestSelector}Test.java

    ant unit -propertyfile "$srcdir/fred.properties" \
        -f build-clean.xml
}

package() {
    cd "$srcdir/fred"

    # freenet
    install -dm755 "$pkgdir"/usr/bin
    install -dm700 "$pkgdir"/run/freenet
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf,noderef,persistent-temp,tmp,plugins/data,user/{data,certs}}

    install -m640 "$srcdir"/{wrapper.config,run.sh,IpToCountry.dat} \
                                                                "$pkgdir"/opt/freenet
    install -m640 "$srcdir"/freenet.ini                         "$pkgdir"/opt/freenet/conf
    install -m640 contrib/freenet-ext/dist/freenet-ext.jar \
                  dist/freenet.jar                         \
                  lib/bcprov.jar                                "$pkgdir"/opt/freenet/lib

    # FIXME Workaround for https://bugs.freenetproject.org/view.php?id=6684
    install -m640 "$srcdir"/seednodes.fref                      "$pkgdir"/opt/freenet
    ln -s /opt/freenet/seednodes.fref "$pkgdir"/opt/freenet/noderef/

    # plugins
    for plugin in ${_plugins[@]}; do
    install -m640 "$srcdir"/plugin-${plugin}/dist/${plugin}.jar "$pkgdir"/opt/freenet/plugins
    done

    echo "pluginmanager.loadplugin=$(echo ${_plugins[@]}|sed 's| |;|g')" \
        >>"$pkgdir"/opt/freenet/conf/freenet.ini

    # launcher
    chmod +x "$pkgdir"/opt/freenet/run.sh
    ln -s /opt/freenet/run.sh "$pkgdir"/usr/bin/freenet

    # systemd
    install -dm755 "$pkgdir"/usr/lib/tmpfiles.d
    install -Dm644 "$srcdir"/freenet.service    "$pkgdir"/usr/lib/systemd/system/freenet.service
    echo 'd /run/freenet 0700 freenet freenet' >"$pkgdir"/usr/lib/tmpfiles.d/freenet.conf

    # license
    install -dm755        "$pkgdir"/usr/share/licenses/freenet
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/freenet/LICENSE
}

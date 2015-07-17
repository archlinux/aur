# Maintainer: skydrome <skydrome at@at i2pmail do.t org>
# Contributors:
#

_fred=#commit=38c543c  # build-1468 2015-07-11
#_fred=#branch=next    # git HEAD

# comment out to run unit tests
BUILDENV+=('!check')

# plugins failing to build:
# 'WebOfTrust'
_plugins=('WebOfTrust' 'JSTUN' 'UPnP' 'KeyUtils')

pkgname=freenet
pkgver=0.7.5.1468.29.g38c543c
pkgrel=3

_pkgver=0.7.5
pkgdesc="An encrypted network without censorship"
url="https://downloads.freenetproject.org"
license=('GPL2')
arch=('any')
install='freenet.install'

depends=('java-runtime' 'bcprov151>=1.52' 'gmp' 'java-service-wrapper')
makedepends=('java-environment' 'unzip' 'apache-ant' 'apache-ant-contrib' 'git')
checkdepends=('junit')

backup=('opt/freenet/wrapper.config'
        'opt/freenet/conf/freenet.ini')

# these are packages we need to download to prevent ant from
# downloading them itself we are also going to build as much
# as we can from source, including this array
_deps=("https://downloads.sourceforge.net/project/sevenzip/LZMA%20SDK/4.65/lzma465.tar.bz2"
       "league-lzmajio-0.95-0-gd38bf5c.tar.gz::https://codeload.github.com/league/lzmajio/legacy.tar.gz/0.95"
       "https://downloads.sourceforge.net/project/bitcollider/jBitcollider%20%28Java%29/0.8/jBitcollider-0.8.zip"
       "https://www.spaceroots.org/software/mantissa/mantissa-7.2-src.zip"
       "${url}/contrib/db4o-7.4-java.zip")

noextract=('lzma465.tar.bz2'
           'league-lzmajio-0.95-0-gd38bf5c.tar.gz'
           'jBitcollider-0.8.zip'
           'mantissa-7.2-src.zip'
           'db4o-7.4-java.zip'
           *."jar")

# here we have only java-commons-compress and java-db4o coming
# prebuilt by the freenetproject, the rest we attempt to build ourselves
source=("git+https://github.com/freenet/fred.git${_fred}"
        "git+https://github.com/freenet/contrib.git"
        "git+https://github.com/freenet/plugin-JSTUN.git"
        "git+https://github.com/freenet/plugin-UPnP.git"
        "git+https://github.com/freenet/plugin-KeyUtils.git"
        "git+https://github.com/freenet/plugin-WebOfTrust.git#branch=next"
        "${url}/alpha/opennet/seednodes.fref"
        #"https://downloads.freenetproject.org/alpha/freenet-ext.jar"
        #"http://www.aqute.biz/repo/biz/aQute/bnd/0.0.401/bnd.jar"
        #"WebOfTrust.jar::${url}/alpha/plugins/WebOfTrust/WebOfTrust-build0013.jar"
        "${url}/contrib/jar/latest/commons-compress.jar"
        "${url}/contrib/jar/latest/db4o.jar"
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
            'bb98650344e65138d694dfa54f89b5690088cc14f42d1ace2ae0063d35f417bd'
            'f1ecddb5395892e0b2e6282bc3a1437d06afa52758057850ecccfa0a79c45c5d'
            '9ec758801a9864ae10caf851ee60ed22c3ef44428e77689c203d9b890921a6d2'
            '24fed7935fcbfc6eb022e04abe8b9d22fda88eae8c1f73daf99e8f28a420d05f'
            '23301d421c1fd1d076ef2c8371881477924c03db21b19a8ca180a8db6349dfaa'
            '3e48a77324277569b93a6e4082ddcf4303435c86ebd005594f164cb0047997b3'
            'c449771efa8819b31565ae7e46787e9aee7afbbc4664e27a96d1fd2f2a4ca4fa'
            'e83c19b6f9137539ab4dd66a5bf1a5207b4b351eb808688d963f1081852be022'
            'ac83d727d6301e75cf1d441a1a1e72ba06ea119fa53a3bae65b3373108abf213'
            'c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e'
            '265f7ed2dd4fecb058884d3f8974674b06e0be46131c3b2bc6a310373937d2ef'
            '818a4b8bbcb50878a8b1b9f71b4274d242ab46bf860c74676e98dec1d0248821'
            'e438135d69139ed4fa44400f416ea73935d16afe50dfe490b7bba0602ee89476'
            '73f307a8cbd114fdc0af8daa067994a2cdc364c4053e6734d16b8dd1d5a0469f')

pkgver() {
    cd "$srcdir/fred"
    echo "${_pkgver}.$(git describe |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd "$srcdir/fred"

    if [[ "$CARCH" = 'i686' ]]; then
         _arch=x86
        __arch=i386
    else
         _arch=x86_64
        __arch=amd64
    fi

    rm -rf contrib
    ln -sf ../contrib contrib
    mkdir -p contrib/freenet-ext/{dist,lib}

    # had a hard time building these two sources, we'll use the binaries
    for dep in commons-compress ;do
        cp "$srcdir/${dep}.jar" contrib/freenet-ext/dist
    done

    # this is done to satisfy ant
    ln -sf /usr/share/java/wrapper.jar contrib/freenet-ext/dist/
    ln -sf /usr/share/java/{bcprov,hamcrest-core,junit}.jar lib/
    cp "$srcdir"/{lzma465.tar.bz2,league-lzmajio-0.95-0-gd38bf5c.tar.gz,jBitcollider-0.8.zip,mantissa-7.2-src.zip,db4o-7.4-java.zip} contrib/freenet-ext/lib

    # we're going to compile our own c libraries
    cd "$srcdir/contrib"
    rm -rf NativeBigInteger/lib/net/i2p/util/*
    rm -rf onion-fec/bin/lib/{freebsd,linux,win32}-*

    cd "$srcdir/contrib/jcpuid"
    rm -rf lib/freenet/support/CPUInformation/* include/jcpuid.h

    # these are from the I2P project
    ln -sf "$srcdir"/jcpuid.h include/
    ln -sf "$srcdir"/jcpuid.c src/

    # append wrapper.jar location to JSTUN build
    sed -i "$srcdir/plugin-JSTUN/build.xml" \
        -e 's|<pathelement location="${freenet-ext.location}"/>|<pathelement location="${freenet-ext.location}"/>\n<pathelement location="/usr/share/java/wrapper.jar"/>|'
}

build() {
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh

    build_jbigi
    build_jcpuid
    build_fec
    #build_db4o

    msg "Building Freenet-ext..."
    cd "$srcdir/fred/contrib/freenet-ext"
    ant -propertyfile "$srcdir/contrib.properties"

    cd dist
    for dep in bitcollider-core commons-compress db4o lzmajio mantissa wrapper; do
        unzip -nq "${dep}.jar"
    done
    jar uf freenet-ext.jar com net org SevenZip

    msg "Building Freenet..."
    cd "$srcdir/fred"
    ant package-only -propertyfile "$srcdir/fred.properties" \
        -f build-clean.xml

    build_plugins
}

build_jbigi() {
    msg "Building libjbigi..."
    cd "$srcdir/contrib/NativeBigInteger"

    _objdir='net/i2p/util'
    CFLAGS+=" -fPIC -Wall"
    INCLUDES="-I./jbigi/include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjbigi.so -lgmp"
    gcc -c $CFLAGS $INCLUDES jbigi/src/jbigi.c
    gcc $LDFLAGS $INCLUDES -o lib/"$_objdir"/libjbigi-linux-none.so jbigi.o
    plain "done"
}

build_jcpuid() {
    msg "Building libjcpuid..."
    cd "$srcdir/contrib/jcpuid"

    _objdir='freenet/support/CPUInformation'
    INCLUDES="-I./include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjcpuid-x86-linux.so"
    gcc $CFLAGS $LDFLAGS $INCLUDES src/jcpuid.c -o lib/"$_objdir"/libjcpuid-${_arch}-linux.so
    plain "done"
}

build_fec() {
    msg "Building onion-fec..."
    cd "$srcdir/contrib/onion-fec/src/csrc"

    CFLAGS+=" -I${JAVA_HOME}/include" \
        make

    _DEST="../../bin/lib/linux-${_arch}"
    mkdir -p "$_DEST"
    cp libfec*.so "$_DEST"
    plain "done"
}

build_db4o() {
    msg "Building db4o..."
    cd "$srcdir/contrib/db4o"
    ln -sf "$srcdir/db4o-7.4/src" .
    ant
    plain "done"
}

build_plugins() {
    for plugin in ${_plugins[@]}; do
        msg "Building Plugin ${plugin}..."
        cd "$srcdir/plugin-${plugin}"
        ant dist \
            -Dfreenet-cvs-snapshot.location=../fred/dist/freenet.jar \
            -Dfreenet-ext.location=../contrib/freenet-ext/dist/freenet-ext.jar \
            -Djunit.location=/usr/share/java/junit.jar \
            -Dtest.skip=true -Djavac.target.version=1.6
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
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf/node,persistent-temp,tmp,plugins/data,user/{data,certs}}

    install -m640 "$srcdir"/{wrapper.config,run.sh}            "$pkgdir"/opt/freenet
    install -m640 "$srcdir"/freenet.ini                        "$pkgdir"/opt/freenet/conf
    install -m640 "$srcdir"/seednodes.fref                     "$pkgdir"/opt/freenet/conf/node
    install -m640 contrib/freenet-ext/dist/freenet-ext.jar \
                  dist/freenet.jar                             "$pkgdir"/opt/freenet/lib

    # plugins
    for plugin in ${_plugins[@]}; do
    install -m640 "$srcdir"/plugin-${plugin}/dist/${plugin}.jar "$pkgdir"/opt/freenet/plugins
    done
    #install -m640 "$srcdir"/WebOfTrust.jar           "$pkgdir"/opt/freenet/plugins

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

# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

_fred=#tag=build01483

_wot=#branch=next
_keyutils=#tag=v5026
_upnp=#tag=10007

_pkgver=0.7.5
_plugins=('WebOfTrust' 'UPnP' 'KeyUtils')

# comment out to run unit tests
BUILDENV+=('!check')

pkgname=freenet
pkgver=0.7.5.1483
pkgrel=1
pkgdesc="An encrypted network without censorship"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'
depends=('java-runtime>=8' 'gmp' 'java-service-wrapper')
makedepends=('java-environment>=8' 'apache-ant' 'gradle' 'git' 'java-hamcrest' 'zip')
checkdepends=('junit')
backup=('opt/freenet/wrapper.config'
        'opt/freenet/conf/freenet.ini')

source=("git+https://github.com/freenet/fred.git${_fred}"
        "git+https://github.com/freenet/plugin-UPnP.git${_upnp}"
        "git+https://github.com/freenet/plugin-KeyUtils.git${_keyutils}"
        "git+https://github.com/freenet/plugin-WebOfTrust.git${_wot}"
        "IpToCountry.dat::http://software77.net/geo-ip/?DL=4"
        "https://github.com/freenet/seedrefs/files/1609768/seednodes.zip"
        'gradle.properties' 'run.sh' 'freenet.service' 'freenet.ini' 'wrapper.config')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0d91d2462f36d35235cc86cbdee11890cadec91a0a01b89d96010924f6c2be99'
            '305d00533d3efcf31dfbb9944c703a9b01227ba38495add70b9bc4849c29498d'
            'a6581d33448c2989ef9f7e888e7e47a8784b0159e76bf8f6bc97eec1d7d55769'
            '434f67e2e86edb555b7dfb572a52d7ff719373989e1f1830f779bfccc678539f'
            'c0ce093a098d91dee6be294f8a2fc929aabad95612f994933194d0da5c4cdd25'
            '609705bafc02048f366711f470bebaf2d4e8c5fa1285b1611719826aef755107')

pkgver() {
    cd "$srcdir/fred"
    echo "${_pkgver}.$(git describe |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd "$srcdir/fred"

    ln -sf "$srcdir/gradle.properties" .
    sed -i "$srcdir/plugin-UPnP/build.xml" \
        -e 's:value="1.5":value="1.8":'
    sed -i "$srcdir/plugin-KeyUtils/build.xml" \
        -e 's:value="1.6":value="1.8":'
}

build() {
    cd "$srcdir/fred"

    export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/default}"
    export GRADLE_USER_HOME="$srcdir"
    export GRADLE_OPTS="-Dfile.encoding=UTF-8"

    msg "Building Freenet..."
    gradle copyRuntimeLibs

    build_plugins
}

build_plugins() {
    export ANT_HOME=/usr/share/ant
    export ANT_OPTS="-Dfile.encoding=UTF-8"

    for plugin in ${_plugins[@]}; do
        msg "Building Plugin ${plugin}..."
        cd "$srcdir/plugin-${plugin}"
        ant dist \
            -Dfreenet-cvs-snapshot.location=../fred/build/output/freenet.jar \
            -Dfreenet-ext.location=../fred/build/output/freenet-ext-29.jar \
            -Dbcprov.location=../fred/build/output/bcprov-jdk15on-1.59.jar \
            -Djna.location=../fred/build/output/jna-4.2.2.jar \
            -Djunit.location=/usr/share/java/junit.jar \
            -Dtest.skip=true
    done
}

check() {
    cd "$srcdir/fred"

    # these tests use alot of memory and can cause OOM's
    rm -f test/freenet/client/async/{*Storage,ClientRequestSelector}Test.java
    gradle test
}

package() {
    cd "$srcdir/fred"

    # delete bundled wrapper
    zip -qd build/output/freenet-ext-29.jar "org/tanukisoftware/*"

    # freenet
    install -dm755 "$pkgdir"/usr/bin
    install -dm700 "$pkgdir"/run/freenet
    install -dm700 "$pkgdir"/opt/freenet/tmp
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf,noderef,persistent-temp,plugins/data,user/{data,certs}}

    install -m640  "$srcdir"/{wrapper.config,run.sh,IpToCountry.dat} "$pkgdir"/opt/freenet
    install -m640  "$srcdir"/freenet.ini                             "$pkgdir"/opt/freenet/conf
    install -m640  "$srcdir"/seednodes/seednodes.fref                "$pkgdir"/opt/freenet/noderef
    install -m640  "$srcdir"/fred/build/output/*.jar                 "$pkgdir"/opt/freenet/lib

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

# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

_fred=#tag=build01484
_wot=#branch=next
_keyutils=#tag=v5026
_upnp=#tag=10007

_pkgver=0.7.5
_plugins=('WebOfTrust' 'UPnP' 'KeyUtils')

# comment out to run unit tests
BUILDENV+=('!check')

pkgname=freenet
pkgver=0.7.5.1484
pkgrel=1
pkgdesc="An encrypted network without censorship"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'
depends=('java-runtime>=8' 'gmp' 'java-service-wrapper')
makedepends=('java-environment>=8' 'java-environment<13' 'apache-ant' 'git' 'zip' 'gradle')
backup=('opt/freenet/wrapper.config'
        'opt/freenet/conf/freenet.ini')

source=("git+https://github.com/freenet/fred.git${_fred}"
        "git+https://github.com/freenet/plugin-UPnP.git${_upnp}"
        "git+https://github.com/freenet/plugin-KeyUtils.git${_keyutils}"
        "git+https://github.com/freenet/plugin-WebOfTrust.git${_wot}"
        "IpToCountry.dat::http://software77.net/geo-ip/?DL=4"
        "https://github.com/freenet/seedrefs/files/1609768/seednodes.zip"
        '0001-strip-non-compile-deps.patch'
        'run.sh' 'freenet.service' 'freenet.ini' 'wrapper.config')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0d91d2462f36d35235cc86cbdee11890cadec91a0a01b89d96010924f6c2be99'
            'd3d2f43e2bdaa93bfaa60fa2c82f6b42fb50539db2ad48e03664b537a4aa8071'
            'a6581d33448c2989ef9f7e888e7e47a8784b0159e76bf8f6bc97eec1d7d55769'
            '434f67e2e86edb555b7dfb572a52d7ff719373989e1f1830f779bfccc678539f'
            'c0ce093a098d91dee6be294f8a2fc929aabad95612f994933194d0da5c4cdd25'
            '30788b1b7856fbcfcfbe6825cd772a22b75cf1d680c2cbfd9b15ef3fc2d0c077')

pkgver() {
    cd "fred"
    printf "%s.%s" "${_pkgver}" \
        "$(git describe --abbrev=0 |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd "fred"

    # Gradle 5.4+ and Java 11 support
    git pull origin pull/658/head
    git apply -v "$srcdir/0001-strip-non-compile-deps.patch"
}

build() {
    cd "fred"

    export GRADLE_USER_HOME="$srcdir/.gradle"

    msg "Building Freenet..."
    gradle -DtargetJavaVersion=$(javac -version 2>&1 |awk '{print $2}') \
           --no-build-cache --no-daemon \
           copyRuntimeLibs

    build_plugins
}

build_plugins() {
    export ANT_HOME=/usr/share/ant

    for plugin in ${_plugins[@]}; do
        msg "Building Plugin ${plugin}..."
        cd "$srcdir/plugin-${plugin}"
        ant dist \
            -Dfile.encoding=UTF-8 \
            -Dtarget-version=8 -Dsource-version=8 \
            -Dfreenet-cvs-snapshot.location=../fred/build/output/freenet.jar \
            -Dfreenet-ext.location=../fred/build/output/freenet-ext-29.jar \
            -Dtest.skip=true
    done
}

check() {
    cd "fred"

    # these tests use alot of memory and can cause OOM's
    #rm -f test/freenet/client/async/{*Storage,ClientRequestSelector}Test.java
    gradle test
}

package() {
    cd "fred"

    # freenet
    install -dm755 "$pkgdir"/usr/bin
    install -dm700 "$pkgdir"/run/freenet
    install -dm700 "$pkgdir"/opt/freenet/tmp
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf,noderef,persistent-temp,plugins/data,user/{data,certs}}

    install -m640  "$srcdir"/{wrapper.config,run.sh,IpToCountry.dat} "$pkgdir"/opt/freenet
    install -m640  "$srcdir"/freenet.ini                             "$pkgdir"/opt/freenet/conf
    install -m640  "$srcdir"/seednodes/seednodes.fref                "$pkgdir"/opt/freenet/noderef
    install -m640  "$srcdir"/fred/build/output/*.jar                 "$pkgdir"/opt/freenet/lib

    # delete bundled wrapper
    zip -qd "$pkgdir"/opt/freenet/lib/freenet-ext-29.jar "org/tanukisoftware/*"

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

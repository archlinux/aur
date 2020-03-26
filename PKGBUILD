# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

_fred=build01485
_wot=next-30
_keyutils=v5026
_upnp=10007
_library=v37-dw-rw3

_plugins=('WebOfTrust' 'UPnP' 'KeyUtils' 'Library')

pkgname=freenet
pkgver=0.7.5.1485
pkgrel=2
pkgdesc="A peer-to-peer platform for censorship-resistant communication and publishing"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'
depends=('java-runtime>=8' 'gmp' 'nss' 'java-service-wrapper')
makedepends=('java-environment>=8' 'ant' 'git' 'zip')
backup=('opt/freenet/wrapper.config'
        'opt/freenet/conf/freenet.ini')

# https://freenetproject.org/assets/keyring.gpg
validpgpkeys=('B30C3D91069F81ECFEFED0B1B41A6047FD6C57F9')

source=("git+https://github.com/freenet/fred.git?signed#tag=$_fred"
        "git+https://github.com/freenet/plugin-KeyUtils.git#tag=$_keyutils"
        "git+https://github.com/freenet/plugin-UPnP.git#tag=$_upnp"
        "git+https://github.com/redwerk/plugin-Library.git#tag=$_library"
        "git+https://github.com/xor-freenet/plugin-WebOfTrust.git#branch=$_wot"
        "git+https://github.com/freenet/seedrefs.git"
        "IpToCountry.dat::http://software77.net/geo-ip/?DL=4"
        'run.sh' 'wrapper.config' freenet.{ini,service,tmpfiles})

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c56b3427ce3df2a9126acf737107738dffeab54d618887743c45a317d39a1b10'
            '9c8a99f7644859f37242465c2646f819c9458c4c0fe8d930db32837ddb2c6daf'
            '1171d0545882e45e03531e760fd28024700bf50400a3e3a13f31deeace8dbb03'
            '10f97306ef75953f20978d3d2aa5d14daa8fa13e4db88e8270ea951239212c20'
            '8f35e9d7d00e4caa26d0c1cbcbcedc9081ed0535d0c67e3f9d2d75c11ff9e847')

pkgver() {
    cd fred
    printf "0.7.5.%s" \
        "$(git describe --abbrev=0 |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd fred

    # Java 14 support
    git pull -r -v https://github.com/skydrome/fred.git gradle-6.3-aur -q

    rm -f seednodes.fref
    for node in "$srcdir"/seedrefs/0* ;do
        printf "%s\n\n" "$(<$node)" >>seednodes.fref
    done
}

build() {
    cd fred

    export ANT_HOME=/usr/share/ant
    export GRADLE_USER_HOME="$startdir/.gradle"
    export GRADLE_OPTS="-Dorg.gradle.internal.launcher.welcomeMessageEnabled=false"

    msg "Building Freenet..."
    ./gradlew \
            -DtargetJavaVersion="$(javac -version 2>&1 |awk '{print $2}')" \
            --no-build-cache --no-daemon \
            copyRuntimeLibs

    for plugin in "${_plugins[@]}"; do
        msg "Building Plugin $plugin..."
        cd "$srcdir/plugin-$plugin"
        ant dist \
            -Dfile.encoding=UTF-8 \
            -Dtarget-version=8 -Dsource-version=8 \
            -Dfreenet-cvs-snapshot.location=../fred/build/output/freenet.jar \
            -Dfreenet-ext.location=../fred/build/output/freenet-ext-29.jar \
            -Dtest.skip=true -Dskip_tests=true
    done
}

package() {
    cd fred

    # create file structure
    install -dm755 "$pkgdir"/usr/bin
    install -dm750 "$pkgdir"/run/freenet
    install -dm750 "$pkgdir"/opt/freenet
    install -dm700 "$pkgdir"/opt/freenet/tmp
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf,noderef,persistent-temp,plugins,user}
    install -dm750 "$pkgdir"/opt/freenet/{plugins/data,user/{data,certs}}

    # install freenet
    install -m755  "$srcdir"/run.sh                           "$pkgdir"/usr/bin/freenet
    install -m640  "$srcdir"/{wrapper.config,IpToCountry.dat} "$pkgdir"/opt/freenet
    install -m640  "$srcdir"/freenet.ini                      "$pkgdir"/opt/freenet/conf
    install -m640  "$srcdir"/fred/seednodes.fref              "$pkgdir"/opt/freenet/noderef
    install -m640  "$srcdir"/fred/build/output/*.jar          "$pkgdir"/opt/freenet/lib

    # install plugins
    for plugin in "${_plugins[@]}"; do
    install -m640 "$srcdir"/plugin-$plugin/dist/$plugin.jar "$pkgdir"/opt/freenet/plugins
    done
    echo "pluginmanager.loadplugin=$(IFS=\;;echo "${_plugins[*]}")" \
        >>"$pkgdir"/opt/freenet/conf/freenet.ini

    # delete bundled wrapper
    zip -qd "$pkgdir"/opt/freenet/lib/freenet-ext-29.jar "org/tanukisoftware/*"

    # systemd
    install -Dm644 "$srcdir"/freenet.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/freenet.conf
    install -Dm644 "$srcdir"/freenet.service  "$pkgdir"/usr/lib/systemd/system/freenet.service

    # license
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/freenet/LICENSE
}

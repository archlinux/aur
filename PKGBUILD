# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributor: Thynix

# detect java version
# javac -version 2>&1 |awk '{split($2,v,"."); print v[1]}'

# TODO: https://github.com/freenet/fred/pull/807

_fred=build01495
_wot=next

_plugins=('WebOfTrust')

pkgname=freenet
pkgver=0.7.5.1495
pkgrel=1
pkgdesc="A peer-to-peer platform for censorship-resistant communication and publishing"
url="https://freenetproject.org"
license=('GPL2')
arch=('any')
install='freenet.install'
depends=('java-runtime>=11' 'nss' 'java-service-wrapper')
makedepends=('java-environment>=11' 'ant' 'git' 'zip')
backup=('opt/freenet/wrapper.config')

# https://freenetproject.org/assets/keyring.gpg
validpgpkeys=('B30C3D91069F81ECFEFED0B1B41A6047FD6C57F9')

source=("git+https://github.com/freenet/fred.git?signed#tag=$_fred"
        "git+https://github.com/freenet/plugin-WebOfTrust.git#branch=$_wot"
        "git+https://github.com/freenet/seedrefs.git"
        'run.sh' 'wrapper.config' freenet.{ini.dist,service,tmpfiles})

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '043589015aced4a9828518db5a7207382c782ff7f0f5bc2c5ad19ff559fc7f695bcd503e717bfb19bee8338abdf0b30f418a155e9c86f5016162ccad4870d82a'
        'ca5e878db039bb683395f3a5587c6c352db57fc4cbdf703ec8deacb9829fe882d8bba9efb008d9f6ea4bd636a3b4dced711d4e1df008d4a94bbf20057c1fc516'
        'dc0c468eb6a691868f17c1dc85e161cec30e318638f8aea14f46e7480943ee146058a546ee578d5d37e9ad74b9394a6ddbbaa5ac00c02553cdd8f790a2b5e2e0'
        '63bf5cd76cea610b362144c207121f9de54febcccf8347c21aecc25382f564292493a8a3b4fd2c7af18ca6feb041978164241d81d77dd1542619482cd7cbadbb'
        '54828750ac0283e4328635bb61d0edd695391d433d85a6612b2288520a58b40b312d5759b38487e093e150aedee3659e6bed3827d936171d2d252aea2cbced1d')

pkgver() {
    cd fred
    printf "0.7.5.%s" \
        "$(git describe --abbrev=0 |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd fred

    # java 19 support
    git pull -r -v https://github.com/skydrome/fred.git gradle-7.6-aur-1 -q

    # create seednodes file for bootstrapping
    rm -f seednodes.fref
    for node in "$srcdir"/seedrefs/0* ;do
        printf "%s\n\n" "$(<$node)" >>seednodes.fref
    done
}

build() {
    cd fred

    export ANT_HOME=/usr/share/ant
    export GRADLE_USER_HOME="$SRCDEST/.gradle"
    export GRADLE_OPTS="-Dorg.gradle.internal.launcher.welcomeMessageEnabled=false"

    msg "Building Freenet..."
    rm -rf build
    ./gradlew --no-build-cache --no-daemon copyRuntimeLibs

    for plugin in "${_plugins[@]}"; do
        msg "Building Plugin $plugin..."
        cd "$srcdir/plugin-$plugin"
        ant dist \
            -Dfile.encoding=UTF-8 \
            -Dtarget-version=11 -Dsource-version=8 \
            -Dfreenet-cvs-snapshot.location=../fred/build/output/freenet.jar \
            -Dfreenet-ext.location=../fred/build/output/freenet-ext-29.jar \
            -Dtest.skip=true -Dskip_tests=true
    done
}

package() {
    cd fred

    # create folder structure
    install -dm755 "$pkgdir"/usr/bin
    install -dm750 "$pkgdir"/opt/freenet
    install -dm700 "$pkgdir"/opt/freenet/tmp
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf,noderef,plugins,user}
    install -dm750 "$pkgdir"/opt/freenet/{plugins/data,user/{data,certs}}

    # install freenet
    install -m755  "$srcdir"/run.sh                           "$pkgdir"/usr/bin/freenet
    install -m640  "$srcdir"/wrapper.config                   "$pkgdir"/opt/freenet
    install -m640  "$srcdir"/freenet.ini.dist                 "$pkgdir"/opt/freenet/conf
    install -m640  "$srcdir"/fred/seednodes.fref              "$pkgdir"/opt/freenet/noderef
    install -m640  "$srcdir"/fred/build/output/*.jar          "$pkgdir"/opt/freenet/lib

    # install plugins
    for plugin in "${_plugins[@]}"; do
    install -m640 "$srcdir"/plugin-$plugin/dist/$plugin.jar "$pkgdir"/opt/freenet/plugins
    done
    echo -e "pluginmanager.loadplugin=$(IFS=\;;echo "${_plugins[*]}")\nEND" \
        >>"$pkgdir"/opt/freenet/conf/freenet.ini.dist

    # delete bundled wrapper
    zip -qd "$pkgdir"/opt/freenet/lib/freenet-ext-29.jar "org/tanukisoftware/*"

    # systemd
    install -Dm644 "$srcdir"/freenet.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/freenet.conf
    install -Dm644 "$srcdir"/freenet.service  "$pkgdir"/usr/lib/systemd/system/freenet.service

    # license
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/freenet/LICENSE
}

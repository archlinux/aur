# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

# detect java version
# javac -version 2>&1 |awk '{split($2,v,"."); print v[1]}'

_fred=build01494
_wot=next

_plugins=('WebOfTrust')

pkgname=freenet
pkgver=0.7.5.1494
pkgrel=1
pkgdesc="A peer-to-peer platform for censorship-resistant communication and publishing"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
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
        '134a273c654c87b7c34d40416944e3e5f80254d68cf30d9a096ca8821cbb42dac0b66bf9ce316515ba6e47876f1221eb3eae4ebf90e2bd2ed8cf77c317d2d4bc'
        '83a374354b4ade822e6ecdc0b08013ac6c1c7dd3071478d4017e998ec031a1f3d0731f76eb8470e36bf8e77f7bbe1310d8d0cf5726929fcc6db81a90cc802d04'
        '540c911bbccea18ed2b5ad22864040b83674833746536e869ec8491974f0265239c7b4c12fb1e43f27126320adc9206d81249c5e0c9e7ce6ef2aeb46b8f9cf5b'
        '54828750ac0283e4328635bb61d0edd695391d433d85a6612b2288520a58b40b312d5759b38487e093e150aedee3659e6bed3827d936171d2d252aea2cbced1d')

pkgver() {
    cd fred
    printf "0.7.5.%s" \
        "$(git describe --abbrev=0 |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd fred

    # java 17 support
    git pull -r -v https://github.com/skydrome/fred.git gradle-7.4-aur -q

    # create seednodes file for bootstrapping
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
    install -dm750 "$pkgdir"/run/freenet
    install -dm750 "$pkgdir"/opt/freenet
    install -dm700 "$pkgdir"/opt/freenet/tmp
    install -dm750 "$pkgdir"/opt/freenet/{downloads,lib,conf,noderef,persistent-temp,plugins,user}
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

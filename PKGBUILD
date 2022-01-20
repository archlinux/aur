# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

# detect java version
# javac -version 2>&1 |awk '{split($2,v,"."); print v[1]}'

_fred=build01492
_wot=next

_plugins=('WebOfTrust')

pkgname=freenet
pkgver=0.7.5.1492
pkgrel=3
pkgdesc="A peer-to-peer platform for censorship-resistant communication and publishing"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'
depends=('java-runtime>=11' 'gmp' 'nss' 'java-service-wrapper')
makedepends=('java-environment>=11' 'ant' 'git' 'zip')
backup=('opt/freenet/wrapper.config')

# https://freenetproject.org/assets/keyring.gpg
validpgpkeys=('B30C3D91069F81ECFEFED0B1B41A6047FD6C57F9')

source=("git+https://github.com/freenet/fred.git?signed#tag=$_fred"
        "git+https://github.com/xor-freenet/plugin-WebOfTrust.git#branch=$_wot"
        "git+https://github.com/freenet/seedrefs.git"
        'run.sh' 'wrapper.config' freenet.{ini.dist,service,tmpfiles})

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '1eb5ed6d92a3ab8a825dd715fd2418c253ef5a431943dc6f0bdf6c70252a2f945ea89d6c0b412cdb7b7898262add0d1dd36050c1be2386a263153608ff7ff791'
        'e4aa6fbd35a0d0fd58b67700c11aa3712371af7889405faf4a49dfd733387b04929a294f5bad8678e328f96eaf4cad227f6b6e4d99e203cfeed616d7383c7c36'
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
    git pull -r -v https://github.com/skydrome/fred.git gradle-7.3-aur -q

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

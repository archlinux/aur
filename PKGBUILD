# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

_fred=build01491
_wot=next

_plugins=('WebOfTrust')

pkgname=freenet
pkgver=0.7.5.1491
pkgrel=1
pkgdesc="A peer-to-peer platform for censorship-resistant communication and publishing"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'
depends=('java-runtime>=8' 'gmp' 'nss' 'java-service-wrapper')
makedepends=('java-environment>=8' 'ant' 'git' 'zip')
backup=('opt/freenet/wrapper.config')

# https://freenetproject.org/assets/keyring.gpg
validpgpkeys=('B30C3D91069F81ECFEFED0B1B41A6047FD6C57F9')

source=("git+https://github.com/freenet/fred.git?signed#tag=$_fred"
        "git+https://github.com/xor-freenet/plugin-WebOfTrust.git#branch=$_wot"
        "git+https://github.com/freenet/seedrefs.git"
        #"IpToCountry.dat::http://software77.net/geo-ip/?DL=4"
        'run.sh' 'wrapper.config' freenet.{ini.dist,service,tmpfiles})

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        #'1eb5ed6d92a3ab8a825dd715fd2418c253ef5a431943dc6f0bdf6c70252a2f945ea89d6c0b412cdb7b7898262add0d1dd36050c1be2386a263153608ff7ff791'
        '4a1f5d25e2ee0dd80cc3c86ecdbedeb738b63eda7495675bbba9beefa9b1176b51ac059c66050ae2c927a93cf169b5715b3e9f7c382c0e70b0a0dbb33494c8aa'
        'eb37bafeca92f454a5e8940667927bdfd1ef880cf33175335054ae4fdb5b4a04d4e977f7d29425d24574e14a6c799c90bb27c8697797ef87a028d0a3a3b039ef'
        '540c911bbccea18ed2b5ad22864040b83674833746536e869ec8491974f0265239c7b4c12fb1e43f27126320adc9206d81249c5e0c9e7ce6ef2aeb46b8f9cf5b'
        '54828750ac0283e4328635bb61d0edd695391d433d85a6612b2288520a58b40b312d5759b38487e093e150aedee3659e6bed3827d936171d2d252aea2cbced1d')

pkgver() {
    cd fred
    printf "0.7.5.%s" \
        "$(git describe --abbrev=0 |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd fred

    # Java 15 support
    git pull -r -v https://github.com/skydrome/fred.git gradle-7.1-aur -q

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

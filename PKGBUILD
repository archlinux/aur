# Maintainer: skydrome <skydrome at@at proton mail dot com>
# Contributors: Thynix

_fred=#tag=build01484
_wot=#branch=next
_keyutils=#tag=v5026
_upnp=#tag=10007

_pkgver=0.7.5
_plugins=('WebOfTrust' 'UPnP' 'KeyUtils')


pkgname=freenet
pkgver=0.7.5.1484
pkgrel=1
pkgdesc="An encrypted network without censorship"
url="https://freenetproject.org"
license=('GPL2')
arch=('i686' 'x86_64')
install='freenet.install'
depends=('java-runtime>=8' 'gmp' 'java-service-wrapper')
makedepends=('java-environment>=8' 'apache-ant' 'git' 'zip')
backup=('opt/freenet/wrapper.config'
        'opt/freenet/conf/freenet.ini')

source=("git+https://github.com/freenet/fred.git${_fred}"
        "git+https://github.com/freenet/plugin-UPnP.git${_upnp}"
        "git+https://github.com/freenet/plugin-KeyUtils.git${_keyutils}"
        "git+https://github.com/freenet/plugin-WebOfTrust.git${_wot}"
        "IpToCountry.dat::http://software77.net/geo-ip/?DL=4"
        "https://github.com/freenet/seedrefs/files/1609768/seednodes.zip"
        '0001-strip-non-compile-deps.patch'
        'run.sh' 'freenet.ini' 'wrapper.config' 'freenet.service' 'freenet.tmpfiles')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0d91d2462f36d35235cc86cbdee11890cadec91a0a01b89d96010924f6c2be99'
            '4b2017c3da5f2dad1bc7aec2a1afb33a8d0a8cbf754f8f8d95cb0bb34f71d2ae'
            '171dc64316dcdafc98ddc0136ed4b14ab2d6688817e9e9c08be97560a38f2879'
            'c0ce093a098d91dee6be294f8a2fc929aabad95612f994933194d0da5c4cdd25'
            '30788b1b7856fbcfcfbe6825cd772a22b75cf1d680c2cbfd9b15ef3fc2d0c077'
            'f03cb422c1b1c068b61092d118838a6f77462e80d78a32cf231146ffcc6b9a7a'
            'f4fa90c9840cfdb62ec384b366ae3472246300ddacca74310e1e06a5c1fb582c')

pkgver() {
    cd "fred"
    printf "%s.%s" "${_pkgver}" \
        "$(git describe --abbrev=0 |sed 's/build0//;s/-/./g')"
}

prepare() {
    cd "fred"

    # Gradle 6 and Java 13 support
    git pull origin pull/683/head
    git apply -v "$srcdir/0001-strip-non-compile-deps.patch"
}

build() {
    cd "fred"

    export GRADLE_USER_HOME="$startdir/.gradle"
    export GRADLE_OPTS="-Dorg.gradle.internal.launcher.welcomeMessageEnabled=false"

    msg "Building Freenet..."
    ./gradlew \
            -DtargetJavaVersion=$(javac -version 2>&1 |awk '{print $2}') \
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

package() {
    cd "fred"

    # freenet
    install -dm755 "$pkgdir"/usr/bin
    install -dm700 "$pkgdir"/run/freenet
    install -dm700 "$pkgdir"/opt/freenet
    install -dm700 "$pkgdir"/opt/freenet/{tmp,downloads,lib,conf,noderef,persistent-temp,plugins,user}
    install -dm700 "$pkgdir"/opt/freenet/{plugins/data,user/{data,certs}}

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
    install -Dm644 "$srcdir"/freenet.tmpfiles   "$pkgdir"/usr/lib/tmpfiles.d/freenet.conf
    install -Dm644 "$srcdir"/freenet.service    "$pkgdir"/usr/lib/systemd/system/freenet.service

    # license
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/freenet/LICENSE
}

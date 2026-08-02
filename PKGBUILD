# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

_appname='jmusicbot-arif'
pkgname="$_appname"
_pkgverUpstream="0.7.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="A cross-platform Discord music bot with a clean interface (Arif's fork)"
arch=('any')
url='https://github.com/arif-banai/MusicBot'
license=('Apache')
depends=('java-runtime-headless>=25')
makedepends=('java-environment>=25' 'maven')
conflicts=('jmusicbot-arif-git' 'jmusicbot' 'jmusicbot-git')
provides=('jmusicbot')
replaces=('jmusicbot')
source=("JMusicBot-${_pkgverUpstream}.tar.gz::https://github.com/arif-banai/MusicBot/archive/refs/tags/v${_pkgverUpstream}.tar.gz"
        "jmusicbot@.service"
        "jmusicbot.service")
sha384sums=('43bba54f161ed648c055860db760651058f08eb390d41686073f6287be641a8166acb4d14396be5cfbed5bfdfc3317bc'
            '2206fe907599447bef54936a16070d6de333d44a3bc4dc532a984662ac43ecb831c29998727f7b0c318fb9f13ed92d23'
            '0626429a1fdf931b4e766ef207ea2a77df854ce509e75b4a8807c240ad7ffdbf7ddb259c8b3b365030bfad8cdc23ca97')

# Build parameters
# Uncomment and edit to build with a specific Java Development Kit
#JAVA_HOME="/usr/lib/jvm/java-25-openjdk"
# Uncomment and edit to use a specific Maven installation
#MVN_HOME="/opt/maven"

build() {
    local buildDir="${srcdir}/MusicBot-${_pkgverUpstream}"

    cd "$buildDir" || return 1

    # Set JAVA_HOME if it is not set
    if test -z ${JAVA_HOME+x}; then
        JAVA_HOME="/usr/lib/jvm/default"
    fi
    export JAVA_HOME
    echo "JAVA_HOME is \"$JAVA_HOME\"" >&2

    # Set MVN_HOME if it is not set
    if test -z ${MVN_HOME+x}; then
        MVN_HOME="/opt/maven"
    fi
    export MVN_HOME
    echo "MVN_HOME is \"$MVN_HOME\"" >&2

    # Build with Maven
    mvn clean
    mvn install
}

package() {
    local buildDir="${srcdir}/MusicBot-${_pkgverUpstream}"
    local jarFileName="JMusicBot-${_pkgverUpstream}-All.jar"
    local jarFileNameUnversioned="JMusicBot.jar"
    local refConfFileName="reference-${_pkgverUpstream}.conf"
    local refConfFileNameUnversioned="reference.conf"

    # Create the required directories
    install --mode=u=rwx,go=rx --directory -- \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/share/jmusicbot" \
        "${pkgdir}/usr/lib/systemd/system" \
        "${pkgdir}/usr/lib/systemd/user"

    # Place the .jar file and create a non-versioned symlink to it
    install --mode=u=rwx,go=rx --target-directory="${pkgdir}/usr/bin" -- "${buildDir}/target/$jarFileName"
    ln --symbolic --relative -- "${pkgdir}/usr/bin/$jarFileName" "${pkgdir}/usr/bin/$jarFileNameUnversioned"

    # Create bash launcher: Default
    echo -n \
"#!/bin/bash
/usr/bin/java -Dfile.encoding=UTF-8 --enable-native-access=ALL-UNNAMED -jar \"/usr/bin/${jarFileNameUnversioned}\" \"\$@\"
"       > "${pkgdir}/usr/bin/jmusicbot"
    chmod -- u=rwx,go=rx "${pkgdir}/usr/bin/jmusicbot"

    # Create bash launcher: Command line only
    echo -n \
"#!/bin/bash
/usr/bin/java -Dfile.encoding=UTF-8 --enable-native-access=ALL-UNNAMED -Dnogui=true -jar \"/usr/bin/${jarFileNameUnversioned}\" \"\$@\"
"       > "${pkgdir}/usr/bin/jmusicbot-nogui"
    chmod -- u=rwx,go=rx "${pkgdir}/usr/bin/jmusicbot-nogui"

    # Place the reference configuration file and create a non-versioned
    # symlink to it
    install --mode=u=rw,go=r -- "${buildDir}/src/main/resources/reference.conf" "${pkgdir}/usr/share/jmusicbot/$refConfFileName"
    ln --symbolic --relative -- "${pkgdir}/usr/share/jmusicbot/$refConfFileName" "${pkgdir}/usr/share/jmusicbot/$refConfFileNameUnversioned"

    # Place the systemd instantiated system service
    install --mode=u=rw,go=r --target-directory="${pkgdir}/usr/lib/systemd/system" -- "${srcdir}/jmusicbot@.service"

    # Place the systemd user service
    install --mode=u=rw,go=r --target-directory="${pkgdir}/usr/lib/systemd/user" -- "${srcdir}/jmusicbot.service"
}

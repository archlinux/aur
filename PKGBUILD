# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

_appname='jmusicbot'
pkgname="$_appname"
_pkgverUpstream="0.4.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="A cross-platform Discord music bot with a clean interface"
arch=('any')
url='https://github.com/jagrosh/MusicBot'
license=('Apache')
depends=('java-runtime-headless>=11')
makedepends=('java-environment>=11' 'maven' 'libxslt')
source=("JMusicBot-${_pkgverUpstream}.tar.gz::https://github.com/jagrosh/MusicBot/archive/refs/tags/${_pkgverUpstream}.tar.gz"
        "fix-pom.xslt"
        "jmusicbot@.service"
        "jmusicbot.service")
sha384sums=('d5fc747230eab289da6a8a44c1a86c38291073ad6bb43c84609bb6d7abcce98cab0f7b636747248e4e53b883e0884ff7'
            'b14dcf390d40f51d40b2aee4e8c44722837ad7a9850ecfd48174c74e8ed50709b6a64a817c301a2186e6386c26de0440'
            '0e2f5b34b17ab99c425712b8e164493538c0d8df45b9d997649dbf6332bbdef7d6ce33e195ed331cf02d132ee2fa7e88'
            'b57c88e240c167debd323399b4144a1f0a566205ccfe54075f06481fe6cfb105f92bc94536575b84bbc1607c102b5e75')

# Build parameters
# Uncomment and edit to build with a specific Java Development Kit
#JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
# Uncomment and edit to use a specific Maven installation
#MVN_HOME="/opt/maven"

build() {
    local buildDir="${srcdir}/MusicBot-${_pkgverUpstream}"

    cd "$buildDir" || return 1

    # Project version in pom.xml is set to "Snapshot"
    # Set it to the upstream version
    xsltproc --nonet --stringparam project-version "$_pkgverUpstream" "${srcdir}/fix-pom.xslt" "pom.xml" > "pom.xml.tmp"
    mv -- "pom.xml" "pom.xml.original"
    mv -- "pom.xml.tmp" "pom.xml"

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
/usr/bin/java -jar \"/usr/bin/${jarFileNameUnversioned}\" \"\$@\"
"                   > "${pkgdir}/usr/bin/jmusicbot"
    chmod -- u=rwx,go=rx "${pkgdir}/usr/bin/jmusicbot"

    # Create bash launcher: Command line only
    echo -n \
"#!/bin/bash
/usr/bin/java -Dnogui=true -jar \"/usr/bin/${jarFileNameUnversioned}\" \"\$@\"
"                   > "${pkgdir}/usr/bin/jmusicbot-nogui"
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

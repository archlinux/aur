# Maintainer: eomanis at web dot de

pkgname='getgarfield'
pkgverUpstream="0.1.3"
pkgver="${pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Java application that downloads all Garfield comic strips"
arch=('any')
url='http://eomanis.mooo.com/permshare/getgarfield/index.xhtml'
license=('GPL3')
depends=('java-runtime-headless>=8' 'bash')
makedepends=('java-environment>=8')
source=("http://eomanis.mooo.com/permshare/getgarfield/getgarfield-${pkgverUpstream}.tar.gz")
sha384sums=('02c766398513f3a1cd02dbcba348bbe5d1ec2535e91f2dc790d92cdb0ffd7f4b579daba45cac453839c926cbfe090e73')

build() {
    local IFS=$'\n'
    
    # Create a clean jar directory representing the contents of the .jar
    # file that is being built
    rm -rf jar
    mkdir -p jar
    # Compile the sources to .class files into jar
    echo "Compiling java sources" >&2
    javac -classpath "" -d jar -encoding UTF-8 -source 8 \
        $(find "${pkgname}-${pkgverUpstream}/src" -type f -name '*.java' -print)
    # Add the other resources to jar, such as the web site templates
    echo "Copying required resources, sources and info files" >&2
    cp --verbose --recursive --target-directory jar \
        "${pkgname}-${pkgverUpstream}/src/getgarfield" \
        "${pkgname}-${pkgverUpstream}/COPYING" \
        "${pkgname}-${pkgverUpstream}/README" \
        1>&2
    
    # Create a versioned runnable .jar file containing the contents of
    # the jar directory and having the program correct entry point
    echo "Creating GetGarfield-${pkgver}.jar" >&2
    jar ce getgarfield.GetGarfield \
        -C jar getgarfield \
        -C jar COPYING \
        -C jar README \
        > "GetGarfield-${pkgver}.jar"
    
    # Create a bash launcher
    echo -n \
'#!/bin/bash
/usr/bin/java -jar "$(dirname "$0")"/GetGarfield.jar "$@"
'       > getgarfield
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    
    # Place the .jar file and create a non-versioned symlink to it
    cp --target-directory . "${srcdir}/GetGarfield-${pkgver}.jar"
    chmod u=rwx,go=rx "GetGarfield-${pkgver}.jar"
    ln -s "/usr/bin/GetGarfield-${pkgver}.jar" "GetGarfield.jar"
    
    # Place the bash launcher
    cp --target-directory . "${srcdir}/getgarfield"
    chmod u=rwx,go=rx "getgarfield"
}

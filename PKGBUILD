# Maintainer: eomanis at web dot de

pkgname='getgarfield'
pkgverUpstream="0.1.2"
pkgver="${pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Java application that downloads all Garfield comic strips"
arch=('any')
url='http://eomanis.mooo.com/permshare/getgarfield/index.xhtml'
license=('GPL3')
depends=('java-runtime-headless>=8' 'bash')
makedepends=('java-environment>=8')
source=("http://eomanis.mooo.com/permshare/getgarfield/getgarfield-${pkgverUpstream}.tar.gz")
sha384sums=('bc2de10986b2dc6a2f303583b791d3b1d05971961e10fdd5efb6b25a3dfc84be6723d271754e2b67fed50f2088ff297c')

build() {
    local IFS=$'\n'
    
    # Create a clean bin directory representing the contents of the .jar
    # file that is being built
    rm -rf bin
    mkdir -p bin
    # Compile the sources to .class files into bin
    echo "Compiling java sources" >&2
    javac -classpath "" -d bin -encoding UTF-8 -source 8 \
        $(find "${pkgname}-${pkgverUpstream}/src" -type f -name '*.java' -print)
    # Add the other resources to bin, such as the web site templates
    echo "Copying required resources" >&2
    cp --verbose --recursive --target-directory bin/getgarfield \
        "${pkgname}-${pkgverUpstream}/src/getgarfield/templates" 1>&2
    # TODO Add COPYING
    # TODO Add README
    
    # Create a versioned runnable .jar file containing the contents of
    # the bin directory and having the program correct entry point
    echo "Creating GetGarfield-${pkgver}.jar" >&2
    jar ce getgarfield.GetGarfield -C bin getgarfield \
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

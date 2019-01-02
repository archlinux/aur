# Maintainer: eomanis at web dot de

pkgname='getgarfield'
pkgverUpstream="0.1.1"
pkgver="${pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Java application that downloads all Garfield comic strips"
arch=('any')
url='http://eomanis.mooo.com/permshare/getgarfield/index.xhtml'
license=('GPL3')
depends=('java-runtime-headless>=8' 'bash')
makedepends=('java-environment>=8')
source=("http://eomanis.mooo.com/permshare/getgarfield/getgarfield-${pkgverUpstream}.tar.gz")
sha384sums=('2a3e859662a7b9fa62581d9670e3adfbb68d16b251e37a34d621f580b3e940235fd63ccb52ce21e1fd3a17a51dee628b')

build() {
    local IFS=$'\n'
    
    # Create a clean bin directory representing the contents of the .jar
    # file that is being built
    rm -rf bin
    mkdir -p bin
    # Compile the sources to .class files into bin
    echo "Compiling java sources" >&2
    javac -classpath "" -d bin -encoding UTF-8 -source 8 \
        $(find src -type f -name '*.java' -print)
    # Add the other resources to bin, such as the web site templates
    echo "Copying required resources" >&2
    cp --verbose --recursive --target-directory bin/getgarfield \
        src/getgarfield/templates 1>&2
    
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

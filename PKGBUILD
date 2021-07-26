# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=ctc
pkgver=1.0.0

pkgrel=10
pkgdesc="CTC -- Cyan Trust Container CLI, frontend for creating CTC trust containers"
arch=( 'any' )
url=""
license=('GPL')
groups=()
depends=( 'java-environment' )
makedepends=( 'gradle>=6.7' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://aerialworks.ddns.net/ASF/Cyan.git")
noextract=()
md5sums=('SKIP')

build() {
    cd Cyan
    rm settings.lite.gradle
    echo "rootProject.name = 'LiteCyan'

include('CCFG')
include('CyanComponents')
include('CyanCore')
include('CyanUtil')
include('MTK')
include('Fluid')
include('MtkCLI')
include('ClassTrust')
include('TrustExplorer')

gradle.allprojects {
    project.ext.liteBuild = true
}
" > settings.lite.gradle
    
    cd CyanComponents
    gradle jar -PnoClient=true -PnoServer=true -PuncheckedClient=true -c ../settings.lite.gradle
    cd ../CyanUtil
    gradle jar -PnoClient=true -PnoServer=true -PuncheckedClient=true -c ../settings.lite.gradle
    cd ../ClassTrust
    gradle jar -PnoClient=true -PnoServer=true -PuncheckedClient=true -c ../settings.lite.gradle
    cd ../TrustExplorer
    gradle jar -PnoClient=true -PnoServer=true -PuncheckedClient=true -c ../settings.lite.gradle
}

package() {
    cd Cyan
    
    mkdir "$pkgdir/usr/lib/ctc-libs/" -p
    cd build/CyanComponents/Jars
    cp CyanComponents-*.jar "$pkgdir/usr/lib/ctc-libs/CyanComponents.jar"
    
    cd ../../CyanUtil/Jars
    rm -rf ../../CyanComponents/Jars
    cp CyanUtil-*.jar "$pkgdir/usr/lib/ctc-libs/CyanUtil.jar"
    
    cd ../../ClassTrust/Jars
    rm -rf ../../CyanUtil/Jars
    cp ClassTrust-*.jar "$pkgdir/usr/lib/ctc-libs/ClassTrust.jar"
    
    cd ../../TrustExplorer/Jars
    rm -rf ../../ClassTrust/Jars
    cp TrustExplorer-*.jar "$pkgdir/usr/lib/ctc-libs/CTC.jar"
    
    cd ../../
    rm -rf ClassTrust/Jars
    cd ../TrustExplorer
    
    mkdir -p "$pkgdir/usr/bin"
    cp ctc "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/ctc"
}

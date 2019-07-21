# Maintainer: aligator <aligator at-symbol suncraft-server dot de>
pkgrel=1
_pkgname='jsettlers'
pkgname=${_pkgname}'-git'

pkgver=0.4.0.alpha.r693.g5576c872d
pkgver() {
  cd  ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
_gradlever='4.6'

arch=('any')
pkgdesc='A Remake of "The Settlers III" for Windows, Linux, Mac and Android'
url='https://github.com/jsettlers/settlers-remake'
license=('MIT')
provides=(${_pkgname})
depends=('java-runtime=8' 'sh')
optdepends=('settlers3-demo-data')
makedepends=('java-environment=8' 'unzip')
install=${pkgname}'.install'
source=("jsettlers::git+https://github.com/jsettlers/settlers-remake.git"
        "https://services.gradle.org/distributions/gradle-${_gradlever}-all.zip")
noextract=("gradle-${_gradlever}-all.zip")
sha512sums=('SKIP'
            '36249d86e5e35d793448960251c9db1be36643ea4846be35e7b9af5c0bed245dac20c4682580c53ff80f6745369cb5dad8dd840a9b00f7b67d1ec563a9e6e106')

prepare() {
  # prepare gradle to use downloaded zip
  sed -i "/distributionUrl=/c\distributionUrl=gradle-${_gradlever}-all.zip" ${srcdir}/${_pkgname}/gradle/wrapper/gradle-wrapper.properties
  mv gradle-${_gradlever}-all.zip ${srcdir}/${_pkgname}/gradle/wrapper
}

build() {
    cd ${srcdir}/${_pkgname}
    
    # build game (without android)
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk" ANDROID_HOME="" ./gradlew --gradle-user-home=. releaseJSettlers || return 1
}

package() {
    _jarDest=${pkgdir}/usr/share/java/${_pkgname}
    _dataDest=${pkgdir}/usr/share/${_pkgname}
    _licenseDest=${pkgdir}/usr/share/licenses/${pkgname}
    bin=${pkgdir}/usr/bin
    
    _progName='JSettlers'
    
    _workingDir='~/.'${_pkgname}
    _mapCreatorName='MapCreator'
    _mapCreatorScript=${_pkgname}'-'${_mapCreatorName,,}
        
    # create destination-dirs
    mkdir -p ${_jarDest} ${_dataDest} ${_licenseDest}
    
    # copy game-files
    cd ${srcdir}/${_pkgname}/release
    unzip -j ${_progName}'.zip' ${_progName}'/'${_progName}'.jar' -d ${_jarDest} 
    unzip -j ${_progName}'.zip' ${_progName}'/'${_mapCreatorName}'.jar' -d ${_jarDest}
    unzip -j ${_progName}'.zip' ${_progName}'/maps/*' -d ${_dataDest}'/maps'
    
    # copy license
    cd ${srcdir}   
    cp ${_pkgname}'/LICENSE.txt' ${_licenseDest}
    
    # create launch-scripts
    mkdir -p ${bin}
    echo '#!/bin/sh' > ${bin}/${_pkgname}
    echo 'cd '${_workingDir} >> ${bin}/${_pkgname}
    echo 'exec /usr/bin/java -jar /usr/share/java/'${_pkgname}'/'${_progName}'.jar --maps=/usr/share/'${_pkgname}'/maps "$@"' >> ${bin}/${_pkgname}
    chmod +x ${bin}/${_pkgname}

    echo '#!/bin/sh' > ${bin}/${_mapCreatorScript}
    echo 'cd '${_workingDir} >> ${bin}/${_mapCreatorScript}
    echo 'exec /usr/bin/java -jar /usr/share/java/'${_pkgname}'/'${_mapCreatorName}'.jar --maps=/usr/share/'${_pkgname}'/maps "$@"' >> ${bin}/${_mapCreatorScript}
    chmod +x ${bin}/${_mapCreatorScript}

    install -Dm644 ../${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ../${_mapCreatorScript}.desktop "${pkgdir}/usr/share/applications/${_mapCreatorScript}.desktop"
    install -Dm644 ${srcdir}/jsettlers/jsettlers.mapcreator/src/main/resources/jsettlers/mapcreator/main/window/icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 ${srcdir}/jsettlers/jsettlers.mapcreator/src/main/resources/jsettlers/mapcreator/main/window/icon.png "${pkgdir}/usr/share/pixmaps/${_mapCreatorScript}.png"
}

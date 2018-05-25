# Maintainer: aligator <aligator at-symbol suncraft-server dot de>
pkgrel=2
_pkgname='jsettlers'
pkgname=${_pkgname}'-git'

pkgver=0.4.0.alpha.r276.g0c7a1979b
pkgver() {
  cd  ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

arch=('any')
pkgdesc='A Remake of "The Settlers III" for Windows, Linux, Mac and Android'
url='https://github.com/jsettlers/settlers-remake'
license=('MIT')
provides=(${_pkgname})
depends=('java-environment' 'sh')
optdepends=('settlers3-demo-data')
makedepends=('jdk8-openjdk' 'unzip')
install=${pkgname}'.install'
source=('jsettlers::git+https://github.com/jsettlers/settlers-remake.git')
sha512sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    
    # build game (without android)
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk" ANDROID_HOME="" ./gradlew releaseJSettlers || return 1
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

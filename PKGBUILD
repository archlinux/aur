# Maintainer: aligator <aligator at-symbol suncraft-server dot de>
pkgrel=1
_pkgname='jsettlers'
pkgname=${_pkgname}'-git'

pkgver=0.5.3.alpha2.r6.g9737816cc
pkgver() {
  cd  ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
_gradlever='7.0.2'

arch=('any')
pkgdesc='A Remake of "The Settlers III" for Windows, Linux, Mac and Android - forked by paulwedeck'
url='https://github.com/paulwedeck/settlers-remake'
license=('MIT')
provides=(${_pkgname})
depends=('java-runtime>=8' 'sh')
optdepends=('settlers3-demo-data')
makedepends=('jdk8-openjdk' 'unzip')
install=${pkgname}'.install'
source=("jsettlers::git+https://github.com/paulwedeck/settlers-remake.git"
        "https://services.gradle.org/distributions/gradle-${_gradlever}-all.zip")
noextract=("gradle-${_gradlever}-all.zip")
sha512sums=('SKIP'
            'd849d272b36b931f77befe54d16ae81e753ecf62499db1d67897f98594158a444c670e290dc77c6d550937b6eaa4144a269b729812979d800afda5b1bf53463d')

prepare() {
  # prepare gradle to use downloaded zip
  sed -i "/distributionUrl=/c\distributionUrl=gradle-${_gradlever}-all.zip" ${srcdir}/${_pkgname}/gradle/wrapper/gradle-wrapper.properties
  mv gradle-${_gradlever}-all.zip ${srcdir}/${_pkgname}/gradle/wrapper
}

build() {
    cd ${srcdir}/${_pkgname}
    
    # build game (without android)
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk" ANDROID_HOME="" ./gradlew --gradle-user-home=. releaseJSettlers || return 1
    # build server
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk" ANDROID_HOME="" ./gradlew --gradle-user-home=. releaseDedicatedServer || return 1
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

    _serverJar='DedicatedJSettlersServer.jar'
    _serverName='Server'
    _serverScript=${_pkgname}'-'${_serverName,,}

    # create destination-dirs
    mkdir -p ${_jarDest} ${_dataDest} ${_licenseDest}
    
    # copy game-files
    cd ${srcdir}/${_pkgname}/release
    unzip -j ${_progName}'.zip' ${_progName}'/'${_progName}'.jar' -d ${_jarDest} 
    unzip -j ${_progName}'.zip' ${_progName}'/'${_mapCreatorName}'.jar' -d ${_jarDest}
    unzip -j ${_progName}'.zip' ${_progName}'/maps/*' -d ${_dataDest}'/maps'
    cp ${_serverJar} ${_jarDest}

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

    echo '#!/bin/sh' > ${bin}/${_serverScript}
    echo 'cd '${_workingDir} >> ${bin}/${_serverScript}
    echo 'exec /usr/bin/java -jar /usr/share/java/'${_pkgname}'/'${_serverJar}' "$@"' >> ${bin}/${_serverScript}
    chmod +x ${bin}/${_serverScript}

    install -Dm644 ../${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ../${_mapCreatorScript}.desktop "${pkgdir}/usr/share/applications/${_mapCreatorScript}.desktop"
    install -Dm644 ${srcdir}/jsettlers/jsettlers.mapcreator/src/main/resources/jsettlers/mapcreator/main/window/icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 ${srcdir}/jsettlers/jsettlers.mapcreator/src/main/resources/jsettlers/mapcreator/main/window/icon.png "${pkgdir}/usr/share/pixmaps/${_mapCreatorScript}.png"
}

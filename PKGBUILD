# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=qtjambi
pkgver=6.4.1
_pkg2="$(echo ${pkgver} | cut -d. -f-2)" 
_pkg1="$(echo ${pkgver} | cut -d. -f1)"
##change these variables if needed##
_qtver=qt6
_javaver=19
####################################
pkgrel=2
pkgdesc="QtJambi is Qt bindings for the Java programming language originally developed by Trolltech"
arch=(x86_64)
url="https://github.com/OmixVisualization/qtjambi"
license=('LGPL' 'GPL')
depends=('chrpath' 'jdk-openjdk' "${_qtver}-base" "${_qtver}-remoteobjects")
makedepends=('ant' 'apache-ant-contrib')
source=(https://github.com/OmixVisualization/qtjambi/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=(280e9f49b11cfbe3fb5461e5a21f2c52aedd903596ea97ac312e1b3eeca4e90b) 

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    #generate fake qtdir. 
    #Build expects directory structure from QT installer.
    rm -rf qtdir #clean up from older build
    mkdir -p qtdir/include
    for i in {bin,qml,plugins,mkspecs}; do
        ln -s "/usr/lib/${_qtver}/$i" qtdir/$i
    done
    #Hack: qtdir/include need to contain qt6 dir from /usr/include/qt6
    # and the content of /usr/include/qt6 because weird cpp issues
        cp -r /usr/include/${_qtver} qtdir/include/${_qtver}
        cp -r /usr/include/${_qtver}/* qtdir/include/
    #end hack
    ln -s qtdir/bin qtdir/libexec
    ln -s /usr/lib qtdir/lib
    ln -s "/usr/share/${_qtver}/modules" qtdir/modules
    #this should enable use of system qt

}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    export QTDIR="${srcdir}/${pkgname}-${pkgver}/qtdir"
    export JAVA_HOME_TARGET="/usr/lib/jvm/java-${_javaver}-openjdk"
	ant all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/share/java/qtjambi
    install ${pkgver}/deployment/*.jar ${pkgdir}/usr/share/java/qtjambi/
    install ${pkgver}/deployment/native/linux-x64/release/plugins/sqldrivers/*.jar ${pkgdir}/usr/share/java/qtjambi/
    mkdir -p ${pkgdir}/usr/{lib,bin}
    install ${pkgver}/deployment/native/linux-x64/release/utilities/*.so ${pkgdir}/usr/lib/
    install ${pkgver}/deployment/native/linux-x64/release/lib/* ${pkgdir}/usr/lib/
    install ${pkgver}/deployment/native/linux-x64/release/plugins/sqldrivers/*.so ${pkgdir}/usr/lib/
    install ${pkgver}/deployment/native/linux-x64/release/utilities/QtJambiLauncher ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/licenses/qtjambi
    cp LICENSE.* ${pkgdir}/usr/share/licenses/qtjambi/

    #libraries get installed as copies instead of as symlinks. Fix up
    cd ${pkgdir}/usr/lib
    for i in {libQtJambi{,3D{Animation,Core,Extras,Input,Logic,Quick{,Extras,Scene2D},Render},Bluetooth,Charts,\
        Concurrent,Core,DBus,DataVisualization,Designer,Gui,Help,HttpServer,Multimedia{,Widgets},Network{,Auth},\
        Nfc,OpenGL,{,Widgets},Pdf{,Widgets},Positioning,PrintSupport,Qml,Quick{,3D,Controls2,Test,Widgets}.\
        RemoteObjects,Scxml,Sensors,Serial{Bus,Port},SpatialAudio,Sql,StateMachine,Svg{,Widgets},Test,TextToSpeech,\
        UIC,UiTools,VirtualKeyboard,Web{Channel,Engine{Core,Quick,Widgets},Sockets,View},Widgets,Xml}; do
        for j in {${_pkg2},${_pkg1}}; do
            rm ${i}.so.${j}
            ln -s ${i}.so.${pkgver} ${i}.so.${j}
        done
    done
    #Hopefully will this ugly hack only be temporary...
}

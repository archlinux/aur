# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=mingw-w64-awesomebump-git
pkgver=5.1.1.r2.gf9fad16
pkgrel=1
pkgdesc="A free program designed to generate normal, height, specular or ambient occlusion textures from a single image (mingw-w64)"
arch=('any')
url="https://github.com/kmkolasinski/AwesomeBump"
license=('LGPL3')
depends=('mingw-w64-crt')
conflicts=('mingw-w64-awesomebump')
provides=('mingw-w64-awesomebump')
makedepends=('mingw-w64-mesa-demos' 'mingw-w64-qt5-base-static' 'mingw-w64-qt5-location-static' 'mingw-w64-qt5-script-static' 'mingw-w64-qt5-svg-static' 'qt5-base' 'git' 'wget' 'unzip')
source=("${pkgname}::git+${url}.git#branch=Release"
        "awesomeBump.sh"
        "master.zip"::https://github.com/kmkolasinski/QtnProperty/archive/master.zip)
md5sums=('SKIP'
         '2e54f4408b6295a779db7f0cc1a72ebc'
         '6969a020373ee8d614b959a296f36470')
         
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
options=('!strip' '!buildflags' 'staticlibs')
noextract=("master.zip")

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/^Linuxv//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  for _arch in ${_architectures}; do
    # TODO use actual git submodule
    cd ${srcdir}/${pkgname}
    cd Sources/utils/QtnProperty
    cp ${srcdir}/master.zip .
    unzip master.zip
    rm master.zip 
    mv -f QtnProperty-master/* .
    rm -r QtnProperty-master    
    cd ../../../
    
    ${_arch}-qmake-qt5 ./AwesomeBump.pro CONFIG+="gl330 static"
    # Generate makefiles
    make clean
    # TODO HACK fix project so it uses native binary
    sed -i 's+bin-win/QtnPEG.exe+bin-linux/QtnPEG+g' Sources/Makefile.Release
    # fix undefined references
    sed -i 's|-lfreetype -lbz2 -lharfbuzz|-lharfbuzz -lfreetype -lharfbuzz -lfreetype -lbz2|g' Sources/Makefile.Release
    make ${MAKEFLAGS}
    
    mkdir ${_arch}-bin
    cp -r ./Bin/* ${_arch}-bin/
    
    cp -vr workdir/linux-g++-gl3/bin/AwesomeBump.exe ./${_arch}-bin/AwesomeBump.exe
    
    make clean
    
    rm .qmake.stash
    rm Makefile
    rm Sources/Makefile
    
    rm -r Sources/utils/QtnProperty
    mkdir Sources/utils/QtnProperty
  done
}

package() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    install -dm755 "${pkgdir}/usr/${_arch}/bin"
    
    cp --preserve=mode -r ${pkgname}/${_arch}-bin/* "${pkgdir}/usr/${_arch}/bin"
    
    cp "awesomeBump.sh" ${_arch}-awesomebump
    sed -i "s/_REPLACEME_/${_arch}/g" ${_arch}-awesomebump
    install -Dm755 ${_arch}-awesomebump "${pkgdir}/usr/bin/${_arch}-awesomebump"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/AwesomeBump.exe"
  done
  
}

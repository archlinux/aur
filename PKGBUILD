# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=wavedrom-editor
pkgver=1.6.2
pkgrel=1
pkgdesc="Timing diagram rendering engine"
arch=('x86_64')
url="http://wavedrom.com"
license=('MIT')

# For some reason, stripping the nwjs binary breaks the app
options=('!strip')

sha256sums_x86_64=('SKIP'
                   '1aef8354a3bf9714aab32595f27b142034332cb4e3a7381d3fd133a2937fd579'
                   'c8cf2a7f6626452bb10eef4f8b4b02bf1992e360e93857a90b2ed7212044f1e2')

source_x86_64=("${pkgname}-${pkgver}::git+https://github.com/wavedrom/wavedrom.github.io.git#tag=v${pkgver}"
               "http://dl.nwjs.io/v0.27.3/nwjs-v0.27.3-linux-x64.tar.gz"
               "wavedrom-editor.desktop"
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Implement build-wde.sh
    mkdir src
    rm -rf src/*

    mkdir src/images
    mkdir src/skins
    mkdir src/css
    mkdir src/scripts

    cp editor.js src/
    cp init.js src/
    cp editor.html src/
    cp tutorial.html src/
    cp WaveDromEditor/package.json src/
    cp wavedrom.min.js src/

    cp images/ic_*.png src/images/
    cp images/favicon.ico src/images
    cp images/logo.png src/images
    cp skins/* src/skins
    cp css/* src/css
    cp scripts/* src/scripts

    #wget https://raw.githubusercontent.com/drom/simple-nwjs-app/master/build.sh -O build.sh
    #bash build.sh --name wavedrom-editor --version v1.6.2

    # Implement build.sh
    NWV="v0.27.3"
    V="${pkgver}"
    N="${pkgname}"
    P="linux-x64"

    mkdir -p build
    rm -rf build/*

    # make app
    pushd src && zip -r ../build/"$N"-$V.nw * && popd

    mkdir -p cache
    rm -rf cache/*/*
     
    tar -xvf ${srcdir}/nwjs-$NWV-$P.tar.gz -C cache

    # clean cache
    mkdir -p cache/"$N"-$V-$P
    rm -rf cache/"$N"-$V-$P/*
    cp -R cache/nwjs-$NWV-$P/* cache/"$N"-$V-$P

    # pack APP packages
    cat cache/"$N"-$V-$P/nw build/"$N"-$V.nw > cache/"$N"-$V-$P/"$N"
    chmod +x cache/"$N"-$V-$P/"$N"
    rm  cache/"$N"-$V-$P/nw
    #pushd cache && tar -cvzf ../build/"$N"-$V-$P.tar.gz "$N"-$V-$P/* && popd
}

#
# TODO: Placing the entire node-webkit build in /opt feels dirty if we just
#       built the package, but scattering it around /usr feels worse.  Is there
#       a recommended psuedo-webapps convention?
#
package() {
    # Copy build files
	mkdir -p ${pkgdir}/opt
	cp -a ${srcdir}/${pkgname}-${pkgver}/cache/${pkgname}-${pkgver}-linux-x64 ${pkgdir}/opt/${pkgname}
    
    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/wavedrom-editor/wavedrom-editor ${pkgdir}/usr/bin/wavedrom-editor

    # Create desktop icon
    mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/wavedrom-editor.desktop" "$pkgdir/usr/share/applications/wavedrom-editor.desktop"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/images/icon_512.png" "$pkgdir/usr/share/pixmaps/wavedrom-editor.png"
}

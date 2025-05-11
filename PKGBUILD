# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=wavedrom-editor
pkgver=3.5.0
pkgrel=1
pkgdesc="Timing diagram rendering engine"
arch=('x86_64')
url="http://wavedrom.com"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('zip')

# For some reason, stripping the nwjs binary breaks the app
options=('!strip')

sha256sums_x86_64=('06577b9003acf60bd4af367338843d44f2ba96e6c5649d9e2f0c24820b8f5183'
                   'c8cf2a7f6626452bb10eef4f8b4b02bf1992e360e93857a90b2ed7212044f1e2')

source_x86_64=("https://github.com/wavedrom/wavedrom.github.io/archive/v${pkgver}.tar.gz"
               "wavedrom-editor.desktop"
)

_srcdir_name=wavedrom.github.io-${pkgver}

# Re-implement the downlaoded build.sh script while dropping support for other platforms
# Upstream: https://raw.githubusercontent.com/drom/simple-nwjs-app/master/build.sh
build_sh() {
    local NWVERSION="v0.44.4"
    local V="v1.0.0"
    local N="simpleapp"
    local PREFIX=""
    local P="linux-x64"

    # command line arguments
    while [[ $# -gt 1 ]]
    do
    key="$1"

    case $key in
      -n|--name)
      N="$2"
      shift
      ;;
      -p|--prefix)
      PREFIX="$2"
      shift
      ;;
      -w|--nwversion)
      NWVERSION="$2"
      shift
      ;;
      -v|--version)
      V="$2"
      shift
      ;;
      *)
      ;;
    esac
    shift
    done

    URL="http://dl.nwjs.io/"$NWVERSION
    NWV=$PREFIX$NWVERSION

    urlget() {
        if ! [ -f "$2" ]; then
            if hash wget 2>/dev/null; then
                wget "$1" -O "$2"
            elif hash curl 2>/dev/null; then
                curl "$1" -o "$2"
            else
                echo "wget or curl must be installed."
                exit 1
            fi
        fi
    }

    mkdir -p build

    rm -rf build/*

    # make app
    pushd src && zip -r ../build/"$N"-$V.nw * && popd

    mkdir -p cache
    rm -rf cache/*/*

    # get and unpack NWJS packages
    urlget $URL/nwjs-$NWV-$P.tar.gz cache/nwjs-$NWV-$P.tar.gz
    tar -xvf cache/nwjs-$NWV-$P.tar.gz -C cache

    # clean cache
    mkdir -p cache/"$N"-$V-$P
    rm -rf cache/"$N"-$V-$P/*
    cp -R cache/nwjs-$NWV-$P/* cache/"$N"-$V-$P

    # pack APP packages
    cat cache/"$N"-$V-$P/nw build/"$N"-$V.nw > cache/"$N"-$V-$P/"$N"
    chmod +x cache/"$N"-$V-$P/"$N"
    rm  cache/"$N"-$V-$P/nw
    pushd cache && tar -cvzf ../build/"$N"-$V-$P.tar.gz "$N"-$V-$P/* && popd
}

build_wde_sh() {
    # Implement build-wde.sh
    cp node_modules/wavedrom/wavedrom.min.js WaveDrom.js
    cp node_modules/wavedrom/wavedrom.min.js wavedrom.min.js
    cp node_modules/wavedrom/skins/*.js skins

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
    cp node_modules/wavedrom/wavedrom.min.js src/

    cp images/ic_*.png src/images/
    cp images/favicon.ico src/images
    cp images/logo.png src/images
    cp node_modules/wavedrom/skins/* src/skins
    cp css/* src/css
    cp scripts/* src/scripts

    #curl https://raw.githubusercontent.com/drom/simple-nwjs-app/master/build.sh -o build.sh
    #bash build.sh --name wavedrom-editor --version v2.3.2
    build_sh --name ${pkgname} --version v${pkgver}
}

prepare() {
    cd "${srcdir}/${_srcdir_name}"
    # This would be nice... npm install --production
    npm install
}

build() {
    cd "${srcdir}/${_srcdir_name}"

    # Running `npm run build` as we expect would download and build for osx, windows, ia32 and maybe more.
    build_wde_sh
}

#
# TODO: Placing the entire node-webkit build in /opt feels dirty if we just
#       built the package, but scattering it around /usr feels worse.  Is there
#       a recommended psuedo-webapps convention?
#
package() {
    # Copy build files
	mkdir -p ${pkgdir}/opt
	cp -a ${srcdir}/${_srcdir_name}/cache/${pkgname}-v${pkgver}-linux-x64 ${pkgdir}/opt/${pkgname}
    
    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/wavedrom-editor/wavedrom-editor ${pkgdir}/usr/bin/wavedrom-editor

    # Create desktop icon
    mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/wavedrom-editor.desktop" "$pkgdir/usr/share/applications/wavedrom-editor.desktop"
    install -m644 "${srcdir}/${_srcdir_name}/images/icon_512.png" "$pkgdir/usr/share/pixmaps/wavedrom-editor.png"
}

# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.4.9
pkgrel=2
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=(i686 x86_64)
url="https://popcorntime.app/"
license=(GPL3)
depends=(gtk3 libxss nss ttf-font)
makedepends=(git npm yarn)
optdepends=('net-tools: vpn.ht client')
options=('!strip')
#install="popcorntime.install"
# Needed variables for sources downloads
# Commit ref updated on date: 2021-10-19
# Plain version tag (e.g. v0.4.9)
_commit_hash="tag=v${pkgver}"
_pkgname="popcorn-desktop"

# NW.js version to use while building
#_nwjs="0.44.1" # e.g. 0.31.5
# Missing dependencies to install
#_missing_deps="underscore@~1.8.3"

# Build-related stuff
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_srcdir="${_pkgname}"
_bpath="${_srcdir}/build/Popcorn-Time/${_platform}"

# Get sources only here
source=(
    "${_pkgname}::git+https://github.com/popcorn-official/${_pkgname}/#${_commit_hash}"
    "popcorntime.desktop"
    "gulp-fixes.patch"
)
sha256sums=('SKIP'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334'
            '99c485d7b00ae1f4820e43149d6c93aff7c9b1f40d407beef369bc757688144a')

# Building the package
prepare() {
    cd "${srcdir}/${_srcdir}"

    echo "--> Apply Gulpfile fixes ..."
    git apply "$srcdir/gulp-fixes.patch"

    # Thanks to Eschwartz for the tip! yarn edition
    export YARN_CACHE_FOLDER="$srcdir/npm_cache"

    #msg2 "Patching wrong packages versions, if any ..."
    # Keeping this as example, in case needed in the future
    #msg "Patching Vodo provider (butter-provider-vodo)..."
    #sed -E 's|(.*vodo.*)",|\1#f61e70217711b4a29ff50618d28e8d4170d63fe5",|' -i package.json

    # Actually install the stuff
    echo "--> Installing normal dependencies"
    yarn install

    echo "-->Install missing dependencies, if any ..."
    # Here specific version of the packages will be installed
    for package in $_missing_deps
    do
        echo "-->Installing missing dependency $package"
        yarn install "$package"
    done

    # Change NW.js version, if defined
    if [ -n "$_nwjs" ]
    then
        echo "-->Changing NW.js version to $_nwjs ..."
        sed -i "s|\(const nwVersion = '\)[0-9.]\+|\1$_nwjs|" gulpfile.js
    fi
}

build() {
    # Re-set all the needed information
    export YARN_CACHE_FOLDER="$srcdir/npm_cache"

    cd "${srcdir}/${_srcdir}"

    yarn build
}

package() {
    cd "${srcdir}/${_bpath}"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    cp -a . "${pkgdir}/usr/share/${pkgname}"

    install -Dm644 "${srcdir}/${_srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
    chmod +x "${pkgdir}/usr/share/${pkgname}/Popcorn-Time"

    ln -s "/usr/share/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"
}

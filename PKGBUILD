# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.10
pkgrel=10
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="https://popcorntime.sh/"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'libnotify' 'libxss' 'libxtst' 'nss' 'ttf-font')
makedepends=('npm' 'bower' 'gulp' 'git')
optdepends=('net-tools: vpn.ht client')
options=('!strip')
#install="popcorntime.install"
# Needed variables for sources downloads
_commit_hash="commit=be800aa98cb9ef16f7e00737bbc51ba69204ed8f"
#_commit_hash="branch=master"
_pkgname="popcorn-desktop"

# Useful variables for builds
_nwjs="0.32.4"
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_srcdir="${_pkgname}"
_bpath="${_srcdir}/build/Popcorn-Time/${_platform}"
# Dependencies to install
# natives: solves some builds problems with gulp < 4
# See: https://github.com/gulpjs/gulp/issues/2162#issuecomment-384380989, read all the thread
_missing_deps="natives@1.1.4 bufferutil@3.0.5"

# Get sources only here
source=(
    "${_pkgname}::git+https://github.com/popcorn-official/popcorn-desktop/#${_commit_hash}"
    "gulp-fixes.patch"
    "popcorntime.desktop"
)
source_i686=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$_nwjs/$_nwjs-linux-ia32.zip")
source_x86_64=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$_nwjs/$_nwjs-linux-x64.zip")
sha256sums=('SKIP'
            'fa2615680bcb591b9892e8d6394235436ffa65210be6e942b8ca91de982e8cd2'
            'b4df915286753c1155b67015b89b68df6d3c655daf8832286370afe4d334fd89')
sha256sums_i686=('ab90d8c157abe8156bc0a1503cda8a52eb006eb5c7a664e22c6f006b1f3d76e1')
sha256sums_x86_64=('4aebfb88ca4efd80672fd94528af51021f7e792637fbe0e5401f8a4ab07c74f2')

# Building the package
prepare() {
    cd "${srcdir}/${_srcdir}"

    # Using a different folder for the cache, makes the system cleaner
    # Thanks to Eschwartz for the tip!
    export npm_config_cache="$srcdir/npm_cache"
    msg2 "npm cache changed to `npm config get cache`"

    #msg2 "Set up the \$PATH to allow npm-installed executables..."
    #export PATH="$PWD/node_modules/.bin:$PATH"

    msg2 "Patching wrong packages versions, if any ..."
    # Obviously, when I try to update Node software, some dev makes big updates.
    # These are from less than a week ago; just fetch the old working version
    #msg "Patching Vodo provider (butter-provider-vodo)..."
    #sed -E 's|(.*vodo.*)",|\1#f61e70217711b4a29ff50618d28e8d4170d63fe5",|' -i package.json

    # Actually install the stuff
    msg2 "Installing normal dependencies"
    npm install #-dd install

    msg2 "Install missing dependencies, if any ..."
    # Build is almost always broken with newer NPMs. Install a good one and use it
    for package in $_missing_deps
    do
        msg2 "Installing missing dependency $package"
        npm install "$package"
    done

    # Use upstream nw.js, to avoid possible binary malware
    sed -i "s|get.popcorntime.sh/repo/nw|dl.nwjs.io|" gulpfile.js
    # And use latest version of nw.js
    sed -i "s|\(const nwVersion = '\)[0-9.]\+|\1$_nwjs|"   gulpfile.js
    # Fix problems with the dependecies list function with newer npm versions
    patch -Np1 -i "$srcdir/gulp-fixes.patch"
}

build() {
    cd "${srcdir}/${_srcdir}"

    gulp build
}

package() {
    cd "${srcdir}/${_bpath}"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    find . -type f -exec install -D {} ${pkgdir}/usr/share/${pkgname}/{} \;
    # Remove customly installed npm, if any
    for package in $_missing_deps
    do
        local package_path=`echo $package | sed 's|@.*||'`
        rm -rf "${pkgdir}/usr/share/${pkgname}/node_modules/$package_path"
    done

    # Install the FFmpeg library with additional codecs
    install -Dm644 "${srcdir}/libffmpeg.so" "${pkgdir}/usr/share/${pkgname}/lib/libffmpeg.so"

    install -Dm644 "${srcdir}/${_srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
    chmod +x "${pkgdir}/usr/share/${pkgname}/Popcorn-Time"

    ln -s "/usr/share/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"
}

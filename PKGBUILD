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
pkgrel=5
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.sh/"
license=('GPL3')
makedepends=('npm' 'bower' 'gulp' 'git')
depends=('alsa-lib' 'gconf' 'gtk2' 'libnotify' 'libxss' 'libxtst' 'nss' 'ttf-font')
optdepends=('net-tools: vpn.ht client')
options=('!strip')
#install="popcorntime.install"
# Needed variables for sources downloads
_commit_hash="commit=9e25e9f004bcab070cdecb201ba89da539b2f780"
#_commit_hash="branch=master"

_pkgname="popcorn-desktop"
source=(
    "${_pkgname}::git+https://github.com/popcorn-official/popcorn-desktop/#${_commit_hash}"
    "popcorntime.desktop"
)
sha256sums=('SKIP'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334')

# Useful variables for builds
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_srcdir="${_pkgname}"
_bpath="${_srcdir}/build/Popcorn-Time/${_platform}"

# Building the package
prepare() {
    cd "${srcdir}/${_srcdir}"

    msg2 "Installing npm, bower and missing dependencies..."
    # Using a different folder for the cache, makes the system cleaner
    _cache=`npm config get cache`
    npm config set cache "$srcdir/npm_cache"
    msg2 "Cache changed from $_cache to `npm config get cache`"

    msg2 "Install missing dependencies, if any"
    # Build is almost always broken with newer NPMs. Install a good one and use it
    missing_deps="npm@5.3"
    for package in $missing_deps
    do
        msg2 "Installing missing dependency $package"
        npm install "$package"
    done

    msg2 "Set up the \$PATH to allow npm-installed executables..."
    export PATH="$PWD/node_modules/.bin:$PATH"

    msg2 "Patching wrong packages versions..."
    msg "Patching Vodo provider (butter-provider-vodo)..."
    # Obviously, when I try to update Node software, some dev makes big updates.
    # These are from less than a week ago; just fetch the old working version
    sed -E 's|(.*vodo.*)",|\1#f61e70217711b4a29ff50618d28e8d4170d63fe5",|' -i package.json

    # Actually install the stuff
    msg2 "Installing normal dependencies"
    npm install #-dd install

    # Restore the cache directory
    npm config set cache ${_cache}
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
    rm -rf "${pkgdir}/usr/share/${pkgname}/node_modules/npm"

    install -Dm644 "${srcdir}/${_srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
    chmod +x "${pkgdir}/usr/share/${pkgname}/Popcorn-Time"

    ln -s "/usr/share/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"
}

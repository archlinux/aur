# Maintainer: Bet4 <0xbet4@gmail.com>

# Special thanks to the following people that provided the
# original PKGBUILD from hyper (https://aur.archlinux.org/packages/hyper/)
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

_pkgname=hyper
pkgname=${_pkgname}-git
pkgver=3.1.0.canary.4.r783.gbb5635cb
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
makedepends=('git' 'npm' 'yarn' 'python')
provides=(${_pkgname})
conflicts=(${_pkgname})

source=(
    "$pkgname::git+https://github.com/vercel/${_pkgname}.git"
    "disable-auto-update.diff"
    "https://raw.githubusercontent.com/vercel/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)
sha256sums=('SKIP'
         '980f7405ca85e4e540a15a0c2325fb2b5a8290f0baedf1c934816898ae11f463'
         'a928049af63f49dd270a26c7099dccbe038124e4195507919f2d062e5cd2ecaa'
         'ae29bd930c822c3144817a0e2fe2e2a8253fde90d31b0e19ad7880cd35609ebf')

pkgver() {
    cd "${pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git tag -d v3.1.0-canary.3
    patch -p1 < ../disable-auto-update.diff

    # yarn is a build-dep according to the README
    yarn install
}

build() {
    cd "$pkgname"

    # This build command is the same as the one defined in package.json via
    # npm run dist except that it doesn't build for debian, rpm, etc. and
    # doesn't require some other dependencies

    # add node_modules binaries to PATH
    oldpath=$PATH
    PATH=$(pwd)/node_modules/.bin:$PATH

    yarn run build &&
    cross-env BABEL_ENV=production babel target/renderer/bundle.js \
        --out-file target/renderer/bundle.js \
        --no-comments \
        --minified &&
    electron-builder --linux --dir

    PATH=$oldpath
}

package() {
    cd "$pkgname"

    _appdir="/usr/lib/$_pkgname"
    _libinstall="$pkgdir$_appdir"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$_pkgname/resources/bin/hyper" hyper

    install -Dm644 "$srcdir/Hyper.desktop" "$pkgdir/usr/share/applications/Hyper.desktop"
    install -Dm644 "$srcdir/Hyper-Mark-120@3x.png" "$pkgdir/usr/share/pixmaps/hyper.png"
}

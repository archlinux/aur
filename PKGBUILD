# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: ahrs <Forward dot to at hotmail dot co dot uk>

# Special thanks to the following people that provided the
# original PKGBUILD from hyper (https://aur.archlinux.org/packages/hyper/)
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

pkgname=hyper-git
pkgver=3.0.0.canary.8.r0.gfadc2f05
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
depends=('nodejs' 'electron' 'gconf')
makedepends=('git' 'npm' 'yarn' 'python2')
conflicts=('hyperterm')
replaces=('hyperterm')
backup=()

# You can set HYPER_BRANCH to master (or another branch) e.g
# export HYPER_BRANCH=master
if [[ -z "$HYPER_BRANCH" ]]
then
  export HYPER_BRANCH="canary"
fi

source=(
    "$pkgname::git+https://github.com/zeit/${pkgname/-git/}.git#branch=$HYPER_BRANCH"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)
noextract=()
md5sums=('SKIP'
         'f3481e14cba331160339b3b5ab78872b'
         '74cb7ba38e37332aa8300e4b6ba9c61c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"

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

    npm run build &&
    cross-env BABEL_ENV=production babel \
        --out-file app/renderer/bundle.js \
        --no-comments \
        --minified app/renderer/bundle.js &&
    command build --linux --dir             # need to use command because the
                                            # function name is build

    PATH=$oldpath
}

package() {
    cd "$pkgname"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/hyper" hyper

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .

    install -Dm644 "$srcdir/Hyper.desktop" "$pkgdir/usr/share/applications/Hyper.desktop"
    install -Dm644 "$srcdir/Hyper-Mark-120@3x.png" "$pkgdir/usr/share/pixmaps/hyper.png"
}

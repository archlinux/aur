# Maintainer: jasch <jasch dot io at protonmail dot com>
pkgname=quiet-git
pkgver=r279.d60aea7
pkgrel=6
pkgdesc="libquiet library"
arch=('x86_64')
url="https://github.com/quiet/quiet"
license=('BSD')
groups=()
depends=('jansson' 'portaudio' 'liquid-dsp-quiet-devel-git')
makedepends=('git' 'gcc' 'make' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('staticlibs')
install=
source=("git+$url.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
	# cd "$srcdir/${pkgname%-VCS}"
# }

build() {
	cd "$srcdir/${pkgname%-git}"
    build_path="$srcdir/${pkgname%-git}/build"

    if [ ! -d "$build_path" ]; then
        mkdir "$build_path"
    fi

    cd "$build_path"
    echo "BUILD PATH: $build_path"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make
}

#check() {
	# cd "$srcdir/${pkgname%-VCS}"
	# make -k check
#}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

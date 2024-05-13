# Maintainer: Salamandar <felix@piedallu.me>

pkgname='python-fretwork-git'
_gitname='fretwork'
pkgver=0.5.0.r37.c195f40
pkgrel=1
pkgdesc=" Shared code for FoFiX and FoF:R"
arch=('any')
url="https://github.com/fofix/$_gitname.git"
license=('GPL')
groups=('games')

makedepends=('git' 'python-setuptools')
depends=(
    'python' 'python-gobject'
    'sdl12_compat' 'sdl_mixer'
    'libogg' 'libvorbis' 'libtheora' 'soundtouch'
)

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "%s.%s" "$( set -o pipefail
        git describe --long --tags 2>/dev/null \
            | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
            | sed -r 's/.([0-9,a-g,A-G]{7}.*)//' ||
        printf "r%s" "$(git rev-list --count HEAD)"
    )" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_gitname"
    sed -i 's|pypandoc.convert(|pypandoc.convert_file(|' setup.py
}

build() {
    cd "$_gitname"
    python setup.py build
}

package() {
    cd "$_gitname"
    python setup.py install --root="$pkgdir" --optimize=1
}

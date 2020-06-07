# Maintainer: Henry0w hwelles@protonmail.com

pkgname=instant-meshes-git
_pkgname=instant-meshes
pkgver=r46.7b31608
pkgrel=1
epoch=
pkgdesc="Interactive field-aligned mesh generator"
arch=('x86_64')
url="https://github.com/wjakob/instant-meshes"
license=('BSD')
groups=()
depends=('zenity' 'hicolor-icon-theme')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/wjakob/instant-meshes.git" 
    "datasets::https://instant-meshes.s3.eu-central-1.amazonaws.com/instant-meshes-datasets.zip" 
    "instant-meshes.desktop"
)
noextract=()
md5sums=('SKIP'
         'a282b3d0849c213fc342fe6c181cb6d6'
         '3f9bd04b74972df7b4105082bef7a5df')
validpgpkeys=()

prepare() {
    cd "$_pkgname"

    git submodule update --init --recursive
}

build() {
    cd "$_pkgname"
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        -Wint-in-bool-context \
        .
    make
    
    
}

#check() {
    
#}

package(){
    cd "$_pkgname"
    install -Dm777 'Instant Meshes' "$pkgdir/usr/lib/$_pkgname/$_pkgname"
    mkdir "$pkgdir/usr/bin"
    ln -sfr "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/instant-meshes" 
    chmod +rwx "$pkgdir/usr/bin/$_pkgname"
    mkdir "$pkgdir/usr/lib/$_pkgname/datasets"
    for i in "$srcdir/datasets/"*; do
        install -Dm644 $i "$pkgdir/usr/lib/$_pkgname/datasets/"
    done

    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

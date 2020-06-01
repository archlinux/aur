# Maintainer: Henry0w hwelles@protonmail.com

pkgname=slate
pkgver=0.9.0
_pkgname=$pkgname-$pkgver
pkgrel=2
epoch=
pkgdesc="A qt-based purpose-built pixel art editor"
arch=('any')
url="https://github.com/mitchcurtis/slate"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-declarative')
makedepends=('cmake' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/mitchcurtis/slate/archive/v0.9.0.tar.gz"
)
noextract=()
md5sums=('b2726cbb51ff314f5adefc3a891ce228')
validpgpkeys=()

prepare() { 
    sed -i "s/Icon=slate/Icon=slate.svg/g" "$_pkgname/app/Slate.desktop"
    echo "Exec=slate" >> "$_pkgname/app/Slate.desktop"
    sed -i "s/TryExec=Slate/TryExec=slate/g" "$_pkgname/app/Slate.desktop"
    cd $_pkgname
    git init 
}

build() {
    cd $_pkgname
    CPPFLAGS+=" ${CXXFLAGS}"
    cmake -Wno-dev .
    cmake --build .
    # make -C "${_pkgname}/build" all
}
package() {
    # bin 
    install -Dm777 "${_pkgname}/app/app" "$pkgdir/usr/lib/slate/slate"
    mkdir -p "$pkgdir/usr/bin"
    
    ln -sr "$pkgdir/usr/lib/slate/slate" "$pkgdir/usr/bin/slate"
    
    # Translations
    for f in "$_pkgname"/translations/*.ts; do
        install -Dm644 "$f" "$pkgdir/usr/lib/slate/"
    done
    # Images
    mkdir -p "$pkgdir"/usr/lib/slate/images
    for f in "$_pkgname"/app/images/*.png; do
        install -Dm644 "$f" "$pkgdir/usr/lib/slate/images/"
    done
    for f in "$_pkgname"/app/images/*.svg; do
        install -Dm644 "$f" "$pkgdir/usr/lib/slate/images/"
    done
    # Desktop entry
    install -Dm644 "$_pkgname/app/Slate.desktop" "$pkgdir/usr/share/applications/slate.desktop"
    # Icon
    install -Dm644 "$_pkgname/app/images/logo/slate-icon.svg" "$pkgdir/usr/share/icons/slate.svg"
    # License
    install -D -m644 "${_pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


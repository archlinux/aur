# Maintainer: Henry0w <henry0w at henry0w dot com>

pkgname=slate-git
pkgver=r1005.326d6d4
_pkgname=slate
pkgrel=1
epoch=
pkgdesc="A qt-based purpose-built pixel art editor"
arch=('any')
url="https://github.com/mitchcurtis/slate"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-declarative')
makedepends=('git' 'qbs')
checkdepends=()
optdepends=()
provides=('slate')
conflicts=('slate')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "$_pkgname::git+https://github.com/mitchcurtis/slate.git"
)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() { 
    sed -i "s/Icon=slate/Icon=slate.svg/g" "$_pkgname/app/Slate.desktop"
    echo "Exec=slate" >> "$_pkgname/app/Slate.desktop"
    sed -i "s/TryExec=Slate/TryExec=slate/g" "$_pkgname/app/Slate.desktop"
    cd "$_pkgname"
    git submodule update --init
}

build() {
    cd $_pkgname
    CPPFLAGS+=" ${CXXFLAGS}"
    qbs config:release
    # make -C "${_pkgname}/build" all
}
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    # bin 
    install -Dm777 "${_pkgname}/release/install-root/usr/local/Slate" "$pkgdir/usr/lib/slate/slate"
    install -Dm777 "${_pkgname}/release/install-root/usr/local/libslate.so" "$pkgdir/usr/lib/slate/libslate.so"
    mkdir -p "$pkgdir/usr/bin"
    
    ln -sr "$pkgdir/usr/lib/slate/slate" "$pkgdir/usr/bin/slate"
    mkdir -p "$pkgdir/usr/lib/slate/translations"
    # Translations
    for f in "$_pkgname/release/install-root/usr/local/translations/"*; do
        install -Dm644 "$f" "$pkgdir/usr/lib/slate/translations"
    done
    install -Dm644 "$_pkgname/release/install-root/usr/local/share/applications/Slate.desktop" "$pkgdir/usr/share/applications/slate.desktop"
    # Icon
    install -Dm644 "$_pkgname/release/install-root/usr/local/share/icons/hicolor/scalable/apps/slate-icon-web.svg" "$pkgdir/usr/share/icons/slate.svg"
    # License
    install -D -m644 "${_pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}


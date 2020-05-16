# Maintainer: Henry0w hwelles@protonmail.com

pkgname=slate
pkgver=0.9.0
_pkgname=$pkgname
pkgrel=1
epoch=
pkgdesc="A qt-based pixel art editor"
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
    "$_pkgname::git+https://github.com/mitchcurtis/slate.git#tag=v$pkgver"
)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() { 
    sed -i "s/Icon=slate/Icon=slate.svg/g" $_pkgname/app/Slate.desktop
    echo "Exec=Slate" >> $_pkgname/app/Slate.desktop
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
    install -Dm777 ${_pkgname}/app/app $pkgdir/usr/lib/slate/slate
    mkdir -p $pkgdir/usr/bin
    ln -s $pkgdir/usr/lib/slate/slate $pkgdir/usr/bin/Slate
    # Translations
    for f in $_pkgname/translations/*.ts; do
        install -Dm644 "$f" $pkgdir/usr/lib/slate/
    done
    # Images
    mkdir -p $pkgdir/usr/lib/slate/images
    for f in $_pkgname/app/images/*.png; do
        install -Dm644 "$f" $pkgdir/usr/lib/slate/images/
    done
    for f in $_pkgname/app/images/*.svg; do
        install -Dm644 "$f" $pkgdir/usr/lib/slate/images/
    done
    # Desktop entry
    install -Dm644 "$_pkgname/app/Slate.desktop" $pkgdir/usr/share/applications/slate.desktop
    # Icon
    install -Dm644 "$_pkgname/app/images/logo/slate-icon.svg" $pkgdir/usr/share/icons/slate.svg
    # License
    install -D -m644 "${_pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}


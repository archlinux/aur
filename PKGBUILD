# Maintainer: Jacqueline Fisher <jcfisher@reality-overwritten.net>
_pkgname="relabsd"
pkgname="relabsd-git"
provides=("relabsd")
conflicts=("relabsd")
pkgver=r56.3e76054
pkgrel=1
pkgdesc="Turns your input devices into joysticks by converting relative axes into absolute ones."
url="https://github.com/nsensfel/relabsd"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libevdev' 'udev')
makedepends=('git' 'cmake>=3.0')
source=("$_pkgname-$pkgver::git+https://github.com/nsensfel/relabsd.git"
        "CMakeLists.patch")
sha512sums=('SKIP'
            '2e4150f973b366c501ce488a93818c61be264d7ca3b945744afd8e7906c7cf5e175455c25558423386e8a1dce49f37679b40d498773d7c4079acc030f1961cb7')

pkgver() {
  cd "$_pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch --forward --strip=1 < ../CMakeLists.patch
}

build() {
	cmake -B build -S "${_pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
	cmake --build build
}


package() {
    install -dm755 "$pkgdir/usr/share/relabsd/conf"
    
    cp -r "${_pkgname}-$pkgver/conf/" "$pkgdir/usr/share/relabsd/"
    chmod -R 0644 "$pkgdir/usr/share/relabsd/conf/"
    chmod 0755 "$pkgdir/usr/share/relabsd/conf/"
    
    install -Dm755 build/relabsd "${pkgdir}/usr/bin/relabsd"
    install -Dm644 ${_pkgname}-$pkgver/udev.rules "${pkgdir}/etc/udev/rules.d/40-relabsd.rules"
    install -Dm644 ${_pkgname}-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

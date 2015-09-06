_pkgname=urho3d
pkgname=${_pkgname}-git
pkgver=1.4.r455.ga3e0072-1
pkgrel=1
pkgdesc="Urho3D is a free lightweight, cross-platform 2D and 3D game engine implemented in C++ and released under the MIT license. This is git version of this package."
arch=('i686' 'x86_64')
url="http://urho3d.github.io"
license=('MIT')
depends=("libx11" "libgl" "libxrandr")
makedepends=('git' 'cmake')
conflicts=("$_pkgname")
replaces=("$_pkgname")
source=(git+https://github.com/urho3d/Urho3D.git)
md5sums=('SKIP')
install=urho3d-git.install

pkgver() {
	cd "./${_pkgname}"
	git describe --long | sed -r "s/^${pkgname%-git}-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

provides=("$_pkgname=$pkgver")

build() {
    mkdir -p "$srcdir/Urho3D/build"
    cd "$srcdir/Urho3D/build"
    cmake "$srcdir/Urho3D/" -DCMAKE_INSTALL_PREFIX="/usr" -DURHO3D_USE_LIB_DEB=1 -DURHO3D_SAMPLES=1
    make
}

package() {
    cd "$srcdir/Urho3D/build"
    make DESTDIR="$pkgdir/" install
	cd "$pkgdir/usr/bin"
	mv "./Editor.sh" "./urho3d-editor.sh"
}

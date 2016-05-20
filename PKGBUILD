# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=gazebo-sitl-git
pkgver=r1.bc1e6f1
pkgrel=1
pkgdesc="A ROS-independent Gazebo plugin for Ardupilot's SITL."
arch=('x86' 'x86_64')
url="https://github.com/01org/gazebo-sitl.git"
license=('Apache-2.0')
groups=()
depends=('mavproxy-git' 'gazebo')
makedepends=('git' 'python2') #ardupilot
provides=("${pkgname%-git}" "gzsitl")
source=('gazebo-sitl::git+https://github.com/01org/gazebo-sitl.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    git submodule update --init
    mkdir -p gzsitl/build
}

build() {
	cd "$srcdir/${pkgname%-git}/gzsitl/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
#	make DESTDIR="$pkgdir/" install
    mkdir -p $pkgdir/usr/lib/gazebo-7/plugins
    mkdir -p $pkgdir/usr/share/gazebo-7/{worlds,models}
    cp gzsitl/build/libgzsitl_plugin.so "$pkgdir/usr/lib/gazebo-7/plugins/"
    cp world/gzsitl_drone_target.world "$pkgdir/usr/share/gazebo-7/worlds/"
    cp -r models/gzsitl_target "$pkgdir/usr/share/gazebo-7/models/"
}

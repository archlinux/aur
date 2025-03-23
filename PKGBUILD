# Maintainer: southjy <southjy@crimp.dev>

pkgname=i3-pager-git
pkgver=r158.a30baba
pkgrel=3
pkgdesc="Plasmoid pager for integrating i3 with KDE Plasma   "
arch=("any")
url="https://github.com/duvholt/i3-pager"
license=("GPLv3")
groups=()
depends=("libsigc++-3.0")
makedepends=("git" "extra-cmake-modules")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/duvholt/i3-pager.git"
        "git+https://github.com/drmgc/i3ipcpp.git")
noextract=()
md5sums=("SKIP"
         "SKIP")

pkgver() {
	cd "$srcdir/i3-pager"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/i3-pager"

  git submodule init
  git config submodule.i3ipc++.url "$srcdir/i3ipcpp"
  git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/i3-pager"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DKDE_INSTALL_LIBDIR=lib \
            -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
            -DCMAKE_BUILD_TYPE=Release \
            -B build
    make -C build
}

package() {
	cd "$srcdir/i3-pager"

	make -C build DESTDIR="$pkgdir/" install
}

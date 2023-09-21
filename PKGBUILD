# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-f0plugins-git
pkgver=r37.3692532
pkgrel=1
pkgdesc="redFrik's SuperCollider plugins"
arch=('any')
url="https://github.com/redFrik/f0plugins"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git')
optdepends=()
conflicts=("supercollider-f0plugins")
source=("$pkgname"::git+$url.git)
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
                SC_SRC="/usr/share/supercollider-headers"

                cd "$srcdir/$pkgname"
                git submodule update --init --recursive

                mkdir build; cd build
                DEST="$pkgdir/usr/share/SuperCollider/Extensions"
                cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$DEST ..
                make
}

package() {
        cd "$srcdir/$pkgname/build"
        cmake --build . --config Release --target install
}

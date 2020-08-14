# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime-git
_pkgname=lemon-lime
pkgver=0.2.2.8.r265.131a89f
pkgrel=1
epoch=1
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=(x86_64)
url="https://github.com/iotang/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-tools' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja')
checkdepends=()
optdepends=('gcc: C and C++ support'
            'fpc: Pascal support'
            'java-environment: Java support'
            'freebasic: BASIC support'
            'python: Python support')
provides=("lemon-lime")
conflicts=("lemon-lime")
replaces=()
backup=()
options=()
install=
changelog=
source=('Project_LemonLime::git+https://github.com/iotang/Project_LemonLime.git'
		'SingleApplication::git+https://github.com/itay-grudev/SingleApplication.git'
		)
noextract=()
sha512sums=('SKIP'
            'SKIP'
            )
validpgpkeys=()

pkgver() {
	cd "$srcdir/Project_LemonLime"
# Git, tags available
	#printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
    printf "%s.%s.r%s.%s" $(cat ./makespec/VERSION) $(cat ./makespec/BUILDVERSION) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)

}

prepare() {
	cd "$srcdir/Project_LemonLime"
    git submodule init
    submodules=('SingleApplication')
    for module in ${submodules[@]}; do
        git config submodule."3rdparty/$module".url "${srcdir}/$module"
    done
    
    git submodule update
}

build() {
	cd "$srcdir/Project_LemonLime"
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-GNinja \
		-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DLEMON_BUILD_INFO="Build for Arch Linux" \
		-DLEMON_BUILD_EXTRA_INFO="Build on $(uname -a | cut -d " " -f3,13)"
	ninja

}

package() {
	cd "$srcdir/Project_LemonLime"
	ninja install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}

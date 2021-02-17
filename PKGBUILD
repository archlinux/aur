# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=lemon-lime-git
_pkgname=lemon-lime
pkgver=0.3.0.dev118.r391.0023c4e
pkgrel=1
epoch=1
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=('x86_64' 'i686')
url="https://github.com/Project-LemonLime/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools' 'cmake' 'ninja')
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
source=('Project_LemonLime::git+https://github.com/Project-LemonLime/Project_LemonLime.git'
		'SingleApplication::git+https://github.com/itay-grudev/SingleApplication.git'
		'Testlib-for-Lemons::git+https://github.com/GitPinkRabbit/Testlib-for-Lemons.git'
		)
noextract=()
b2sums=('SKIP'
        'SKIP'
        'SKIP'
            )
validpgpkeys=()

pkgver() {
	cd "$srcdir/Project_LemonLime"
# Git, tags available
	#printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
	__versuffix=$(cat ./makespec/VERSIONSUFFIX)
    printf "%s.%s%s.r%s.%s" $(cat ./makespec/VERSION) ${__versuffix##-} $(cat ./makespec/BUILDVERSION) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)

}

prepare() {
	cd "$srcdir/Project_LemonLime"
    git submodule init
    submodules=('SingleApplication')
    for module in ${submodules[@]}; do
        git config submodule."3rdparty/$module".url "${srcdir}/$module"
    done

	git config submodule."assets/Testlib-for-Lemons".url "${srcdir}/Testlib-for-Lemons"

    git submodule update
}

build() {
	cd "$srcdir/Project_LemonLime"
	cmake . \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-GNinja \
		-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DLEMON_BUILD_INFO="Build for Arch Linux (Git Version)" \
		-DLEMON_BUILD_EXTRA_INFO="Build on $(uname -a | cut -d " " -f3,13)" \
		-DEMBED_TRANSLATIONS=OFF \
		-DEMBED_DOCS=OFF
	ninja

}

package() {
	cd "$srcdir/Project_LemonLime"
	ninja install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}

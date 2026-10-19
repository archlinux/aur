# Maintainer: cenky <cenkkgl@gmail.com>

pkgname=akyuu
_pkgname=akyuu
pkgver=0.1.1
_commit=df4452622ed5b40d18888ef46c27cd0f8d8e9a79  # v0.1.1
pkgrel=1
pkgdesc="Anime list tracker with media player and web browser detection"
arch=('x86_64')
url="https://github.com/ligneo/akyuu"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'systemd-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'git' 'qt6-tools')
_submodules=(anime-relations anisthesia anitomy nstd semaver utf8proc)
source=("$_pkgname::git+https://github.com/ligneo/akyuu.git#commit=$_commit"
        "$_pkgname-anime-relations::git+https://github.com/erengy/anime-relations.git#commit=51aa60e27f75baf95f522ed8abebf08e35b6d5b8"
        "$_pkgname-anisthesia::git+https://github.com/ligneo/anisthesia.git#commit=38c1472785d58797ca9717108a6b687820965a02"
        "$_pkgname-anitomy::git+https://github.com/ligneo/anitomy.git#commit=dbe7169aaf3a4b3f2a4af40dd156f6e91811df2f"
        "$_pkgname-nstd::git+https://github.com/erengy/nstd.git#commit=a8c5ff1bf46b1dfd7a2d98f2516bdeb81942c55a"
        "$_pkgname-semaver::git+https://github.com/erengy/semaver.git#commit=8775c316a8ebd204cf322eadc778459b99e8d49f"
        "$_pkgname-utf8proc::git+https://github.com/JuliaStrings/utf8proc.git#commit=e5e799221b45bbb90f5fdc5c69b6b8dfbf017e78")
# Git sources use SKIP; each one is pinned to a commit, the submodules to the ones v0.1.1 records.
sha256sums=('856fa2d3f0e4a1f777115c0cb5a904053e3c0b4376ae2dae26c206f7b0f2803d'
            '9b69c2d94ae28c12647e3d1ebb2c238ff9ae16626483656f2fe8d6747a742f78'
            '73f2598e65349876713d382e904cf263013dc844e07f049c82164b0b49b89bd0'
            '240b177000691eba2be682cfd232e3c14b4e8e70af50bba269a5ed4b13bd77ff'
            '7b7a92b750c5940ec8cc500a964526bcedad6e7a6d51ca6f877f767e5178017f'
            '116831f7cc655779914254c1ca65c31dc9356f79ed2a5042c5604d4df022fddb'
            '97f05a7ce1fd416c896fde94a12b658a27635bbebc3d60c4129db19f6bf53ac1')

prepare() {
	cd "$_pkgname"
	# Each submodule comes from its own source above, so makepkg can cache and verify it
	local _submodule
	for _submodule in "${_submodules[@]}"; do
		git submodule init "deps/$_submodule"
		git config "submodule.$_submodule.url" "$srcdir/$_pkgname-$_submodule"
		git -c protocol.file.allow=always submodule update "deps/$_submodule"
	done
}

build() {
	cd "$_pkgname"
	# Qt keeps __FILE__ in the log context, so without this the build directory ends up inside
	# the binary and makepkg reports "Package contains reference to $srcdir".
	export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/$_pkgname=."

	cmake -S . -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DAKYUU_PORTABLE=OFF
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
# Maintainer: yum13241 <coolcrew45 at disroot dot org>

pkgname=obsidian-level-maker-unstable
pkgver=21.20250407 # Obsidian v21
_pkgver=$(echo ${pkgver} | sed s/[.]/-/g) # replace dot with dash for URL
pkgrel=3
pkgdesc="Random level generator for classic FPS titles, unstable version."
arch=('x86_64')
url="https://obsidian-level-maker.github.io"
license=('GPL-2.0-only')
groups=()
depends=('libx11' 'fltk')
makedepends=('git' 'cmake')
provides=("oblige-obsidian" "obsidian-level-maker")
conflicts=("oblige-obsidian" "obsidian-level-maker")
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/obsidian-level-maker/Obsidian/archive/refs/tags/Obsidian-v${_pkgver}.tar.gz" "obsidian.desktop")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP' 'SKIP')

prepare()
{
	mkdir -p "$srcdir/usr/share/obsidian"
	cd "$srcdir"/usr/share/obsidian
}

pkgver()
{
	printf $(git ls-remote --tags https://github.com/obsidian-level-maker/Obsidian.git | sed 's/^Obsidian-v//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^[^=:]*[=v]//' | tail -n 1)
}

build()
{
	tar -xvf "${pkgname}-${pkgver}.tar.gz" -C "$srcdir/usr/share/obsidian" --strip-components=1
	cd "$srcdir/usr/share/obsidian"
	curl -o CMakePresets.json https://raw.githubusercontent.com/obsidian-level-maker/Obsidian/refs/heads/obsidian/CMakePresets.json -L

	# Gross hack to patch the code to compile
	sed -i 's/fl_input_str/fl_input/g' "$srcdir/usr/share/obsidian/source/m_dialog.cc"

	# Modern build method, CMakePresets.json is present
	#cmake --preset dist -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_CXX_FLAGS=-Wno-format-security -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
	#cmake --build --preset dist 

	# Classic build, no CMakePresets.json
	cmake -B build -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_CXX_FLAGS=-Wno-format-security
	cmake --build build
}

package()
{
	install -Dm644 obsidian.desktop "${pkgdir}/usr/share/applications/obsidian.desktop"
	cp -dr $srcdir/usr/share/obsidian "${pkgdir}/usr/share/obsidian/"
}

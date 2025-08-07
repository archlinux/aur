# Maintainer: Kimiblock Moe

# Taken from aur/fjordlauncher
# Maintainer: Evan Goode <mail@evangoo.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=fjordlauncher-portable
pkgver=9.4.0
pkgrel=1
pkgdesc="Prism Launcher fork with support for alternative auth servers, sandboxed by portable"
arch=('x86_64')
url='https://github.com/unmojang/FjordLauncher'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  gcc-libs
  java-runtime
  libgl
  qt6-base
  qt6-5compat
  qt6-svg
  qt6-imageformats
  qt6-networkauth
  quazip-qt6
  zlib
  hicolor-icon-theme
  tomlplusplus
  cmark
  openal
  glfw
  flite
)
makedepends=(cmake extra-cmake-modules git jdk17-openjdk scdoc ghc-filesystem gamemode desktop-file-utils git)
optdepends=(
	'visualvm: Profiling support'
	'xorg-xrandr: for older minecraft versions')
source=(
	"git+https://github.com/unmojang/FjordLauncher.git"
	{lionshead,batch,mdi}.license
	portable-config
	start.sh)
sha256sums=('SKIP'
            '2ee3ba8d96e9882150783b6444651ea4a65d779532ecac8646f2ecd3a48c2770'
            '009e25d32aab6dbae193aac4b82fa1a26cb07f288225b2906da425a0f219bc4c'
            '32646946afc31ef5a4ce2cbb5a5a68a9f552c540a78ef23344c51c3efca58fa6'
            'edecb01c8e33eb806980c065cc006d93d6ed304b8c210617ba2466bad177a7ca'
            'ff4d8a8c9eb7a5d6ba44caee9c59da459ed141339e3ba857e4577bc9855a8b61')

function prepare() {
	cd FjordLauncher
	git submodule init
	git submodule update --init --recursive --depth 1
}

function build() {
	cd FjordLauncher
	export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
	cmake -DCMAKE_BUILD_TYPE= \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DLauncher_BUILD_PLATFORM="archlinux" \
		-DLauncher_QT_VERSION_MAJOR="6" \
		-Bbuild -S.
	cmake --build build
}

function check() {
	cd FjordLauncher/build
	ctest .
}

function package() {
	depends+=(portable)
	# licenses
	install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/
	cd FjordLauncher/build
	DESTDIR="$pkgdir" cmake --install .
	mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
		"${pkgdir}/usr/share/mime/packages/fjordlauncher-modrinth-mrpack-mime.xml"

	install -Dm755 \
		"${srcdir}/portable-config" \
		"${pkgdir}/usr/lib/portable/info/org.unmojang.FjordLauncher/config"
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=org.unmojang.FjordLauncher portable -- %U' \
		"${pkgdir}/usr/share/applications/org.unmojang.FjordLauncher.desktop"
	install -Dm755 \
		"${pkgdir}/usr/bin/fjordlauncher" \
		"${pkgdir}/usr/lib/fjordlauncher-portable/fjordlauncher"
	rm -f "${pkgdir}/usr/bin/fjordlauncher"
	install -Dm755 \
		"${srcdir}/start.sh" \
		"${pkgdir}/usr/bin/fjordlauncher"
}


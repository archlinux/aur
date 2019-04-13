# Maintainer: Tomáš Vyčítal <tom.vycital@gmail.com>
# Contributor: McModder <mcmodder@mcmodder.ru>
# Adapted from the PKGBUILD of openttd-git by McModder <mcmodder@mcmodder.ru>

# list of available versions: https://github.com/OpenTTD/OpenTTD/tags
gittag=1.9.1
pkgver=${gittag//[^0-9.a-zA-Z]/_}
pkgrel=2
pkgname="openttd-$gittag"
pkgdesc='An engine for running Transport Tycoon Deluxe (multiple versions of side by side)'
arch=('i686' 'x86_64')
url='http://openttd.org'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
optdepends=(
	'openttd-opengfx: free graphics'
	'openttd-opensfx: free soundset'
	'timidity++: for in-game music'
	'allegro4: to launch the game with -v allegro'
)
makedepends=('git')

reponame='openttd'

source=("$reponame::git+https://github.com/OpenTTD/OpenTTD.git#tag=${gittag}")
sha256sums=('SKIP')

build() {
	cd ${reponame}

	# http://site.icu-project.org/download/61#TOC-Migration-Issues
	CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

	./configure \
		--prefix-dir="/usr" \
		--binary-name="${pkgname}" \
		--binary-dir="bin" \
		--data-dir="share/${pkgname}" \
		--install-dir="${pkgdir}" \
		--doc-dir="share/doc/${pkgname}" \
		--menu-name="OpenTTD ${pkgver}" \
		--personal-dir=".${pkgname}"

	make
}

package() {
	cd ${reponame}

	# Makefile.bundle will fail if where will be no readme.txt
	if [[ ! -e readme.txt ]]; then
		cp README.md readme.txt
	fi

	make install
}

# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai-git"
pkgrel=1
pkgver=$(git ls-remote https://github.com/DisableGraphics/Korai.git | grep refs/heads/main | cut -f 1)
pkgdesc="Fast, reliable and feature-packed manga and comics reader (fresh from the git master branch)"
arch=("any")
conflicts=("korai")
url='https://github.com/DisableGraphics/Korai'
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=("git+https://github.com/DisableGraphics/Korai")
md5sums=("SKIP")
prepare()
{
	cd ${srcdir}
	# Since the git repo would be downloaded as "Korai" instead of "Korai-git",
	# we need to rename it to "Korai-git" so that the build() function can find it.
	if [ ! -d ${srcdir}/${pkgname^} ]; then
		ln -s Korai ${pkgname^}
	fi
}
build() {
	
	cd ${srcdir}/${pkgname^}
	meson setup build
	meson compile -C build
}
package() {

	install -Dm755 ${pkgname^}/build/korai "${pkgdir}/usr/bin/korai"
	install -Dm755 ${pkgname^}/build/libsavepos.so "${pkgdir}/usr/share/korai/korai-extensions/savepos.so"

	install -Dm755 ${pkgname^}/src/icon.png "${pkgdir}/usr/share/icons/korai.png"

	install -Dm755 ${pkgname^}/src/korai.desktop "${pkgdir}/usr/share/applications/korai.desktop"
	pip install --upgrade mangadex-downloader
	echo "Korai requires mangadex-downloader (only available using pip) to download MangaDex manga directly" 
}


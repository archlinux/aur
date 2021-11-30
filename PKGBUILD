# Maintainer: Shane Brown <contact at shanebrown dot ca>

pkgname=('librewolf-extension-return-youtube-dislike-git')
_gitname="return-youtube-dislike"
pkgver=r133.f44f22e
pkgrel=1
pkgdesc='open-source extension that returns the YouTube dislike count'
url=https://github.com/Anarios/return-youtube-dislike
arch=('any')
license=('GPL')
makedepends=('web-ext')
provides=('librewolf-extension-return-youtube-dislike')
conflicts=('librewolf-extension-return-youtube-dislike')
groups=('librewolf-addons')
source=("git://github.com/Anarios/return-youtube-dislike.git"
		"insert_addon_id.patch")
sha256sums=('SKIP'
            '81a0e6980a1fe85f28a49c07ea1a2c9ead66c5e18341cbdf11fc7d5d7e835dad')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Inserting addon ID into manifest required for librewolf to load built addon
	patch -u "$_gitname/Extensions/firefox/manifest.json" -i insert_addon_id.patch
}

build() {
	cd "$_gitname/Extensions/firefox"
	web-ext --no-input -n returnyoutubedislike.xpi build
}

package() {
  cd "$_gitname/Extensions/firefox/web-ext-artifacts"
  install -Dm644 returnyoutubedislike.xpi \
    "$pkgdir"/usr/lib/librewolf/browser/extensions/addon@returnyoutubedislike.com.xpi
}

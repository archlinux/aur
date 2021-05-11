# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='2.0.1'
pkgrel=1
pkgdesc="Cast media from Jellyfin Mobile and Web apps to MPV"
arch=('any')
url='https://github.com/jellyfin/jellyfin-mpv-shim'
license=('MIT')
depends=('mpv' 'python>=3.6' 'python-mpv' 'python-mpv-jsonipc>=1.1.9' 'python-jellyfin-apiclient>=1.7.2' 'tk')
makedepends=('python-setuptools' 'gettext')
optdepends=('python-pystray: systray support'
	'python-jinja: display mirroring support'
	'python-pywebview>=3.3.1: display mirroring support'
	'svp: SmoothVideo Project server'
	'mpv-shim-default-shaders: default shader pack'
	'python-pypresence: Discord Rich Presence integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jellyfin/jellyfin-mpv-shim/archive/v$pkgver.tar.gz")
sha256sums=('14eaec91a93df8db96fc6a541e2b5adf21c8c7c0f61f997e2f60a63ab591ccbb')
install="$pkgname.install"

build() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	find -iname '*.po' | while read -r _file
	do
		msgfmt "$_file" -o "${_file%.*}.mo"
	done
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	cd "${pkgdir}"
	_sitepkg="usr/lib/$(ls usr/lib/ | grep python)/site-packages/jellyfin_mpv_shim"
	ln -s "/usr/share/mpv-shim-default-shaders" "$_sitepkg/default_shader_pack"
}

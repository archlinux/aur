# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='1.8.1'
pkgrel=1
pkgdesc="Cast media from Jellyfin Mobile and Web apps to MPV. (Unofficial)"
arch=('any')
url='https://github.com/iwalton3/jellyfin-mpv-shim'
license=('MIT')
depends=('mpv' 'python>=3.6' 'python-pydantic' 'python-mpv' 'python-mpv-jsonipc>=1.1.9' 'python-jellyfin-apiclient>=1.6.2' 'tk')
makedepends=('python-setuptools' 'gettext')
optdepends=('python-pystray: systray support'
	'python-jinja: display mirroring support'
	'python-pywebview>=3.3.1: desktop client and display mirroring support'
	'python-werkzeug: desktop client support'
	'python-flask: desktop client support'
	'jellyfin-mpv-shim-web: desktop client support'
	'svp: SmoothVideo Project server'
	'mpv-shim-default-shaders: default shader pack'
	'python-pypresence: Discord Rich Presence integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/jellyfin-mpv-shim/archive/v$pkgver.tar.gz")
sha256sums=('34cf9145d8b966c85680ef7ec74b2b949884f56c76d601e6d9e695bf513a8620')

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
	ln -s "/usr/lib/jellyfin-mpv-shim/jellyfin-web" "$_sitepkg/webclient_view/webclient"
}

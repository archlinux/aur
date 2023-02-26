# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver=2.5.0
pkgrel=1
pkgdesc="Cast media from Jellyfin Mobile and Web apps to MPV"
arch=('any')
url='https://github.com/jellyfin/jellyfin-mpv-shim'
license=('MIT')
depends=('mpv' 'python>=3.6' 'python-mpv' 'python-mpv-jsonipc>=1.1.9' 'python-jellyfin-apiclient>=1.8.1' 'tk')
makedepends=('python-setuptools' 'gettext')
optdepends=('python-pystray: systray support'
	'python-jinja: display mirroring support'
	'python-pywebview>=3.3.1: display mirroring support'
	'svp: SmoothVideo Project server'
	'mpv-shim-default-shaders: default shader pack'
	'python-pypresence: Discord Rich Presence integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jellyfin/jellyfin-mpv-shim/archive/v$pkgver.tar.gz")
b2sums=('24b78e51121617e49377612d3ac404c0624aa847aa7b4d78bed2141e26cea4b8882606a64559989762eb738647568b10898d3ac3b22deae16825a2d8048411eb')

build() {
    cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
    find -iname '*.po' | while read -r _file; do
        msgfmt "$_file" -o "${_file%.*}.mo"
    done
    python setup.py build
}

package() {
    cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    for i in 16 32 48 64 128 256; do
        install -Dvm644 jellyfin_mpv_shim/integration/jellyfin-$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/com.github.iwalton3.jellyfin-mpv-shim.png"
    done

    install -Dm644 jellyfin_mpv_shim/integration/com.github.iwalton3.jellyfin-mpv-shim.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd "${pkgdir}"
    _sitepkg="usr/lib/$(ls usr/lib/ | grep python)/site-packages/jellyfin_mpv_shim"
    ln -s "/usr/share/mpv-shim-default-shaders" "$_sitepkg/default_shader_pack"
}

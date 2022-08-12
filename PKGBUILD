# Maintainer: Utkarsh Singh <utkarsh190601 at gmail dot com>

pkgname='blender-docs'
pkgver=3.2.0
_spkgver=${pkgver%.[0-9]}	# Short Packgage Version
pkgrel=1
pkgdesc='Set of HTML documentation for blender'
arch=('any')
url='https://docs.blender.org/'
license=('custom:CC BY-SA 4.0')
options=(!strip)
source=("blender-manual-$pkgver.zip::https://docs.blender.org/manual/en/latest/blender_manual_html.zip"
	"blender-api-$pkgver.zip::https://docs.blender.org/api/current/blender_python_reference_${_spkgver/./_}.zip"
	LICENCE)

b2sums=('d44f9264a38d63473d3c6fcaad07f3187ae63f94c9b6a3403317a2de593b4919bbcdc447b556920eae4e080185a7c50fd12efc6c98838cd7798ac41ace50d124'
	'99aa7771545a2d5d104292cb4f7656afc91987f6fa16c0707f0791deabc6bb0229f88b7bf2e35aeec90de8245e51e1f393b02e005340770ffd798728a1e4befa'
	'd1e99ef6842a6b5e4ac63cc3ab5bd7a4fd0fec5a871eec5b8bc031d8a6b2ae89f76eca2f98b0946e78e19d5fa9b2dea51cb2bb0985d064f54ea4ed9759999205')

_replace_manual_ref() {
    find "$srcdir" \
	 -type f \
	 -name '*.html' \
	 -exec sed -i "s,$1,file:///usr/share/doc/blender/html/," {} +
}

_replace_api_ref() {
    find "$srcdir" \
	 -type f \
	 -name '*.html' \
	 -exec sed -i "s,$1,file:///usr/share/doc/blender/api/," {} +
}

prepare() {
    _replace_manual_ref 'https://docs.blender.org/manual/en/dev/'
    _replace_manual_ref 'https://docs.blender.org/manual/en/latest/'
    _replace_api_ref 'https://docs.blender.org/api/current/'
}

package() {
    mkdir -p "$pkgdir/usr/share/doc/blender/html/"
    mkdir -p "$pkgdir/usr/share/doc/blender/api/"
    cp -rf "$srcdir"/blender_manual*/* "$pkgdir"/usr/share/doc/blender/html
    cp -rf "$srcdir/blender_python_reference_${_spkgver/./_}"/* "$pkgdir"/usr/share/doc/blender/api
    find "$pkgdir"/usr/share/doc/blender/ -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/doc/blender/ -type d -exec chmod 0755 {} \;
    install -Dm644 "$srcdir"/LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

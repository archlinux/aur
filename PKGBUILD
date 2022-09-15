# Maintainer: Utkarsh Singh <utkarsh190601 at gmail dot com>

pkgname='blender-docs'
pkgver=3.3.0
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

b2sums=('8f17e6af99d568dd521fd6484fc1f9f86fc24952cda30db550debbde5ddae2bb09afacaf5d3a5492053886049848fa93c266d3590670001b19f5e5c9795c7df8'
	'61d9e528117f189df49eb04902c02e105e6505d5c391de22361af482eb9b046368cb36f50bc3153b33295ed48569a3eef9c8810dac18d18bba05067deec5ff07'
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

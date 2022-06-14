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

b2sums=('5a5f77aaf454dbefe8c6fa6aaf84f37bab21ba8e11e67216c777d028ecbb848e2e37d33575f733e23dbba355ab171f58c5a942c800ac27e0c21ed09518083320'
	'241baa73524722004881ea507957bf9dd31c3e698b80bd19f89bcf30b7dc9ca2ad46727a8429d41fe81c35f268a2419f7fcbc244244edf225fc4fb6ce12abe40'
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
    _replace_api_ref 'https://docs.blender.org/api/3.1/'
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

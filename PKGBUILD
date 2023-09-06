# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=renpy
pkgver=8.1.3
_verdate=23090601
pkgrel=1
pkgdesc="Visual novel engine Ren'Py along with its platdeps libs"
arch=('i686' 'x86_64')
license=('MIT')
url='http://www.renpy.org'
depends=(
	'ffmpeg' 'fribidi'
	'python-pygame-sdl2' 'sdl2_image' 'sdl2_mixer' 
	'sdl2_gfx' 'sdl2_ttf' 'python-ecdsa' 'python-future' 'python-pefile')
makedepends=(
	'cython0' 'python-setuptools-scm' 'python-sphinx' 'python-sphinx_rtd_dark_mode' 
	'python-sphinx_rtd_theme' 'python-build' 'python-installer' 'python-wheel')
provides=('python-renpy')
replaces=('renpy64')
install='renpy.install'

source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver}.${_verdate}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}-launcher.sh")
sha256sums=('7141568d807ef7a947e754c425bf0bd52f9f343772285c352bbc2a90c8fe3b9d'
            'b58efcc42526c4de15e8963b02991e558b5e3d15d720b3777b791ac13fc815e6'
            'a38112859bf659d48c30be5c7c20ed1a1c72271ffd74eb4b4e730afbd87d73dc')

_srcdir="${pkgname}-${pkgver}.${_verdate}"

build() {
	cd "${_srcdir}"

	pushd 'module'
		python -m build --wheel --no-isolation
		rm -rf "$srcdir/tempinstall"
		python -m installer --destdir="$srcdir/tempinstall" dist/*.whl
	popd
	
	# build docs
	cd 'sphinx'
	mkdir -p 'source/inc'
	
	local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$srcdir/tempinstall/usr/lib/python${python_version}/site-packages" python ../renpy.py .
	RENPY_NO_FIGURES=1 sphinx-build -E -a source ../doc -j ${SPHINX_JOBS:-auto}
}

package() {
	#pack data
	mkdir -p "$pkgdir/"{usr/share/{$pkgname,doc/$pkgname},}

	install -D -m755 "${pkgname}-launcher.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

	cd "${_srcdir}"
	cp -r 'sdk-fonts' 'launcher' 'renpy' 'renpy.py' 'the_question' 'tutorial' 'gui' "$pkgdir/usr/share/$pkgname"
	cp -r doc/* "$pkgdir/usr/share/doc/$pkgname"
	install -D -m644 'launcher/game/images/logo.png' "$pkgdir/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 'sphinx/source/license.rst' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	install -d -m755 "$pkgdir/usr/share/renpy/lib/py3-linux-x86_64"
	ln -s '/usr/bin/renpy' "$pkgdir/usr/share/renpy/lib/py3-linux-x86_64"

	chgrp -R games "$pkgdir"/usr/share/renpy/{the_question,tutorial}
	chmod g+w "$pkgdir"/usr/share/renpy/{the_question,tutorial}

	#pack modules
	cd 'module'
	python -m installer --destdir="$pkgdir" dist/*.whl
}

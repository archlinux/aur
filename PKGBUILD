# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Cravix < dr dot neemous at gmail dot com >
# base on renpy and python-renpy PKGBUILD written by AlexanderR <rvacheva at nxt dot ru>

_pkgname=renpy
pkgname=${_pkgname}-git
pkgver=14144.7917173b0
pkgrel=1
pkgdesc="Visual novel engine Ren'Py along with its platdeps libs (dev channel)"
arch=('i686' 'x86_64')
license=('MIT')
url='http://www.renpy.org'
depends=(
	'ffmpeg' 'fribidi'
	'python-pygame_sdl2-git' 'sdl2_image' 'sdl2_mixer' 
	'sdl2_gfx' 'sdl2_ttf' 'python-ecdsa' 'python-future')
makedepends=(
	'cython' 'python-setuptools-scm' 'python-sphinx' 'python-sphinx_rtd_dark_mode' 
	'python-sphinx_rtd_theme' 'git' 'python-build' 'python-installer' 'python-wheel')
provides=('renpy' 'python-renpy')
conflicts=('renpy')
replaces=('renpy64')
install='renpy.install'

source=("git+https://github.com/${_pkgname}/${_pkgname}.git"
        "${_pkgname}.desktop"
        "${_pkgname}-launcher.sh")
sha256sums=('SKIP'
            'b58efcc42526c4de15e8963b02991e558b5e3d15d720b3777b791ac13fc815e6'
            'a38112859bf659d48c30be5c7c20ed1a1c72271ffd74eb4b4e730afbd87d73dc')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_pkgname"

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
	RENPY_NO_FIGURES=1 sphinx-build -E -a source ../doc
}

package() {
	#pack data
	mkdir -p "$pkgdir/"{usr/share/{$_pkgname,doc/$_pkgname},}

	cd "$srcdir"
	install -D -m755 "${_pkgname}-launcher.sh" "$pkgdir/usr/bin/$_pkgname"
	install -D -m644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

	cd "$srcdir/$_pkgname"
	cp -r 'sdk-fonts' 'launcher' 'renpy' 'renpy.py' 'the_question' 'tutorial' "$pkgdir/usr/share/$_pkgname"
	cp -r doc/* "$pkgdir/usr/share/doc/$_pkgname"
	install -D -m644 'launcher/game/images/logo.png' "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
	install -D -m644 'sphinx/source/license.rst' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	chgrp -R games "$pkgdir"/usr/share/renpy/{the_question,tutorial}
	chmod g+w "$pkgdir"/usr/share/renpy/{the_question,tutorial}

	#pack modules
	cd "$srcdir/$_pkgname/module"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

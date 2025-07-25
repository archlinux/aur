# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=renpy
pkgver=8.4.1.25072401
pkgrel=1
pkgdesc="Visual novel engine Ren'Py along with its platdeps libs"
arch=('i686' 'x86_64')
license=('MIT')
url='http://www.renpy.org'
depends=(
	'glibc' 'ffmpeg' 'fribidi' 'harfbuzz' 'freetype2' 'libpng'
	'python-pygame-sdl2' 'sdl2' 'sdl2_image' 'sdl2_mixer'
	'sdl2_gfx' 'sdl2_ttf' 'python-ecdsa' 'python-legacy-cgi' 'assimp' 'ftgl')
makedepends=(
	'cython' 'python-setuptools-scm' 'python-sphinx_rtd_dark_mode'
	'python-sphinx_rtd_theme' 'python-build' 'python-installer' 'python-wheel' 'git')
provides=('python-renpy')
replaces=('renpy64')
install='renpy.install'

source=("git+https://github.com/${pkgname}/${pkgname}.git#tag=${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}-launcher.sh")
sha256sums=('721cfc0f43927d2d9f7ab7a6bfbe389d81a9326789654365e554c6b603695d1f'
            'b58efcc42526c4de15e8963b02991e558b5e3d15d720b3777b791ac13fc815e6'
            'a38112859bf659d48c30be5c7c20ed1a1c72271ffd74eb4b4e730afbd87d73dc')

build() {
	cd "${pkgname}"

	# This always return the last version from HEAD regardless of what version we are building.
	#python 'distribute.py' --vc-version-only

	export CFLAGS+=" $(pkg-config --cflags ftgl)"

	install -Dm644 <(cat << EOF
branch = 'master'
nightly = False
official = False
version = '$pkgver'
version_name = 'Tomorrowland'
EOF
	) 'renpy/vc_version.py'

	python -m build --wheel --no-isolation

	#local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	#for game in 'tutorial' 'launcher' 'the_question'; do
		#PYTHONPATH="$srcdir/tempinstall/usr/lib/python${python_version}/site-packages" python 'renpy.py' --compile "$game"
	#done

	# build docs
	#cd 'sphinx'
	#mkdir -p 'source/inc'

	#PYTHONPATH="$srcdir/tempinstall/usr/lib/python${python_version}/site-packages" python ../renpy.py .
	#RENPY_NO_FIGURES=1 sphinx-build -E -a source ../doc -j ${SPHINX_JOBS:-auto}
}

package() {
	depends+=('python-pefile' 'python-requests' 'python-rsa' 'python-six')

	#pack data
	mkdir -p "$pkgdir/"{usr/share/{$pkgname,doc/$pkgname},}

	install -D -m755 "${pkgname}-launcher.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

	cd "${pkgname}"
	cp -r 'sdk-fonts' 'launcher' 'renpy' 'renpy.py' 'the_question' 'tutorial' 'gui' "$pkgdir/usr/share/$pkgname"
	#cp -r doc/* "$pkgdir/usr/share/doc/$pkgname"
	install -D -m644 'launcher/game/images/logo.png' "$pkgdir/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 'sphinx/source/license.rst' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d -m755 "$pkgdir/usr/share/renpy/lib/py3-linux-x86_64"
	ln -s '/usr/bin/renpy' "$pkgdir/usr/share/renpy/lib/py3-linux-x86_64"

	python -m installer --destdir="$pkgdir" dist/*.whl
}

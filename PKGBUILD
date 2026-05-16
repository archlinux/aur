# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=renpy
pkgver=8.5.3.26051504
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
	'python-sphinx_rtd_theme' 'git') # 'python-build' 'python-installer' 'python-wheel'
provides=('python-renpy')
replaces=('renpy64')
install='renpy.install'

source=("git+https://github.com/${pkgname}/${pkgname}.git#tag=${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}-launcher.sh")
sha256sums=('f50a690cdf1bc5aee999b9c05373b6830c060956605f2ddb8342117b2b152504'
            'b58efcc42526c4de15e8963b02991e558b5e3d15d720b3777b791ac13fc815e6'
            '1fc31125ce1a6be454e2e5995da1ba4860db6da687dbfffbca80a06f64aba43c')

build() {
	cd "${pkgname}"

	# This always return the last version from HEAD regardless of what version we are building.
	#python 'distribute.py' --vc-version-only

	export CFLAGS+=" $(pkg-config --cflags sdl2 ftgl)"

	install -Dm644 <(cat << EOF
branch = 'master'
nightly = False
official = False
version = '$pkgver'
version_name = 'Tomorrowland'
EOF
	) 'renpy/vc_version.py'

	#python -m build --wheel --no-isolation
	python setup.py build_ext --inplace

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

	mkdir -p "$pkgdir/"{usr/share/{$pkgname,doc/$pkgname},}

	install -D -m755 "${pkgname}-launcher.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -d -m755 "$pkgdir/usr/lib/$pkgname/lib/py3-linux-x86_64"

	cd "${pkgname}"
	cp -a 'sdk-fonts' 'launcher' 'renpy.py' 'renpy' 'the_question' 'tutorial' 'gui' '_renpy.cpython-'* "$pkgdir/usr/lib/$pkgname"
	find "$pkgdir/usr/lib/$pkgname" -name '*.pyx' -o -name '*.pyi' -delete
	#cp -r doc/* "$pkgdir/usr/share/doc/$pkgname"
	install -D -m644 'launcher/game/images/logo.png' "$pkgdir/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 'sphinx/source/license.rst' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	ln -s '/usr/bin/renpy' "$pkgdir/usr/lib/$pkgname/lib/py3-linux-x86_64"

	#python -m installer --destdir="$pkgdir" dist/*.whl

	#local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
	#cp -r 'renpy/'* "$pkgdir/$site_packages/renpy/"
	#find "$pkgdir/$site_packages/renpy" -name '*.pyx' -o -name '*.pyi' -delete
}

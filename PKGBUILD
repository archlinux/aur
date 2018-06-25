# Maintainer: boltgolt <boltgolt@gmail.com>
# Maintainer: Kelley McChesney <kelley@kelleymcchesney.us>
pkgname=howdy
pkgver=2.2.2
pkgrel=1
epoch=
pkgdesc="Windows Hello for Linux"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
depends=(
	'opencv'
	'hdf5'
	'python2'
	'python3'
)
makedepends=(
	'python2-sphinx'
	'git'
	'cmake'
	'pkgfile'
	'python-pip'
)
checkdepends=()
optdepends=('gedit: configuration support')
provides=()
conflicts=()
replaces=()
backup=('usr/lib/security/howdy/config.ini')
options=()
install=
changelog=
source=("https://github.com/boltgolt/howdy/archive/v2.2.2.tar.gz"
        "https://downloads.sourceforge.net/project/pam-python/pam-python-1.0.6-1/pam-python-1.0.6.tar.gz"
	"https://sourceforge.net/p/pam-python/tickets/_discuss/thread/5dc8cfd5/5839/attachment/pam-python-1.0.6-fedora.patch"
	"https://sourceforge.net/p/pam-python/tickets/_discuss/thread/5dc8cfd5/5839/attachment/pam-python-1.0.6-gcc8.patch")
sha256sums=('d88e567733fdedc9de1c4b9c5db9ebf91f1940fe3ca93e84e5cd31c614b2542c'
	    '0ef4dda35da14088afb1640266415730a6e0274bea934917beb5aca90318f853'
	    'acb9d1b5cf7cad73d5524334b7954431bb9b90f960980378c538907e468c34b5'
	    '02dd9a4d8ec921ff9a2408183f290f08102e3f9e0151786ae7220a4d550bfe24')
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	# Preparing dlib with GPU here
	git clone --depth 1 https://github.com/davisking/dlib.git dlib_clone

	# Preparing pam-python to be installed 
	cd pam-python-1.0.6
	sed -i'' 's|#!/usr/bin/python -W default|#!/usr/bin/python2 -W default|g' src/setup.py
	sed -i'' 's|#!/usr/bin/python -W default|#!/usr/bin/python2 -W default|g' src/test.py
	sed -i'' 's|LIBDIR ?= /lib/security|LIBDIR ?= /usr/lib/security|g' src/Makefile
	sed -i'' 's|sphinx-build|sphinx-build2|g' doc/Makefile
	patch -p1 < ../pam-python-1.0.6-fedora.patch
	patch -p1 < ../pam-python-1.0.6-gcc8.patch
	
	# Doing some fixes for pam-python so that it can compile
	sudo pkgfile -u
	sudo pkgfile /usr/include/sys/cdefs.h core/glibc
}

build() {
	# Building pam-python
	cd pam-python-1.0.6
	PREFIX=/usr make
	cd ..

	# Building dlib with GPU
	cd dlib_clone
	python setup.py build
}

package() {
	# Installing pip packages
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed face_recognition_models==0.3.0 Click>=6.0 numpy Pillow
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location face_recognition==1.2.2
	python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/click"
	python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/face_recognition_models"
	python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/numpy"
	python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/PIL"
	python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/face_recognition"

	# Installing dlib with GPU
	cd dlib_clone
	python3 setup.py install --yes USE_AVX_INSTRUCTIONS --no DLIB_USE_CUDA --root="$pkgdir/" --optimize=1 --skip-build
	cd ..

	# Installing pam-python
	cd pam-python-1.0.6
	PREFIX=/usr make DESTDIR="$pkgdir/" install
	cd ..

	# Installing the proper license files and the rest of howdy
	cd howdy-2.2.2
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/security/howdy"
	cp -r src/* "$pkgdir/usr/lib/security/howdy"
	chmod 600 -R "$pkgdir/usr/lib/security/howdy"
	ln -s /lib/security/howdy/cli.py "$pkgdir/usr/bin/howdy"
	chmod +x "$pkgdir/usr/lib/security/howdy/cli.py"
	mkdir -p "$pkgdir/usr/share/bash-completion/completions"
	cp autocomplete/howdy "$pkgdir/usr/share/bash-completion/completions/howdy"
}

# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pypdfium2
pkgver=4.28.0
pkgrel=1
# Notice should always be explicitly included in the description, according to pypdfium2's README.
pkgdesc="An ABI-level Python 3 binding to PDFium (unofficial AUR package)"
arch=(any)
url="https://github.com/pypdfium2-team/pypdfium2"
license=('Apache' 'BSD')
depends=('python>=3.7.0')
makedepends=('python-setuptools>=33.0.0' 'git' 'python-wheel>0.38.1' 'python-installer'
	'python-build' 'python-toml' 'python-setuptools-scm>=3.4.3' 'python-packaging')
optdepends=('python-pillow: support PIL image objects for raster graphics'
	'python-numpy: support numpy arrays for raster graphics')
changelog=$pkgname.changelog.md
_name=${pkgname#python-}
_ctypesgencommit="066e6d226b79518af51c76eb5c2dadc6518dc81b"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	# This is a pypdfium2-specific fork of the actual ctypesgen, hence we need to download it here.
	"ctypesgen::git+https://github.com/pypdfium2-team/ctypesgen#commit=$_ctypesgencommit")
sha256sums=("1f18981bcceb3a9e59c6de3e4e7e070cddc4de1f7faf419d9ad5f677b06fd909"
	"SKIP") # No checksums for git sources.

build() {
	echo "Building pypdfium2-specific ctypesgen..."
	cd "ctypesgen"
	python -m build --wheel --no-isolation
	python -m installer --destdir="$srcdir/ctypesgen-build" dist/*.whl
	cd "$srcdir/$_name-$pkgver/"
	echo "Building pypdfium2..."
	# We need to include the previously-built ctypesgen here in the respective paths.
	# NOTE: It's important to include our directories before other PATH entries,
	#       in case the user has the "official" ctypesgen installed already.
	PATH="$srcdir/ctypesgen-build/usr/bin:$PATH" PYTHONPATH="$srcdir/ctypesgen-build/usr/lib/python3.$(python3 --version | sed 's/^Python 3\.\([0-9]*\)\..*$/\1/')/site-packages:$PYTHONPATH" python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver/"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	# We include those LICENSES included by pyproject.toml.
	install -Dm644 LICENSES/{Apache-2.0.txt,BSD-3-Clause.txt,CC-BY-4.0.txt,LicenseRef-PdfiumThirdParty.txt} .reuse/dep5 "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python38-sphinx
pkgver=5.3.0
pkgrel=1
pkgdesc='Python documentation generator'
arch=('any')
url=http://www.sphinx-doc.org/
license=('BSD')
depends=('python38-babel'
         'python38-docutils'
         'python38-imagesize'
         'python38-jinja'
         'python38-packaging'
         'python38-pygments'
         'python38-requests'
         'python38-snowballstemmer'
         'python38-sphinx-alabaster-theme'
         'python38-sphinxcontrib-'{{apple,dev,html}help,jsmath,qthelp,serializinghtml})
makedepends=('python38-build' 'python38-flit-core' 'python38-installer')
checkdepends=('python38-cython'
              'imagemagick' 'librsvg'
              'python38-html5lib'
              'python38-pytest'
              'python38-setuptools'
              'texlive-fontsextra' 'texlive-latexextra')
optdepends=('imagemagick: for ext.imgconverter'
            'texlive-latexextra: for generation of PDF documentation')
source=("https://pypi.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz"{,.asc})
sha256sums=('51026de0a9ff9fc13c05d74913ad66047e104f56a129ff73e174eb5c3ee794b5'
            'SKIP')
b2sums=('9465c4ca639a06681fd422d7f044e52019e9ee315b3dce58cc9c42f3de12ef9877eca756dbd75cc5068e7905b0cb16ddfe6ea4e4110f78bdbaac821042af5d26'
        'SKIP')
validpgpkeys=('8A11B79A5D0D749A66F0A030102C2C17498D6B9E'  # Takeshi KOMIYA <i.tkomiya@gmail.com>
              'E9BEABB07E7B9CC3F56E62C91425F8CE5EBA0E07'  # Takayuki Shimizukawa <shimizukawa@gmail.com>
              'D3549119BD51B4AFE643E59752C8F72A61F0FB52') # Adam Turner <9087854+aa-turner@users.noreply.github.com>

build() {
  cd Sphinx-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd Sphinx-$pkgver
  LC_ALL="en_US.UTF-8" python3.8 -X dev -X warn_default_encoding -m pytest -v
}

package() {
  cd Sphinx-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/sphinx-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

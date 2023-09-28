# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=1.9.0
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-setuptools' 'python-sphinx' 'python-six' 'python-numpy' 'python-dill' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-opengl' 'python-pyparsing' 'python-pillow' 'python-scipy' 'python-opengl-accelerate' 'python-wheel' 'python-twine' 'python-pytest-timeout' 'python-pytest-xdist' 'python-certifi' 'python-wxpython' 'python-xarray' 'python-parse' 'fslpy>=3.15.1' 'fsleyes-widgets>=0.14.3' 'fsleyes-props>=1.11.0' 'python-file-tree>=0.4.0')
optdepends=('fsl: Enable loading standard images and advanced features (highly recommended)'
            'python-wxnatpy: Enable loading overlay from XNAT'
            'python-indexed-gzip: Fast random access of gzipped image files'
            'python-rtree'
            'jupyter-notebook'
            'python-trimesh')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('9df417534c9bf0d0a903fb1a3728d44b022c1a01966a1d3cea8d5fa45c5c08d3'
            '40400e0dca12cee5ace94830560fbf64ac451143f56a92ef31ef5825fbd6d2ac')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}/" dist/*.whl
  
  install -Dm644 ./fsleyes/assets/icons/app_icon/fsleyes.iconset/icon_512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  
  # Add python pth file to let FSLeyes find the fsl python module
  sitepackages_path=$(python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")
  mkdir -p "${pkgdir}"/"${sitepackages_path}"
  echo "/opt/fsl/lib/python3.11/site-packages" > "${pkgdir}"/"${sitepackages_path}"/fsl.pth
  echo "/opt/fsl/lib/python3.10/site-packages" >> "${pkgdir}"/"${sitepackages_path}"/fsl.pth
}

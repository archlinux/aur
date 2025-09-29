# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=1.16.1
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-setuptools' 'python-sphinx' 'python-six' 'python-numpy' 'python-dill' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-opengl' 'python-pyparsing' 'python-pillow' 'python-scipy' 'python-opengl-accelerate' 'python-wheel' 'python-twine' 'python-pytest-timeout' 'python-pytest-xdist' 'python-certifi' 'python-wxpython' 'python-xarray' 'python-parse' 'fslpy>=3.22.0' 'fsleyes-widgets>=0.15.1' 'fsleyes-props>=1.12.2' 'python-file-tree>=0.4.0')
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
sha256sums=('206985de13c0b9596ad58376d2398dc9e1f95f7c894fd4b84f8db3f14fca795c'
            '056de41220ba25e7cda918eda928a5d5a9a99d51487b4adc3ba15fef387db02e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_fsleyes=${pkgver} python -m build --wheel --no-isolation
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

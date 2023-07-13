# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=1.7.0
pkgrel=2
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-setuptools' 'python-sphinx' 'python-six' 'python-numpy' 'python-dill' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-opengl' 'python-pyparsing' 'python-pillow' 'python-scipy' 'python-opengl-accelerate' 'python-wheel' 'python-twine' 'python-pytest-timeout' 'python-pytest-xdist' 'python-certifi' 'python-wxpython' 'python-xarray' 'python-parse' 'fslpy>=3.13.0' 'fsleyes-widgets>=0.14.3' 'fsleyes-props>=1.9.6' 'python-file-tree>=0.4.0')
optdepends=('fsl: Enable loading standard images and advanced features (highly recommended)'
            'python-wxnatpy: Enable loading overlay from XNAT'
            'python-indexed-gzip: Fast random access of gzipped image files'
            'python-rtree'
            'jupyter-notebook'
            'python-trimesh')
makedepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('ab5eb2e5e5147f6ffd9701f49db319d8f3ab755eda3c593f191be7a13c891fc5'
            '4733d5e611d2c4f67e6a207c06785d3b5e96be021f3bc486cb837bfb17907cc1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Workaround for pyparsing > 2
  sed -i '/pyparsing==2\.\*/d' requirements.txt
  python setup.py install --root="${pkgdir}/" --optimize=1
  
  install -Dm644 ./fsleyes/assets/icons/app_icon/fsleyes.iconset/icon_512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  
  # Add python pth file to let FSLeyes find the fsl python module
  sitepackages_path=$(python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")
  mkdir -p "${pkgdir}"/"${sitepackages_path}"
  echo "/opt/fsl/lib/python3.11/site-packages" > "${pkgdir}"/"${sitepackages_path}"/fsl.pth
  echo "/opt/fsl/lib/python3.10/site-packages" >> "${pkgdir}"/"${sitepackages_path}"/fsl.pth
}

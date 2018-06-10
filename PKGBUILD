# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=0.24.2
pkgrel=2
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-sphinx' 'python-six' 'python-numpy' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-pillow' 'python-opengl' 'python-pyparsing' 'python-scipy' 'python-opengl-accelerate' 'python-wxpython>=4.0.1-2' 'fsl' 'fsleyes-widgets>=0.6.2' 'fsleyes-props>=1.6.2' 'python-wxnatpy>=0.3.1' 'python-indexed-gzip>=0.7.0')
makedepends=()
provides=()
conflicts=()
replaces=()
source=("${pkgname}-${pkgver}.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/repository/archive.tar.gz?ref=${pkgver}"
        "${pkgname}.png::https://git.fmrib.ox.ac.uk/uploads/-/system/group/avatar/85/icon_512x512.png"
        "${pkgname}.desktop"
        "0001-remove_appnope.patch")
sha256sums=('05b310e2f36aa06326d4bf4c508b156ad49c928976d0a240fedd5b197435f4a0'
            'c7211ee624483a272f280b3aa772046ec9226d838f9c3023450888abddf9d71a'
            '6e91e88eb74602f8da7cda6575245dbaaf4577022bffe15c0efedb33106139fb'
            '6b6094b9fe888cfb9b86010b457bd8ad97b4c1242bc7d64557fe83d566f56fc6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-"*
  # "Patching" for Pillow>=5.0 support
  sed -i 's/Pillow>=3\.2\.0,<5\.0/Pillow>=3\.2\.0/g' requirements.txt
  # Removing Mac OS-specific appnope requirement
  sed -i 's/appnope==0\.1\.\*//g' requirements.txt
  patch -p0 <"${srcdir}"/0001-remove_appnope.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-"*
  
  python setup.py install --root="${pkgdir}/" --optimize=1
  
  install -Dm644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}

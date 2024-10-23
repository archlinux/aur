# Maintainer: Jean-Baptiste Delisle <jb dot delisle at pi314 dot noho dot st>
pkgname='bed-latex'
pkgver='2.0.2'
pkgrel=1
pkgdesc="BEd: Beamer Editor, GUI for LaTeX Beamer presentations."
url="https://framagit.org/delisle/bed"
depends=('python>=3.8' 'pyside6' 'python-pymupdf' 'texlive-core' 'texlive-latexextra')
optdepends=('python-pygments')
provides=('bed-latex')
conflicts=('bed-latex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('GPL3')
arch=('any')
install="bed.install"
module='bed_latex'
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${module}-${pkgver}.tar.gz")
sha256sums=('46705a688fedc2538466099391a55b08ec93ad7d4093ae2a23c9f10e163cec24')

prepare() {
  cd "${srcdir}"
  tar -xvf "${module}-${pkgver}.tar.gz"
  cd "${module}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${module}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  py=$(ls "${pkgdir}/usr/lib/")
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/bed"
  ln -s "/usr/lib/${py}/site-packages/bed/latex/bed.sty" "${pkgdir}/usr/share/texmf/tex/latex/bed"
  mkdir -p "${pkgdir}/usr/local/share/pixmaps"
  ln -s "/usr/lib/${py}/site-packages/bed/icons/bed.svg" "${pkgdir}/usr/local/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"
  ln -s "/usr/lib/${py}/site-packages/bed/launcher/bed.desktop" "${pkgdir}/usr/share/applications"
}

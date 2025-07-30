# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_name="matlabengine"
pkgname="python-${_name}"
pkgver=25.1.2
_release=R2025a
pkgrel=4
pkgdesc="A high-level language for numerical computation and visualization (Python bindings)"
arch=('any')
url="https://www.mathworks.com/help/matlab/matlab-engine-for-python.html"
_url="https://github.com/mathworks/matlab-engine-for-python"
license=('MIT')
depends=("matlab-release=${_release}" 'python>=3.9')
makedepends=('python-build' 'python-installer' 'python-setuptools>=42' 'python-wheel')
provides=("${pkgname}-release=${_release}")
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d28cb30e64a2eaee7a24793859d759eb6f59bad73e4b1e8fbfcb106de88659dc71861a60ebc30450834061a41a3672f14321b8b84eb1e97963d469aeb88627ad')

prepare() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  cd "${srcdir}/${_pkgsrc}"
  sed -e "s/3.12/${python_version}/g" \
      -e 's|/usr/local|/opt|g' \
      -i 'setup.py'
}

build() {
  # local matlabroot=matlabroot="$(matlab -nodisplay -nodesktop -nojvm -batch "disp(matlabroot)"
  # export LD_LIBRARY_PATH="${matlabroot}/bin/glnxa64:${LD_LIBRARY_PATH}"

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
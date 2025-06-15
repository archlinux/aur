# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_name="matlabengine"
pkgname="python-${_name}"
pkgver=25.1.2
pkgrel=1
pkgdesc="A high-level language for numerical computation and visualization (Python bindings)"
arch=('any')
url="https://www.mathworks.com/help/matlab/matlab-engine-for-python.html"
_url="https://github.com/mathworks/matlab-engine-for-python"
license=('MIT')
depends=('matlab-version=R2025a' 'python>=3.9')
makedepends=('python-build' 'python-installer' 'python-setuptools>=42' 'python-wheel')
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d28cb30e64a2eaee7a24793859d759eb6f59bad73e4b1e8fbfcb106de88659dc71861a60ebc30450834061a41a3672f14321b8b84eb1e97963d469aeb88627ad')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's/3.12/3.13/g' \
      -e 's|/usr/local|/opt|g' \
      -i 'setup.py'
}

build() {
  # local matlabroot
  # matlabroot="$(matlab -nodisplay -nojvm -batch "matlabroot" | grep -Eo "/.*[^']")"
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
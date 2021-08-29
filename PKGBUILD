# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsgan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.0.77.gb92cb6b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/rlaPHOENiX/VSGAN'
license=('MIT')
depends=('vapoursynth-plugin-mvsfunc-git'
         'python-numpy'
         'python-pytorch'
         )
makedepends=('git'
             'python-build'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/rlaPHOENiX/VSGAN.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd "${_plug}"
  pyproject-build -n  -w
}

package() {
  cd "${_plug}"
  pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  rm -fr "${pkgdir}${_site_packages}"/{README.md,LICENSE}

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

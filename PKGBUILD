# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=11.r85.f3167b8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=172564'
license=('GPL')
depends=('vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-bm3d-git'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/mvsfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  _ver="$(cat mvsfunc/_metadata.py | grep -m1 __version__ | grep -o "[[:digit:]]*")"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
#   echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

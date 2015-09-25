# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=templinearapproximate
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.3.g540e788
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=169782'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://bitbucket.org/mystery_keeper/${_plug}-vapoursynth.git")
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  echo "all:
	  gcc -o lib${_plug}.so ${CFLAGS} ${LDFLAGS} $(pkg-config --cflags vapoursynth) -fPIC -shared ${_plug}/src/main.c ${_plug}/src/processplane.c" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 "${_plug}/MCDenoise.py" "${pkgdir}${_sites_packages}/MCDenoise.py"
  install -Dm644 "${_plug}/TempLinearApproximate-readme.txt" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=descale
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.3.gc211f99
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/vapoursynth-descale.git'
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vapoursynth-descale.git")
sha256sums=('SKIP')


_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {

  echo "all:
	  g++ -c -std=c++11 -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o descale.o descale/descale.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so descale.o" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 descale/descale.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 descale/README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 descale/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

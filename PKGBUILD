# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=templinearapproximate
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.6.g604688d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=169782'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://bitbucket.org/mystery_keeper/${_plug}-vapoursynth.git")
sha256sums=('SKIP')
options=('debug')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"

  echo "all:
	  gcc -c -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o main.o src/main.c
	  gcc -c -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o processplane.o src/processplane.c
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so main.o processplane.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 MCDenoise.py "${pkgdir}${_site_packages}/MCDenoise.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/MCDenoise.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/MCDenoise.py"

  install -Dm644 TempLinearApproximate-readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.txt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

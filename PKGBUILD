# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile dot desu at gmail dot com>

pkgname=vapoursynth-git
pkgver=R63.32.g1e2cc799
pkgrel=1
pkgdesc="A video processing framework with simplicity in mind. (GIT version)"
arch=('x86_64')
url='http://www.vapoursynth.com'
license=('LGPL2.1' 'custom:OFL' 'custom:WFTPL')
depends=(
  'libzimg.so'
  'python'
)
makedepends=(
  'git'
  'cython'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'zimg-git'
)
provides=('vapoursynth')
conflicts=('vapoursynth')
source=(
  'git+https://github.com/vapoursynth/vapoursynth.git' #branch=doodle1'
  'vapoursynth.xml'
  'wtfpl.txt::http://www.wtfpl.net/txt/COPYING'
)
sha256sums=(
  'SKIP'
  '8e51579547d20cd7cb9618a47b3ac508423d09d76649bf038d0ab9acb850b068'
  '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5'
)
options=('debug')

pkgver() {
  cd vapoursynth
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  mkdir -p vapoursynth/doc/_static

  sed 's|VAPOURSYNTH_VERSION|$(top_srcdir)/VAPOURSYNTH_VERSION|g' -i vapoursynth/Makefile.am

}

build() {
  cd vapoursynth
  ./autogen.sh

  cd "${srcdir}/build"
  ../vapoursynth/configure \
    --prefix=/usr

  make

  (cd "${srcdir}/vapoursynth/doc"
    sphinx-build -b html -d _build/doctrees . _build/html
    sphinx-build -b man -d _build/doctrees . _build/man
  )
}

check() {
  make -C build DESTDIR="${srcdir}/fakeroot" install
  cd vapoursynth
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')" \
  PYTHONPATH="${srcdir}/fakeroot${_site_packages}:${_site_packages}" \
  LD_LIBRARY_PATH="${srcdir}/fakeroot/usr/lib" \
  python -m unittest discover -s test -p "*test.py" -v
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  cd vapoursynth

  install -Dm644 doc/_build/man/vapoursynth.3 "${pkgdir}/usr/share/man/man3/vapoursynth.3"
  install -Dm644 doc/_build/man/vspipe.1 "${pkgdir}/usr/share/man/man1/vspipe.1"
  (cd doc/_build/html; for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/share/doc/vapoursynth/${i}"; done)

  install -Dm644 "${srcdir}/vapoursynth.xml" "${pkgdir}/usr/share/mime/packages/vapoursynth.xml"

  install -Dm644 src/core/ter-116n.ofl.txt "${pkgdir}/usr/share/licenses/${pkgname}/ofl.txt"
  install -Dm644 "${srcdir}/wtfpl.txt" "${pkgdir}/usr/share/licenses/${pkgname}/wtfpl.txt"
}

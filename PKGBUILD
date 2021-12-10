# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile dot desu at gmail dot com>

pkgname=vapoursynth-git
pkgver=R57.47.geeae2eef
pkgrel=1
pkgdesc="A video processing framework with simplicity in mind. (GIT version)"
arch=('x86_64')
url='http://www.vapoursynth.com'
license=('LGPL2.1' 'custom:OFL' 'custom:WFTPL')
depends=('libzimg.so'
         'python'
         )
makedepends=('git'
             'cython'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'imagemagick'
             'libass.so'
             'tesseract'
             'libavformat.so'
             'libavcodec.so'
             'libavutil.so'
             'curl'
             'libarchive'
             )
provides=('vapoursynth')
conflicts=('vapoursynth'
           'vapoursynth-plugin-miscfilters'
           )
optdepends=('imagemagick: imwri plugin'
            'tesseract: OCR plugin'
            'libarchive: OCR plugin'
            'curl: OCR plugin'
            'libass.so: subtext plugin'
            'libavformat.so: subtext plugin'
            'libavcodec.so: subtext plugin'
            'libavutil.so: subtext plugin'
            )
source=('git+https://github.com/vapoursynth/vapoursynth.git' #branch=doodle1'
        'vapoursynth.xml'
        'wtfpl.txt::http://www.wtfpl.net/txt/COPYING'
        )
sha256sums=('SKIP'
            '8e51579547d20cd7cb9618a47b3ac508423d09d76649bf038d0ab9acb850b068'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5'
            )

pkgver() {
  cd vapoursynth
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  mkdir -p vapoursynth/doc/_static
}

build() {
  cd vapoursynth
  ./autogen.sh

  cd "${srcdir}/build"
  ../vapoursynth/configure \
    --prefix=/usr

  make

  make -C "${srcdir}/vapoursynth/doc" html man
}

check() {
  (cd build; make DESTDIR="$(pwd)/testdir" install)
  cd vapoursynth
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
  LD_LIBRARY_PATH=../build/testdir/usr/lib \
  PYTHONPATH=../build/testdir${_site_packages}:${_site_packages} \
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

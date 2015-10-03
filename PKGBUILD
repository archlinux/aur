# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile dot desu at gmail dot com>

pkgname=vapoursynth-git
pkgver=r27.117.g0abe37e
pkgrel=1
pkgdesc="A video processing framework with simplicity in mind. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.vapoursynth.com'
license=('LGPL2.1' 'custom:OFL' 'custom:WFTPL')
depends=('ffmpeg'
         'tesseract'
         'python'
         'imagemagick'
         'shared-mime-info'
         )
makedepends=('cython'
             'git'
             'yasm'
             'python-sphinx'
             )
provides=('vapoursynth')
conflicts=('vapoursynth')
source=('git+http://github.com/vapoursynth/vapoursynth.git'
        'vapoursynth.xml'
        'wtfpl.txt::http://www.wtfpl.net/txt/COPYING')
sha1sums=('SKIP'
          '71e04f8a7c177b44e4ce93e5eecbb4242a3c2215'
          '337ece375beddfdb7392699fd00eb9b3e823d03f')
install=vapoursynth-git.install

pkgver() {
  cd vapoursynth
  echo "$(git describe --long --tags | tr - . | tr R r)"
}

prepare() {
  mkdir -p vapoursynth/doc/_static
  cd vapoursynth
  ./autogen.sh
}

build() {
  cd vapoursynth
  ./configure --prefix=/usr \
              --enable-imwri
  make
  make -C doc man
}

package() {
  cd vapoursynth
  make DESTDIR="${pkgdir}" install
  install -Dm644 doc/_build/man/vapoursynth.3 "${pkgdir}/usr/share/man/man3/vapoursynth.3"
  install -Dm644 doc/_build/man/vspipe.1 "${pkgdir}/usr/share/man/man1/vspipe.1"
  install -Dm644 ../vapoursynth.xml "${pkgdir}/usr/share/mime/packages/vapoursynth.xml"
  install -Dm644 ofl.txt "${pkgdir}/usr/share/licenses/${pkgname}/ofl.txt"
  install -Dm644 ../wtfpl.txt "${pkgdir}/usr/share/licenses/${pkgname}/wtfpl.txt"
}

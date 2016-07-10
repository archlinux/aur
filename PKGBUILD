# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile dot desu at gmail dot com>

pkgname=vapoursynth-git
pkgver=r32.36.ge3b9f52
pkgrel=1
pkgdesc="A video processing framework with simplicity in mind. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.vapoursynth.com'
license=('LGPL2.1' 'custom:OFL' 'custom:WFTPL')
depends=('libzimg.so'
         'libass'
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
        'wtfpl.txt::http://www.wtfpl.net/txt/COPYING'
        )
sha1sums=('SKIP'
          '71e04f8a7c177b44e4ce93e5eecbb4242a3c2215'
          '337ece375beddfdb7392699fd00eb9b3e823d03f'
          )

pkgver() {
  cd vapoursynth
  echo "$(git describe --long --tags | tr - . | tr R r)"
}

prepare() {
  cd vapoursynth
  mkdir -p doc/_static

  ./autogen.sh
}

build() {
  cd vapoursynth
  ./configure \
    --prefix=/usr \
    --enable-imwri \
    --disable-static
  make
  make -C doc html man
}

package() {
  cd vapoursynth
  make DESTDIR="${pkgdir}" install

  install -Dm644 doc/_build/man/vapoursynth.3 "${pkgdir}/usr/share/man/man3/vapoursynth.3"
  install -Dm644 doc/_build/man/vspipe.1 "${pkgdir}/usr/share/man/man1/vspipe.1"
  (cd doc/_build/html; for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/share/doc/vapoursynth/${i}"; done)

  install -Dm644 "${srcdir}/vapoursynth.xml" "${pkgdir}/usr/share/mime/packages/vapoursynth.xml"

  install -Dm644 ofl.txt "${pkgdir}/usr/share/licenses/${pkgname}/ofl.txt"
  install -Dm644 "${srcdir}/wtfpl.txt" "${pkgdir}/usr/share/licenses/${pkgname}/wtfpl.txt"
}

# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: SneakySnake <radiantstatue@gmail.com>

_srcname=portaudio
pkgname=${_srcname}-svn_p
pkgver=r1954
pkgrel=1
pkgdesc='A Free, cross platform, open-source, audio I/O library.'
arch=('i686' 'x86_64')
url="http://www.portaudio.com"
license=('custom')
depends=('gcc-libs' 'jack')
makedepends=('subversion')
conflicts=('portaudio' 'portaudio-svn')
provides=('portaudio' 'portaudio-svn')
options=('!libtool')
source=("${_srcname}::svn+https://subversion.assembla.com/svn/portaudio/portaudio/trunk/"
    "portaudio-audacity.patch")
sha512sums=('SKIP'
            '86d14e1e984671593a9afdb5ec45bc944bd87610f32f8dde34f770eba067ff4a229400c3c0af403c32114c26ab43e5d81bcc70c742b0f6df864fd5ed3adf74af')

pkgver() {
  cd "${srcdir}/${_srcname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_srcname}"
  patch -p1 < "${srcdir}/portaudio-audacity.patch"
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr --enable-cxx
  make -j1
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

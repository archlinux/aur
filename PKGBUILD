# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname='sndpeek'
pkgver=1.41
pkgrel=2
pkgdesc='Real-time 3D animated audio visualization tool'
arch=('i686' 'x86_64')
url="https://www.gewang.com/software/${pkgname}"
license=('GPL-2.0-or-later')
depends=(
  'alsa-lib'
  'freeglut'
  'glu'
  'jack'
  'libsndfile'
  'libxmu'
)
provides=(
  'sndpeek-alsa'
  'sndpeek-jack'
)
conflicts=(
  'sndpeek-alsa'
  'sndpeek-jack'
)
source=("${url}/files/${pkgname}-${pkgver}.tgz")
sha256sums=('65530b6510d07c2088e5ffa2e4b11bdf8b872aa893913da96b6b018e74b24e4d')

_srcdir="${pkgname}-${pkgver}/src/${pkgname}"

prepare() {
  cd "${srcdir}/${_srcdir}"
  sed --in-place \
    -e 's|-D__LINUX_JACK__|-D__LINUX_JACK__ -D__UNIX_JACK__ -D__OS_LINUX__|' \
    -e 's|-D__LINUX_ALSA__|-D__LINUX_ALSA__ -D__OS_LINUX__|' \
    -e '/^\.o:/d' \
    -e 's|^\.c\.o:.*|%.o: %.c|' \
    -e 's|^\.cpp\.o:.*|%.o: %.cpp|' \
    -e 's|^INCLUDES=\(.*\)|INCLUDES=\1 $(ARCH_CFLAGS)|' \
    -e 's|^LIBS=\(.*\)|LIBS=\1 $(LDFLAGS)|' \
    makefile.alsa makefile.jack
}

build() {
  export ARCH_CFLAGS="${CFLAGS}"

  for _conf in alsa jack; do
    make --directory="${srcdir}/${_srcdir}" -f "makefile.${_conf}" clean
    make --directory="${srcdir}/${_srcdir}" -f "makefile.${_conf}"
    mv "${srcdir}/${_srcdir}/${pkgname}" "${srcdir}/${_srcdir}/${pkgname}-${_conf}"
  done
}

package() {
  for _conf in alsa jack; do
    install -D --mode=755 \
      "${srcdir}/${_srcdir}/${pkgname}-${_conf}" \
      "${pkgdir}/usr/bin/${pkgname}-${_conf}"
  done
}

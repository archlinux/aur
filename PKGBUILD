# Maintainer:  dummyx <dummyxa at gmail dot com>
# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fmtconv
pkgname=vapoursynth-plugin-${_plug}
pkgver=r23
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166504'
license=('custom:WTFPL')
depends=('vapoursynth')
conflicts=('vapoursynth-plugin-fmtconv-git')
#Dirty workaround for not breaking the dependencies.
provides=('vapoursynth-plugin-fmtconv-git')
source=("http://ldesoras.free.fr/src/vs/${_plug}-${pkgver}.zip")
sha256sums=('d2decc302094145490877a309680827cb369bd43277f49a47a30d8493d3830bc')

prepare() {
  cd build/unix
  autoreconf --verbose --install --force
}

build() {
  cd build/unix
  CPPFLAGS+=" $(pkg-config --cflags vapoursynth)" \
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth
  make
}

package(){
  make -C build/unix DESTDIR="${pkgdir}" install
  (cd doc; for i in *.{html,png,css}; do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done)
  install -Dm644 doc/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: jospehgbr <rafael.f.f1@gmail.com>

_pkgbase=libass
pkgname=lib32-${_pkgbase}
pkgver=0.13.2
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering (32 bit)"
arch=('x86_64')
url="https://github.com/libass/libass/"
license=('BSD')
depends=("${_pkgbase}"
'lib32-fontconfig>=2.10.92' 'lib32-fribidi' 'lib32-harfbuzz')
provides=('libass.so')
makedepends=('gcc-multilib' 'yasm')
source=("${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.xz")
md5sums=('1c8cbd5751aeb192bda04a65d0464fd9')

build() {
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export CC='gcc -m32'
  cd "$srcdir/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-linux-gnu \
	--enable-harfbuzz \
	--enable-fontconfig
  make
}

package() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}

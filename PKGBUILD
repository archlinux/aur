# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: jospehgbr <rafael.f.f1@gmail.com>

_pkgbase=libass
pkgname=lib32-${_pkgbase}
pkgver=0.12.2
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering (32 bit)"
arch=('x86_64')
url="https://github.com/libass/libass/"
license=('BSD')
depends=("${_pkgbase}"
'lib32-enca' 'lib32-fontconfig' 'lib32-fribidi' 'lib32-harfbuzz')
makedepends=('gcc-multilib' 'yasm')
source=("${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.xz")
md5sums=('d4b78e6a0794a9d386ece5cd08eb2d3e')

prepare() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  # force yasm to 32 bit
  sed -i -e 's|X64=true|X86=true|g' configure.ac
  sed -i -e 's|BITS=64|BITS=32|g' configure.ac
  sed -i -e 's|-DARCH_X86_64=1|-DARCH_X86_64=0|g' configure.ac
  sed -i -e 's|-m amd64|-m x86|g' configure.ac
}

build() {
  export CC='gcc -m32'
  cd "$srcdir/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 \
	--enable-enca \
	--enable-harfbuzz \
	--enable-fontconfig
  make
}

package() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/share/licenses
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

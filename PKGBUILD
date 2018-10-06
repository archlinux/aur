# Maintainer: Teteros <teteros at teknik dot io>

_pkgname=calf
pkgname=calf-ladspa
pkgver=0.0.19kx
pkgrel=2
pkgdesc="JACK audio plug-ins for musicians (Legacy LADSPA+RDF version)"
arch=(i686 x86_64)
url="http://calf-studio-gear.org/"
license=(LGPL)
depends=(fftw fluidsynth)
makedepends=(ladspa)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("http://urchlay.naptime.net/~urchlay/src/$_pkgname-$pkgver.tar.gz" "$_pkgname-$pkgver-gcc6.patch")
md5sums=('ba2147ddc53022ddf1ffdf28c3340a57' '66155856ccc4e0358d3bdf703ec0e414')

prepare(){
  cd "$_pkgname-$pkgver"
  patch -p1 < "${srcdir}/$_pkgname-$pkgver-gcc6.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  autoreconf -if
  ./configure \
    --prefix=/usr \
    --with-ladspa-dir=/usr/lib/ladspa \
    --disable-experimental \
    --enable-sse \
    --without-dssi \
    --without-lash \
    --without-lv2
  make
}

package() {
  cd "$_pkgname-$pkgver/src"
  install -Dm755 .libs/calf.so "${pkgdir}/usr/lib/ladspa/calf.so"
  install -dm755 "${pkgdir}/usr/share/ladspa/rdf"
  ./calfmakerdf > "${pkgdir}/usr/share/ladspa/rdf/calf.rdf"
}

# vim:set sw=2 ts=2 indentexpr=GetShIndent() et:

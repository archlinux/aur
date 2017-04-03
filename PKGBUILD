# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=calf
pkgname=calf-ladspa
pkgver=0.0.19kx
pkgrel=1
pkgdesc="JACK audio plug-ins for musicians (Legacy LADSPA+RDF version)"
arch=(i686 x86_64)
url="http://calf-studio-gear.org/"
license=(LGPL)
depends=(fftw fluidsynth)
makedepends=(ladspa)
source=("http://urchlay.naptime.net/~urchlay/src/$_pkgname-$pkgver.tar.gz" "$_pkgname-$pkgver-gcc6.patch")
md5sums=('ba2147ddc53022ddf1ffdf28c3340a57' '66155856ccc4e0358d3bdf703ec0e414')

prepare(){
    cd "$_pkgname-$pkgver"
    patch -p1 < "${srcdir}/$_pkgname-$pkgver-gcc6.patch"
}

build() {
    cd "${srcdir}/$_pkgname-$pkgver"
    autoreconf -if
    ./configure	\
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
    cd "${srcdir}/$_pkgname-$pkgver/src"
    msg2 "Copying LADSPA files for install..."
    mkdir -p "${pkgdir}/usr/lib/ladspa" "${pkgdir}/usr/share/ladspa/rdf"
    install .libs/calf.so "${pkgdir}/usr/lib/ladspa"
    msg2 "Generating RDF metadata..."
    ./calfmakerdf > "${pkgdir}/usr/share/ladspa/rdf/calf.rdf"
}

# vim:set ts=4 sw=4 et:

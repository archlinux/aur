# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="lasem"
pkgname="lasem02"
pkgver=0.2.1
pkgrel=1
pkgdesc="SVG and MathML rendering library"
arch=('x86_64')
url="https://github.com/LasemProject/${_name}"
license=('LGPL-2.1-or-later')
makedepends=('intltool>=0.35.0' 'pkgconf>=0.9.0' 'glib2-devel' 'perl>=5.8.1'
             'gobject-introspection')
depends=('glibc' 'glib2' 'gtk2>=2.16' 'gdk-pixbuf2>=2.16' 'cairo>=1.2' 'pango'
         'libxml2' 'harfbuzz')
provides=("${_name}=${pkgver}" "${_name}-0.2")
_pkgsrc="${_name}-${_name^^}_${pkgver//./_}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/LASEM_${pkgver//./_}.tar.gz"
        "itex2mml-1.6.1.tar.gz::https://golem.ph.utexas.edu/~distler/blog/files/itexToMML.tar.gz"
        "${pkgname}_fix_lsmmathmlutils_h.patch"
        "${pkgname}_fix_makefile_am.patch"
        "${pkgname}_fix_potfiles_in.patch")
noextract=("itex2mml-1.6.1.tar.gz")
sha256sums=('7bcad1cfa85b5c36743fae9e16f828c440210151c716a1268adf25a9e14fe70d'
            '3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f'
            '4aa69c1d61a04c97df670d23e46f52709b535510e01247ef59db342d878f8822'
            '46a4773b20990d6e27e65870983d01366c46f16aee09070389935281baaa825b'
            'b9c0d1ea7e5e6f1af8395a2c37ef429a49e65e0ad6dcb9f30ad7a9c9f751e59a')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/itex2mml-1.6.1"
  bsdtar -xzf "itex2mml-1.6.1.tar.gz" --strip-components 1 -C "${srcdir}/itex2mml-1.6.1"

  cd "${srcdir}/itex2mml-1.6.1/itex-src"
  cp -f "itex2MML"* "${srcdir}/${_pkgsrc}/itex2mml"

  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh \
    --prefix='/usr'
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"
}

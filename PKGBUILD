# Taken from the ABS
# Maintainer: David Koňařík <dvd.kon@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono-noconflict
pkgver=5.0.0.100
_pkgver=5.0.0
pkgrel=2
pkgdesc="A modified package of mono that renames csc to mono-csc to not conflict with chicken"
arch=(i686 x86_64)
license=("GPL" "LGPL2.1" "MPL")
url="http://www.mono-project.com/"
depends=("zlib" "libgdiplus>=4.2" "sh" "python" "ca-certificates")
makedepends=("cmake")
provides=("mono=${pkgver}" "monodoc")
conflicts=("mono" "monodoc")
install="${pkgname}.install"
source=(https://download.mono-project.com/sources/mono/mono-${pkgver}.tar.bz2
        mono.binfmt.d
        mono_context.patch)
sha256sums=("368da3ff9f42592920cd8cf6fa15c6c16558e967144c4d3df873352e5d2bb6df"
            "9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425"
            "9028f9c84bc035fb452712e92dbc62195fae1e8c5985c5ce45e75bc5e046f642")

build() {
  cd "${srcdir}"/mono-${_pkgver}
	
  # build mono
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-mcs-docs=no 
  make

  # build jay
  cd "${srcdir}"/mono-${_pkgver}/mcs/jay
  make
}

package() {
  cd "${srcdir}"/mono-${_pkgver}
  make DESTDIR="${pkgdir}" install

  # install jay
  pushd "${srcdir}"/mono-${_pkgver}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  popd

  # install binfmt conf file and pathes
  install -D -m644 "${srcdir}"/mono.binfmt.d "${pkgdir}"/usr/lib/binfmt.d/mono.conf

  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/usr/lib/pkgconfig/mono.pc
  sed -i -e "s:/2.0/:/4.5/:g" "${pkgdir}"/usr/lib/pkgconfig/mono-nunit.pc

  # rename csc to mono-csc to not conflict with chicken
  mv "${pkgdir}"/usr/bin/{,mono-}csc
}

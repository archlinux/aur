# $Id$
# Maintainer: Bjorn Nostvold <bjorn.nostvold@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono48
pkgver=4.8.1.0
_pkgver=4.8.1
pkgrel=1
pkgdesc="Free implementation of the .NET platform including runtime and compiler"
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=4.2' 'sh' 'python' 'ca-certificates' 'cmake')
provides=('monodoc' 'mono=4.8.1.0')
conflicts=('monodoc' 'mono')
install="${pkgname}.install"
source=(https://download.mono-project.com/sources/mono/mono-${pkgver}.tar.bz2
        mono.binfmt.d
	mono_context.patch)
sha256sums=('18cb38a670e51609c36c687ed90ad42cfedabeffd0a2dc5f7f0c46249eb8dbef'
            '9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425'
            '9028f9c84bc035fb452712e92dbc62195fae1e8c5985c5ce45e75bc5e046f642')

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
}

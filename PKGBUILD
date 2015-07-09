# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono-emby
_orig_pkgname=mono
pkgver=3.10.0
pkgrel=1
pkgdesc="Free implementation of the .NET platform including runtime and compiler - version 3.10 for use with emby-server package"
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL' 'custom:MITX11')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=3.8' 'sh' 'python')
options=('!makeflags')
provides=('monodoc' 'mono')
conflicts=('monodoc' 'mono')
source=(http://download.mono-project.com/sources/mono/${_orig_pkgname}-${pkgver}.tar.bz2
        mono.binfmt.d)

sha256sums=('fd74d1a6810d2d9b4733b4affbda67958e61520aade531c73103568dc18ab0b4'
            '9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425')

build() {
  cd "${srcdir}"/${_orig_pkgname}-${pkgver}

  # build mono
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --disable-quiet-build \
    --disable-system-aot \
    --disable-static \
    --with-mcs-docs=no
  make -j4

  # build jay
  cd "${srcdir}"/${_orig_pkgname}-${pkgver}/mcs/jay
  make
}

package() {
  cd "${srcdir}"/${_orig_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # install jay
  pushd "${srcdir}"/${_orig_pkgname}-${pkgver}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  popd

  # install binfmt conf file and pathes
  install -D -m644 "${srcdir}"/mono.binfmt.d "${pkgdir}"/usr/lib/binfmt.d/mono.conf

  #install license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_orig_pkgname}
  install -m644 mcs/MIT.X11 "${pkgdir}"/usr/share/licenses/${_orig_pkgname}/

  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/usr/lib/pkgconfig/mono.pc
}


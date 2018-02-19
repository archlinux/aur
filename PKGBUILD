# Maintainer: Zulu <aur@netz-mafia.de>

pkgname=mono-visualstudio
_pkgname=mono
pkgver=5.8.0.108
pkgrel=1
pkgdesc="The VS release channel contains packages which are shipped as part of a Visual Studio for Mac release. They are the most stable but also the least frequently updated packages."
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus' 'sh' 'python' 'ca-certificates')
makedepends=('cmake' 'mono')
provides=('mono=$(pkgver)' 'monodoc')
conflicts=('mono' 'monodoc')
replaces=('mono')
install="${_pkgname}.install"
source=(https://download.mono-project.com/sources/mono/${_pkgname}-${pkgver}.tar.bz2
        mono.binfmt.d)
sha256sums=('ecd7c55c2f62caa65fb360ace74a45ee44bbe2de046566d90594ba66c082f39c'
            '9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  # build mono
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-mcs-docs=no
  make

  # build jay
  cd "${srcdir}"/${_pkgname}-${pkgver}/mcs/jay
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # install jay
  pushd "${srcdir}"/${_pkgname}-${pkgver}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  popd

  # install binfmt conf file and pathes
  install -D -m644 "${srcdir}"/mono.binfmt.d "${pkgdir}"/usr/lib/binfmt.d/mono.conf

  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/usr/lib/pkgconfig/mono.pc
  sed -i -e "s:/2.0/:/4.5/:g" "${pkgdir}"/usr/lib/pkgconfig/mono-nunit.pc
}

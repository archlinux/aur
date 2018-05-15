# Maintainer: Zulu <aur@netz-mafia.de>

pkgname=mono-stable
_pkgname=mono
pkgver=5.12.0.226
pkgrel=1
pkgdesc="Stable version of free .NET implementation."
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus' 'sh' 'python' 'ca-certificates')
makedepends=('cmake' 'mono')
provides=("mono=${pkgver}" 'monodoc')
conflicts=('mono' 'monodoc')
install="${_pkgname}.install"
source=("https://download.mono-project.com/sources/mono/${_pkgname}-${pkgver}.tar.bz2"
        "mono.binfmt.d")
sha256sums=('f0636baa0c1399805526142e799cb697ddccf736e506cf1a30a870eaa2830a89'
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

# $Id: PKGBUILD 229096 2015-01-15 20:56:23Z daniel $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono-git
_pkgname=mono
pkgver=3.2.3.r8387.g5d93b2a
pkgrel=1
pkgdesc="Free implementation of the .NET platform including runtime and compiler"
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL' 'custom:MITX11')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=3.8' 'sh' 'python')
makedepends=('git')
options=('!makeflags')
provides=('monodoc' 'mono=3.12.0')
conflicts=('monodoc' 'mono')
source=(git://github.com/mono/mono.git
        mono.binfmt.d)
md5sums=('SKIP'
         'b9ef8a65fea497acf176cca16c1e2402')

pkgver() {
	cd ${srcdir}/${_pkgname}
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/mono.//;s/\.68//g'
}

build() {
  cd "${srcdir}"/${_pkgname}

  # build mono
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --disable-quiet-build \
    --disable-system-aot \
    --with-mcs-docs=no
  make

  # build jay
  cd "${srcdir}"/${_pkgname}/mcs/jay
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install

  # install jay
  pushd "${srcdir}"/${_pkgname}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  popd

  # install binfmt conf file and pathes
  install -D -m644 "${srcdir}"/mono.binfmt.d "${pkgdir}"/usr/lib/binfmt.d/mono.conf

  #install license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -m644 mcs/MIT.X11 "${pkgdir}"/usr/share/licenses/${_pkgname}/

  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/usr/lib/pkgconfig/mono.pc
}

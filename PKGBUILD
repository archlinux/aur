# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=fvwm
pkgver=2.7.0
pkgrel=6
pkgdesc="Fvwm2 - a virtual window manager. Only gets serious bugfixes. New version is Fvwm3."
arch=('x86_64')
url="http://www.fvwm.org"
license=('GPL-2.0-or-later' 'custom')
depends=('fribidi' 'perl' 'libstroke' 'libxpm' 'librsvg' 'libxinerama' 'libxcursor' 'python-xdg')
makedepends=('libxslt')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support')
options=('buildflags' '!emptydirs' '!makeflags')
source=(https://github.com/fvwmorg/fvwm/releases/download/${pkgver}/fvwm-${pkgver}.tar.gz
	fvwm.desktop
	Patch001-acinclude-m4-fix-implicit-fn-decl.patch
	Patch002-configure-ac_errors-implicit-ints-and-incomp-pointers.patch)
sha256sums=('66826dd60b774447170037d9078fd43e75f7230a49acfb84a988eebce7e3418b'
            '51d345f995f57c6d881d48bf535f71d75041a9bf1f0fa41dd99e1b22fd66aaf3'
            '89d759b202a519e6a1ab195f72c6b6822dc7824a56770241547b9a8b52feff80'
            '539c60357827763a27d8b69da08366330a74d674871b6bb3b672aba4ffd29910')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/Patch001-acinclude-m4-fix-implicit-fn-decl.patch
  patch -p1 -i "${srcdir}"/Patch002-configure-ac_errors-implicit-ints-and-incomp-pointers.patch
  autoreconf -i
}


build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-stroke-library --enable-mandoc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

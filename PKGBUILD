# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

pkgname=lib32-openmotif
pkgver=2.3.8
pkgrel=1
pkgdesc="Open Motif for x86"
arch=('x86_64')
url="https://motif.ics.com/"
license=('LGPL')
depends=('lib32-libxp' 'lib32-libxft' 'lib32-libxmu' 'lib32-libjpeg-turbo')
makedepends=('automake' 'gcc-multilib' 'libxft' 'xbitmaps' 'xproto' 'printproto' 'xextproto')
conflicts=('lesstif')
source=("https://downloads.sourceforge.net/project/motif/Motif%20${pkgver}%20Source%20Code/motif-${pkgver}.tar.gz"
        "disable_features.patch"
        "disable_rpath.patch")
sha256sums=('859b723666eeac7df018209d66045c9853b50b4218cecadb794e2359619ebce7'
            '73fc3788d250b99cedab3ddc2b95e7529135ae52bc54ebbcad7df0e49a1295fd'
            '3afd5cf9823979eaa6c8d2ac91b548d3e684ffb0c710f353265d6a798ace8686')

prepare() {
  cd "motif-${pkgver}"
  patch -p1 -i "../disable_features.patch"
  patch -p1 -i "../disable_rpath.patch"
}

build() {
  cd "motif-${pkgver}"
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LDFLAGS="-lX11 -Wl,-z,relro,-z,now"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "motif-${pkgver}"
  install -m 755 -d "${pkgdir}/usr/lib32"
  install -m 755 -t "${pkgdir}/usr/lib32" "lib/Mrm/.libs/libMrm.so.4.0.4"
  install -m 755 -t "${pkgdir}/usr/lib32" "lib/Xm/.libs/libXm.so.4.0.4"
  install -m 755 -t "${pkgdir}/usr/lib32" "clients/uil/.libs/libUil.so.4.0.4"
  # Add libraries symlinks
  cd "${pkgdir}/usr/lib32"
  ln -s "libMrm.so.4.0.4" "libMrm.so"
  ln -s "libMrm.so.4.0.4" "libMrm.so.4"
  ln -s "libXm.so.4.0.4" "libXm.so"
  ln -s "libXm.so.4.0.4" "libXm.so.4"
  ln -s "libUil.so.4.0.4" "libUil.so"
  ln -s "libUil.so.4.0.4" "libUil.so.4"
}

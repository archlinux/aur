# Maintainer : Bernhard Landauer <oberon@manjaro.org>

pkgname=clipit-gtk3
_pkgname=ClipIt
pkgver=1.4.3
pkgrel=1
pkgdesc="Lightweight clipboard manager gtk3-version"
arch=('i686' 'x86_64')
url="https://github.com/CristianHenzel/ClipIt/"
_snapshot=ea3e1c4dd53f022289dd1c4835200ce2eab8ec98
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3')
conflicts=('clipit')
makedepends=('intltool')
optdepends=('xdotool: for automatic paste')
source=("${_pkgname}-${_snapshot}.tar.gz::${url}/archive/${_snapshot}.tar.gz"
        'pkg-config.patch::https://github.com/0x4d4c/ClipIt/commit/f106391cd739bf4005600646561a7425faef2964.diff'        
        'fix_autotool_warnings.patch::https://github.com/0x4d4c/ClipIt/commit/0cbcc22d2cee837fac6ba0583bf5e420f3d10d4e.diff')
md5sums=('a79f0f6983325374327a3c0d7d990ca5'
         '81c12cc419951b9f308c3c733ae86448'
         'f9cb845c32a1c84ce9611fa0d910d9a3')

prepare() {
  cd "${srcdir}/${_pkgname}-${_snapshot}"
  msg2 "fixing some warnings and errors..."
  mv configure.in configure.ac
  patch -p1 < ../pkg-config.patch
  patch -p1 < ../fix_autotool_warnings.patch
  msg "done."
}

build() {
  cd "${srcdir}/${_pkgname}-${_snapshot}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-gtk3 \
    --enable-appindicator
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_snapshot}"
  make DESTDIR=${pkgdir} install
}

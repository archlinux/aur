# Maintainer : Bernhard Landauer <oberon@manjaro.org>

pkgname=clipit
_pkgname=ClipIt
pkgver=1.4.3
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager (fork of Parcellite)"
arch=('i686' 'x86_64')
url="https://github.com/CristianHenzel/ClipIt/"
_snapshot=a8de309ee006003ab3545d9abbe8c017a7400e62
license=('GPL3')
depends=('gtk2' 'libappindicator-gtk2')
makedepends=('intltool')
optdepends=('xdotool: for automatic paste')
source=("${_pkgname}-${_snapshot}.tar.gz::${url}/archive/${_snapshot}.tar.gz"
        'pkg-config.patch::https://github.com/0x4d4c/ClipIt/commit/f106391cd739bf4005600646561a7425faef2964.diff'        
        'fix_autotool_warnings.patch::https://github.com/0x4d4c/ClipIt/commit/0cbcc22d2cee837fac6ba0583bf5e420f3d10d4e.diff')
md5sums=('07a9c87b2384c6d9be1d2009cfd54e97'
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
    --enable-appindicator
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_snapshot}"
  make DESTDIR=${pkgdir} install
}

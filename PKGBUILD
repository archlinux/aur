# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=vala-panel-appmenu

pkgname=vala-panel-appmenu-common
pkgver=0.6.94
pkgrel=1
pkgdesc="Common libraries and translations for Vala Panel Application Menu"
url='https://github.com/rilian-la-te/vala-panel-appmenu'
arch=('any')
license=('LGPL3')
makedepends=('cmake')
conflicts=('vala-panel-appmenu-budgie-git'
           'vala-panel-appmenu-mate-git'
           'vala-panel-appmenu-translations-git'
           'vala-panel-appmenu-valapanel-git')

source=("https://github.com/rilian-la-te/vala-panel-appmenu/releases/download/${pkgver}/${_srcname}-${pkgver}.tar.gz"
        enable-only-common.diff)
sha512sums=('9ba216b2760bd8f7999c0731e80f231af67d30fd2d44f3a906d2dde0784683bb3c348556144b2e18166d0b38d3b4583ca4dd9655463b0ded6e1b5f1a248af5f7'
            'e4a9e5b4ebd2f601679f919f713e43030d6827d91ac0bbdb75dabb7dccecff87467b92fe8da70759c87730dedbe0092c62228f02b80395bfc8f721c9fbe4fc44')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}/data"
  patch -p0 -i ../../../enable-only-common.diff
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  cmake ./ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DENABLE_APPMENU_GTK_MODULE=OFF \
    -DENABLE_REGISTRAR=OFF \
    -DENABLE_JAYATANA=OFF \
    -DENABLE_MATE=OFF \
    -DENABLE_XFCE=OFF \
    -DENABLE_VALAPANEL=OFF \
    -DENABLE_BUDGIE=OFF \
    -DENABLE_ONLY_COMMON=ON

  make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make -C "po" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
}

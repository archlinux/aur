# Maintainer:Vadim Ushakov < igeekless@gmail.com >
pkgname=qk-git
pkgver=201612081042
pkgrel=1
pkgdesc="A GTK-based text editor designed for use by programmers. "
arch=('i686' 'x86_64')
url="https://github.com/sde-gui/qk"
license=('LGPL')
depends=('gtk2>=2.24.0' 'libsm' 'sde-reverse-meta-git')
optdepends=('ctags: Show functions in the open document')
makedepends=('txt2tags' 'python2' 'automake' 'intltool' 'libtool' 'pkgconfig' 'git')
options=('!libtool')
provides=('qk')
conflicts=('qk')
source=('git+https://github.com/sde-gui/qk.git')
md5sums=('SKIP')

_gitname="qk"

pkgver() {
  date +%Y%m%d%H%M
}

build() {
    if [ -f "$MAKEPKG_CONFIGURE_HOOK" ] ; then
        . "$MAKEPKG_CONFIGURE_HOOK"
    fi

    cd ${_gitname}

    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --libexec=/usr/lib \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --disable-maintainer-mode \
        --enable-silent-rules \
        --enable-dev-mode

    if [ -f "$MAKEPKG_BUILD_HOOK" ] ; then
        . "$MAKEPKG_BUILD_HOOK"
    fi

    make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install || return 1
  rm -rf "$pkgdir"/usr/share/icons/hicolor/icon-theme.cache
}

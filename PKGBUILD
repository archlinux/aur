# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=wxgtk-git
pkgver=3.2.0.r3.gdeffbf1623
pkgrel=1
pkgdesc="GTK+3 implementation of wxWidgets API for GUI"
arch=(x86_64)
url='https://www.wxwidgets.org'
license=('custom: wxWindows Library Licence')
depends=(gtk3 gst-plugins-bad libnotify libsecret)
makedepends=(git glu)
provides=(wxgtk3 wxgtk-common)
conflicts=(wxgtk3 wxgtk-common wxgtk2)
source=("wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#branch=3.2"
        "git+https://github.com/wxWidgets/Catch.git"
        "git+https://github.com/wxWidgets/pcre.git"
        "git+https://github.com/wxWidgets/nanosvg")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd wxwidgets
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wxwidgets
  git config submodule.3rdparty/catch.url "${srcdir}/Catch"
  git submodule update --init 3rdparty/catch

  git config submodule.3rdparty/pcre.url "${srcdir}/pcre"
  git submodule update --init 3rdparty/pcre

  git config submodule.3rdparty/nanosvg.url "${srcdir}/nanosvg"
  git submodule update --init 3rdparty/nanosvg

  ./autogen.sh
}

build() {
  cd wxwidgets
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-gtk=3 \
    --with-opengl \
    --enable-unicode \
    --enable-graphics_ctx \
    --enable-mediactrl \
    --enable-webview \
    --with-regex=builtin \
    --with-libpng=sys \
    --with-libxpm=sys \
    --with-libjpeg=sys \
    --with-libtiff=sys \
    --disable-precomp-headers
  make
  make -C locale allmo
}

package() {
  cd wxwidgets
  make DESTDIR="$pkgdir" install
  install -D -m644 docs/licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

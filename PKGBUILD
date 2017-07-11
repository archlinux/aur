# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=uim-debian
pkgver=1.8.6+gh20161003.0.d63dadd
_debrel=2.1
pkgrel=2.1
pkgdesc='Multilingual input method library with Debian patches (supports gtk3 and qt5)'
url='https://packages.debian.org/sid/uim'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('libxft' 'libedit' 'm17n-lib')
makedepends=('intltool' 'gettext' 'gtk2' 'gtk3' 'qt4' 'qt5-base' 'qt5-x11extras' 'anthy')
optdepends=('qt4: immodule and helper applications'
            'qt5-base: immodule and helper applications'
            'gtk2: immodule and helper applications'
            'gtk3: immodule and helper applications')
conflicts=('uim')
provides=('uim')
install=${pkgname}.install
source=("http://http.debian.net/debian/pool/main/u/uim/uim_${pkgver}.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/u/uim/uim_${pkgver}-${_debrel}.debian.tar.xz")
sha256sums=('7a2d1667553afc0bca4cc33f9bc8fb01a6867177d2a3e13b1b85c7add16110e9'
            'dcb22e33d1891932da6a3d8a35fee758535d080fda78312afd79d201ad5fb31d')

prepare() {
    cd "${srcdir}/uim-${pkgver}"

    while read p; do

      if [[ "$p" == "qt5-immodule-qmake-conf.patch" ]]; then
          ispushed="yes"
          pushd qt5/immodule/
      else
          ispushed="no"
      fi

      patch -p1 -i "${srcdir}/debian/patches/${p}"

      [[ "$ispushed" == "yes" ]] && popd

    done < "${srcdir}/debian/patches/series"

    sed -i.bak 's/load(qt_plugin)/TEMPLATE = lib\nCONFIG += plugin/' \
        "${srcdir}/uim-${pkgver}/qt5/immodule/quimplatforminputcontextplugin.pro.in"
}

build() {
    cd "${srcdir}/uim-${pkgver}"

    export QT_SELECT=qt5

    ./configure \
        --disable-rpath \
        --prefix=/usr \
        --libexecdir=/usr/lib/uim \
        --with-anthy-utf8 \
        --with-gtk \
        --with-gtk3 \
        --with-qt4 \
        --with-qt4-immodule \
        --with-qt5 \
        --with-qt5-immodule

    make
}

package() {
    cd "${srcdir}/uim-${pkgver}"
    make DESTDIR="${pkgdir}" install -j1 # FS#41112
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

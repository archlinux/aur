# $Id: PKGBUILD 270895 2016-07-03 16:55:41Z bisson $
# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=uim-debian
pkgver=1.8.6+gh20160630.0.c408e95
_debrel=1
pkgrel=1
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
sha1sums=('ef6b319dedf921f410cfc39ea6912dc79dddf79b'
          '96b3f4bc5a18220744b4489d2c2a3dd3fde40091')

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

    msg "prepare() done."
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
        --with-qt5-immodule \

    make
}

package() {
    cd "${srcdir}/uim-${pkgver}"
    make DESTDIR="${pkgdir}" install -j1 # FS#41112
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

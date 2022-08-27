# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia
pkgver=0.97.3
pkgrel=9
pkgdesc="A GTK+ based diagram creation program"
arch=('x86_64')
license=('GPL')
url="http://live.gnome.org/Dia"
depends=('libxslt' 'gtk2')
makedepends=('intltool' 'python2' 'docbook-xsl')
# See https://github.com/GNOME/dia/commit/75ca7c555871f12549a03e9a2933f68c31a2c2a0
# Patches for python3, but no releases. We remove optdepends regardless
#optdepends=('python')
options=('docs' '!emptydirs')
source=("https://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.97/${pkgname}-${pkgver}.tar.xz"
        'dia-0.9.3-cve-2019-19451.patch')
sha256sums=('22914e48ef48f894bb5143c5efc3d01ab96e0a0cde80de11058d3b4301377d34'
            '32cecad212fbd0f87f304d9eaf48f8b3d6555b10733ead5a3943bac778bf8586')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # for file in `find -type f -name '*.py'`; do
  #     sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' "$file"
  # done
  # sed -i 's#python2\.1#python2 python2.1#' configure
  sed -i 's#freetype-config --cflags#pkg-config --cflags freetype2#' configure
  sed -i 's#freetype-config --libs#pkg-config --libs freetype2#' configure

  # FS#71257
  patch -Np1 -i "${srcdir}/dia-0.9.3-cve-2019-19451.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export PYTHON=/usr/bin/python2
  ./configure --prefix=/usr \
    --with-cairo \
    --with-python \
    --disable-gnome \
    --with-hardbooks
  sed -i 's#SUBDIRS = lib objects plug-ins shapes app bindings samples po sheets data doc tests installer#SUBDIRS = lib objects plug-ins shapes app bindings samples po sheets data tests installer#' Makefile
  make
  cd doc
  make html
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd doc
  make DESTDIR="${pkgdir}" install-html
  ln -sf ../doc/dia/html "${pkgdir}"/usr/share/dia/help
}

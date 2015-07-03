# $Id: PKGBUILD 140113 2011-10-07 08:18:56Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-sched-policy
pkgver=2.30.0
pkgrel=1
pkgdesc="Common C routines used by GTK+ and other libs. Patched to allow a multithreaded process to have a real time scheduling policy."
url="http://www.gtk.org/"
arch=(i686 x86_64)
license=('LGPL')
depends=('pcre' 'libffi')
makedepends=('pkgconfig' 'python2')
optdepends=('python2: for gdbus-codegen')
provides=("glib2=$pkgver")
conflicts=("glib2")
options=('!libtool' '!docs' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/glib/2.30/glib-${pkgver}.tar.xz
        glib2.sh
        glib2.csh
        sched-policy.patch)
sha256sums=('d64c00b43409eabb89aad78501fcb1a992b002b314a4414a9bd069585cb7cdc1'
            '9456872cdedcc639fb679448d74b85b0facf81033e27157d2861b991823b5a2a'
            '8d5626ffa361304ad3696493c0ef041d0ab10c857f6ef32116b3e2878ecf89e3'
            "1869628f31724adc6145d7d0fc48147acce7e5b01d57ef1b0d483617a4eefd18")

build() {
  cd "${srcdir}/glib-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam
  patch -p1 < "${srcdir}/sched-policy.patch" || return 1
  make
}

package() {
  cd "${srcdir}/glib-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/glib2.sh" "${pkgdir}/etc/profile.d/"
  install -m755 "${srcdir}/glib2.csh" "${pkgdir}/etc/profile.d/"

  for _i in "${pkgdir}/etc/bash_completion.d/"*; do
      chmod -x "${_i}"
  done
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" "$pkgdir"/usr/bin/gdbus-codegen
}

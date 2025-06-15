# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: "ilpianista" Andrea Scarpino <andrea@archlinux.org>
# Contributor: "bidulock" Brian Bidulock <bidulock@openss7.org>
# Contributor: SpepS <dreamspepser@yahoo.it>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=esound
pkgdesc='Enlightened Sound Daemon'
pkgver=0.2.41
pkgrel=4
url="https://gitlab.gnome.org/Archive/${pkgname}"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
makedepends=('autoconf' 'automake' 'libtool')
depends=('audiofile' 'alsa-lib' 'glibc' 'sh')
provides=("esd=${pkgver}")
conflicts=('esd')
options=('!libtool')
backup=('etc/esd.conf')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/ESOUND_${pkgver//./_}/${pkgname}-ESOUND_${pkgver//./_}.tar.bz2"
        "esound.service"
        "0001-fix-replace-alsa-drain.patch"
        "0002-fix-missing-declaration-for-clean_exit.patch"
        "0003-feat-add-nobeeps-to-the-default_options.patch"
        "0004-fix-wrong-micro-version.patch")
b2sums=('db1945ee0b5514bb2d5b98e295e71bcf368124c607c7bf3b34189e36d8212da13eed819cc7aa15bf7c876677b6a48a1d1afa1312c6ab9cfb675a33e452acb13d'
        'd45edf8d66b02273e262562db7558d56aea73e33737da6440a702aeb33cdeeaca32876de3e6c4fbff870625ae4d4fe6e5a8d0df914f45ba9e13aa7d922516bba'
        '3c9865c43e8df414e7e7cb6753d88a00dc5859f4ce6272a3e668b442b6d8d4764eaf8c1bef28b5da76ebf26f34b6b30a59fb404f61eb408f0f4889d6c49b8f41'
        '8eecd762786fb864e80613d685d66979824600e0b8da0161fdef3a486f592bad1078f7b46afbb45bbd866e50682c6ddcfb0f30cf0d0155516955b4bf3f9b3259'
        'b6257eb182838082e366d0dc9836e3fd950f26ecbf9c4dad0c869be492bf3c6c71f661823e586000d42f26381e777cbced96d7c12aca0d9c8f516d3ff77b76bf'
        '90c8a34fd771d5cd55f647d87a958aae9b131772086386bfe71b8e9b01142d88cdac276dac52f6863ab778983816c8fe8d26e07e8fd5ba5259e7aa31014a7a32')

prepare() {
  cd "${srcdir}/${pkgname}-ESOUND_${pkgver//./_}"

  patch -i "${srcdir}/0001-fix-replace-alsa-drain.patch"
  patch -i "${srcdir}/0002-fix-missing-declaration-for-clean_exit.patch"
  patch -i "${srcdir}/0003-feat-add-nobeeps-to-the-default_options.patch"
  patch -i "${srcdir}/0004-fix-wrong-micro-version.patch"

  autoreconf --install --force
}

build() {
  cd "${srcdir}/${pkgname}-ESOUND_${pkgver//./_}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-alsa \
              --enable-ipv6 \
              --without-libwrap \
              --disable-static \
              --disable-artstest

  make CFLAGS="${CFLAGS} -lm"
}

package() {
  cd "${srcdir}/${pkgname}-ESOUND_${pkgver//./_}"

  make DESTDIR="${pkgdir}" install

  # daemon
  install -Dm644 ../esound.service "${pkgdir}"/usr/lib/systemd/system/esound.service
}

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
depends=('audiofile')
provides=("esd=${pkgver}")
conflicts=('esd')
options=('!libtool')
backup=('etc/esd.conf')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/ESOUND_${pkgver//./_}/${pkgname}-ESOUND_${pkgver//./_}.tar.bz2"
        "esound.service")
b2sums=('db1945ee0b5514bb2d5b98e295e71bcf368124c607c7bf3b34189e36d8212da13eed819cc7aa15bf7c876677b6a48a1d1afa1312c6ab9cfb675a33e452acb13d'
        '086e6787524f28ffc0f8007e1ce2743129ac59980020699f3985dd3a10468b338d5a1f70189634cca8c7cdcec722ed06761542f1effb9210e0423e94e6a5324f')

prepare() {
  cd "${srcdir}/${pkgname}-ESOUND_${pkgver//./_}"

  # alsa drain fix
  sed -i 's/drain/drop/' audio_alsa09.c

  autoreconf --install --force
}

build() {
  cd "${srcdir}/${pkgname}-ESOUND_${pkgver//./_}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-alsa \
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

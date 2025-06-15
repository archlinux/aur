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
depends=('audiofile')
provides=("esd=${pkgver}")
conflicts=('esd')
options=('!libtool')
backup=('etc/esd.conf')
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2"
        "esound.service")
b2sums=('39403985557f44b99a6615e42f6772a31b8555cc3bf252140e36f55c812b4728ca7af519267ff1c8f4bd53604d82edbf682d07b16e98158ca39bbe8663bbaadd'
        '086e6787524f28ffc0f8007e1ce2743129ac59980020699f3985dd3a10468b338d5a1f70189634cca8c7cdcec722ed06761542f1effb9210e0423e94e6a5324f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # alsa drain fix
  sed -i 's/drain/drop/' audio_alsa09.c

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-alsa \
              --with-audiofile \
              --without-libwrap \
              --disable-static \
              --disable-artstest
  make CFLAGS="${CFLAGS} -lm"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # daemon
  install -Dm644 ../esound.service "${pkgdir}"/usr/lib/systemd/system/esound.service
}

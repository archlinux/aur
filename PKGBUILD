# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: "ilpianista" Andrea Scarpino <andrea@archlinux.org>
# Contributor: "bidulock" Brian Bidulock <bidulock@openss7.org>
# Contributor: SpepS <dreamspepser@yahoo.it>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=esound
pkgdesc='Enlightened Sound Daemon'
pkgver=0.2.41
pkgrel=8
url='https://gitlab.gnome.org/Archive/esound'
arch=(i686 x86_64)
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
checkdepends=('psmisc' 'tcsh')
makedepends=('autoconf' 'automake' 'libtool')
depends=('audiofile' 'alsa-lib' 'glibc' 'sh')
optdepends=('pipewire-alsa: User service for the PipeWire stack')
provides=("esd=${pkgver}")
conflicts=('esd')
options=(!libtool)
backup=('etc/esd.conf')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/ESOUND_${pkgver//./_}/${pkgname}-ESOUND_${pkgver//./_}.tar.bz2"
        'esound-system.service'
        'esound-user.service'
        '0001-alsa-drain-hang.patch'
        '0002-undeclared-variable.patch'
        '0003-fix-audsp-crash.patch'
        '0004-link-to-libm.patch'
        '0005-missing-declaration-GCC-15.patch'
        '0006-revert-close-file-descriptors.patch'
        '0007-fix-wrong-micro-version.patch'
        '0008-move-nobeeps-option.patch')
b2sums=('db1945ee0b5514bb2d5b98e295e71bcf368124c607c7bf3b34189e36d8212da13eed819cc7aa15bf7c876677b6a48a1d1afa1312c6ab9cfb675a33e452acb13d'
        '1b55880c8212f2e85312c632ab79f1ff36d527c7463aa16fb932f324c496a5a67d109372aff657b59812b9fabe8c5978434e078e7a91868298731ab11ea48f2d'
        'b84310149765ca3caa7b0b93298af758b0ffbb04b16c3946b3fc8e0ad4e559d7f6221a956dd30a8f01a5e60d85386431078619b683e0d6a447bc1c9363a00e27'
        'f38ea2eb133785674f619fc136cab48d52a4e2dbe15f9167b0ca9176da6276d3ec88ec5beabdac6d058b745bd3f095e75a0b10b0f9b8650a03ec5e166f07302e'
        '14fad36f08c028fc95e8dd2398142e75df76deb590d14427a7bcaaca7067a85aaa675b1b295baac94d32fbbd569d0832213025391bffc0f0859387b7827e304d'
        '4a6827d573255e8de82f12d4816e794c694d2547e6de4a195ffb5d2a860b50b2c080f47c79618c3ac433b9a0a7d35c1746113d6a5eaa29eafbcbbcc545646b65'
        'f2e05a5768a14b904777b566a0441bda7bdbdcbe477249a2596941c95a468d81a944cf0f43796ce1337de137e2e0f88c7744dc6f6b7fae0d2399a4b2452a7a55'
        '99b20a85e900dd989bd8bedaa6b8dea605ecbe4e0e47bce9663d4713e85b4e99585095a3195de1f15cdbbbcd9e28916b08147c5cbc9d8b983be645d0c8ff7a90'
        '661a54584c7a8f02633ae12c50a0b9416d59ff148352dba612d17476e55a74381510dc32d37ea79e5483630458a68f29abd0a4ce0aa5d2f8428c127687dc4a1a'
        '323ccd84f13826388ac33130f27e64c7b756085f31719db4c16330a99be47727609bc3391168c920e3c75f5deb42f1e2ea8a0ec450069ebac3ff294d969de389'
        '78f98a3bad6f65928aa80fd5cb5beb488541f00d884efb1918a37cf7d451751ae205dadee554de124c01f69de0b5acc578c08aec3fc769e7d751dd5a56b63500')

prepare() {
  cd "${pkgname}-ESOUND_${pkgver//./_}"

  patch -t -Np1 -i ../0001-alsa-drain-hang.patch
  patch -t -Np1 -i ../0002-undeclared-variable.patch
  patch -t -Np1 -i ../0003-fix-audsp-crash.patch
  patch -t -Np1 -i ../0004-link-to-libm.patch
  patch -t -Np1 -i ../0005-missing-declaration-GCC-15.patch
  patch -t -Np1 -i ../0006-revert-close-file-descriptors.patch
  patch -t -Np1 -i ../0007-fix-wrong-micro-version.patch
  patch -t -Np1 -i ../0008-move-nobeeps-option.patch

  aclocal
  libtoolize --no-warnings
  autoreconf --install
  automake --add-missing
  autoreconf
}

build() {
  cd "${pkgname}-ESOUND_${pkgver//./_}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-alsa \
    --enable-ipv6 \
    --without-libwrap \
    --disable-static \
    --disable-artstest

  make
}

check() {
  cd "${pkgname}-ESOUND_${pkgver//./_}"

  ESD_DEBUG=1 ./esd -d null &
  local server_pid=$!

  printf 'q\n%.0s' {1..10} | PATH="${PATH}:${PWD}" tcsh -e test-script

  kill "${server_pid}"
  wait "${server_pid}"
}

package() {
  cd "${pkgname}-ESOUND_${pkgver//./_}"

  make DESTDIR="${pkgdir}" LIBTOOLFLAGS='--no-warnings' install

  # daemon
  install -vD -m644 ../esound-system.service -T "${pkgdir}/usr/lib/systemd/system/esound.service"
  install -vD -m644 ../esound-user.service -T "${pkgdir}/usr/lib/systemd/user/esound.service"
}

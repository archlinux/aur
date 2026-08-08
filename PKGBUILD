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
        '9fdfe5d289261a8bd9df6cca99e996df5ad066e7d7c0a9027e6e3387162ed5651f947b24cd1fcb3803b27e49a187896511288efe6350a1fb620a60872a3c79a6'
        'd5e93656661227eb8d95f11a9f6dbe452c0986e755b6e624d4047d16a28d74ff0ea460a01041bd1ccbb6e75ed7d00abd5395eaef53412f2cd98117ed57346914'
        '3984415f9f483933b5908b7bb9d3538e45db6fe12866fc62079e2471e51182ed6baf549d8704c5e815628d0f077a503191f0bd8b04bc73420b9eb03075e4be24'
        'cf74b68bca9bb2a81e4ef52dc7149ec628ffbc5be8cb9ee3bedf0685f8fae21215b9620b7743cc5c9f817d4ae908214a65f807438da36d336f38292f24570e5a'
        '463040b7041a432ce6e311d4059d3ffeab3dd20b40044683c974f470821c9e5cd979c30d2c3650305a01a73be7cd8ab103f36af013dc411ca58cdbe4d662ded4'
        '6959a1f8bc05a28cf6fb8c725596cd4b05ee149202b291404ff0d72d3b4490fd72d48a101094907cfcfa7e027332f90f5982229e3c9a7787ed778eb12fed75e0'
        '34615dceab85e4b258e41cbe22791a846e57643d9d959bc8b66878da5fc3ce28772fa37a1688d5f8d7c250807759d32064b731ce2aead37fd8ea69a1c44ed700'
        '9c582773f7d754a54af4035c31edf504b78406048d2ef1cfea462f3e34dacbee9b67d10d2e028c58c5bd1765034534b7f61cc07d9e6692bbdfe0a3c7ed070f62')

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
    --with-audiofile \
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

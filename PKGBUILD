# Maintainer: Jerzy Kolosowski <jerzy@kolosowscy.pl>
# Merged with official ABS gnupg PKGBUILD by João, 2021/07/23 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Stephanie Wilde-Hobbs <git@stephanie.is>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alphazo@gmail.com
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: @holos

pkgname=gnupg23
pkgver=2.3.4
pkgrel=0
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=(GPL)
arch=($CARCH)
# checkdepends=(openssh fig2dev)
makedepends=(git libldap libusb-compat pcsclite fig2dev)
conflicts=(${pkgname%23})
provides=(${pkgname%23}=${pkgver})
depends=(npth libgpg-error libgcrypt libksba libassuan pinentry libbz2.so readline libreadline.so gnutls sqlite zlib)
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
source=("https://gnupg.org/ftp/gcrypt/${pkgname%23}/${pkgname%23}-${pkgver}.tar.bz2"{,.sig}
	"drop-import-clean.patch")
sha256sums=('f3468ecafb1d7f9ad7b51fd1db7aebf17ceb89d2efa8a05cf2f39b4d405402ae'
            'SKIP'
            '2d573d1a5a0d0272b0be0d70e6dabf2d8c7897e873ace4ce7fffd6e96599a30a')
install=gnupg23.install

prepare() {
  cd "${srcdir}/${pkgname%23}-${pkgver}"
  patch -p1 -i ../drop-import-clean.patch

  # improve reproducibility
  rm doc/gnupg.info*

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname%23}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gnupg \
    --enable-maintainer-mode \

  make
}

check() {
  cd "${srcdir}/${pkgname%23}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname%23}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -s gpg "${pkgdir}"/usr/bin/gpg2
  ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

  install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
}

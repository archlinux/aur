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

pkgname=gnupg-git
pkgver=2.3.2_r9343.g25ae80b8e
pkgrel=2
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=(GPL)
arch=($CARCH)
# checkdepends=(openssh fig2dev)
makedepends=(git libldap libusb-compat pcsclite)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=(npth libgpg-error libgcrypt libksba libassuan pinentry libbz2.so readline libreadline.so gnutls sqlite zlib)
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
source=("git+https://github.com/gpg/${pkgname%-git}.git"
		drop-import-clean.patch)
sha256sums=('SKIP'
            '5b76faf39092fe6324d9fc058d9b3a22c2a47cc1964de2afe98093c6d86e7de0')
install=gnupg-git.install

pkgver() {
  cd ${pkgname%-git}
  echo "$(cat VERSION)_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  patch -p1 -i ../drop-import-clean.patch

  ./autogen.sh
}

build() {
  cd ${pkgname%-git}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gnupg \
    --enable-maintainer-mode \

  make
}

# check() {
#   cd ${pkgname%-git}
#   make check
# }

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" install
  ln -s gpg "${pkgdir}"/usr/bin/gpg2
  ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

  install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
}

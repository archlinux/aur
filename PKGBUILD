# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg24
pkgver=2.4.3
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
arch=('x86_64')
url='https://www.gnupg.org/'
license=(BSD custom custom:CC0 GPL2 GPL3 LGPL3 LGPL2.1 MIT)
depends=(
  'bzip2' 'libbz2.so'
  'glibc'
  'gnutls'
  'libgcrypt'
  'libgpg-error'
  'libksba'
  'libassuan' 'libassuan.so'
  'npth' 'libnpth.so'
  'pinentry'
  'readline' 'libreadline.so'
  'sqlite'
  'zlib'
)
makedepends=('libldap' 'libusb-compat' 'pcsclite')
conflicts=(${pkgname%24})
provides=(${pkgname%24}=${pkgver})
checkdepends=('openssh')
optdepends=(
  'libldap: gpg2keys_ldap'
  'libusb-compat: scdaemon'
  'pcsclite: scdaemon'
)
install=$pkgname.install
source=(
  "https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2"{,.sig}
  'avoid-beta-warning.patch'
)
sha256sums=('a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d'
            'SKIP'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d')
b2sums=('b7f4f5e548ec6dfc89cf8792f507ee8642e8500692998cf8d2edc9f5d8002904d24a714b9caffabee6094707c4595e0f54197535135622a7a32aa772f5818f28'
        'SKIP'
        '7ea069e81e2d91a3154bcb62516b4b599f34596de277f95ad1ccaba73869c4f84f94f063b65026ba0bc8a72c0fd8e8e182b82346964f67ea78166b6399c923c5')
validpgpkeys=(
  '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28' # Andre Heinecke (Release Signing Key)
  '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
  'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD' # Niibe Yutaka (GnuPG Release Key)
  '02F38DFF731FF97CB039A1DA549E695E905BA208' # GnuPG.com (Release Signing Key 2021)
)

prepare() {
  cd "${pkgname%24}-${pkgver}"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # improve reproducibility
  rm doc/gnupg.info*

  # in-tree builds are no longer supported
  rm -rf build
  mkdir -p build
  
  ./autogen.sh
}

build() {
  cd "${pkgname%24}-${pkgver}"/build
  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gnupg \
    --enable-maintainer-mode \

  make
}

check() {
  cd "${pkgname%24}-${pkgver}"/build
  make check
}

package() {
 #Removed in gpg 2.4.1
 # local units=({dirmngr,gpg-agent{,-{browser,extra,ssh}}}.socket)
 # local socket_target_dir="$pkgdir/usr/lib/systemd/user/sockets.target.wants/"
 # local unit

  cd "${pkgname%24}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
  ln -s gpg "${pkgdir}"/usr/bin/gpg2
  ln -s gpgv "${pkgdir}"/usr/bin/gpgv2
  cd ..
 # install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm 644 COPYING.{CC0,other} -t "${pkgdir}/usr/share/licenses/$pkgname/"

 # install -vdm 755 "$socket_target_dir"
 # for unit in "${units[@]}"; do
 #   ln -sv "../$unit" "$socket_target_dir$unit"
 # done
}

# vim: ts=2 sw=2 et:

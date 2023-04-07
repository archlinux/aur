# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg24
pkgver=2.4.0
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
sha256sums=('1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483'
            'SKIP'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d')
b2sums=('cc4bcd439a3283df5932c0c41873a3b85de07103d9164ec6dc44552fa0d8c5e5973d74dcd3ffd3d4cf0564c9dab66c6e2adbcd7b34bbc4b5faf0f1bf0f3836aa'
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
  local units=({dirmngr,gpg-agent{,-{browser,extra,ssh}}}.socket)
  local socket_target_dir="$pkgdir/usr/lib/systemd/user/sockets.target.wants/"
  local unit

  cd "${pkgname%24}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
  ln -s gpg "${pkgdir}"/usr/bin/gpg2
  ln -s gpgv "${pkgdir}"/usr/bin/gpgv2
  cd ..
  install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm 644 COPYING.{CC0,other} -t "${pkgdir}/usr/share/licenses/$pkgname/"

  install -vdm 755 "$socket_target_dir"
  for unit in "${units[@]}"; do
    ln -sv "../$unit" "$socket_target_dir$unit"
  done
}

# vim: ts=2 sw=2 et:

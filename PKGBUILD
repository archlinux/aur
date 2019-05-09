# I don't know if conflicting coreutils will result in massive pain.
#
# Original maintainers can't be blamed for this.
# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=coreutils-kondo
pkgver=8.31
pkgrel=1
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system, with extra joy.'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
groups=('base')
conflicts=('coreutils')
provides=('coreutils')
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
source=("https://ftp.gnu.org/gnu/coreutils/coreutils-$pkgver.tar.xz"
        "0001-Marie-Kondo.patch"
  )
md5sums=('0009a224d8e288e8ec406ef0161f9293'
         '8a5cfc66b5036c6c2c6be875dbc8ce11')

prepare() {
  cd coreutils-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd coreutils-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program=groups,hostname,kill,uptime
  make
}

check() {
  cd coreutils-$pkgver
  #make check
}

package() {
  cd coreutils-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

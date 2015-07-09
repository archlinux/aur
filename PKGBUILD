# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janax <janax99@yahoo.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-pam
pkgver=1.2.0
pkgrel=1
pkgdesc='PAM (Pluggable Authentication Modules)'
arch=('x86_64')
url='http://linux-pam.org'
license=('GPL2')
depends=('lib32-cracklib' 'lib32-libtirpc' 'pam')
makedepends=('gcc-multilib' 'lib32-flex')
source=("http://linux-pam.org/library/Linux-PAM-$pkgver.tar.bz2"
        'https://sources.archlinux.org/other/pam_unix2/pam_unix2-2.9.1.tar.bz2'
        'pam_unix2-glibc216.patch')
sha256sums=('cd8beac5961e942e9c73b32a3cd1a3457755f8fb35d07c9ec64511e19e135ea4'
            '3315747699fece4e1cc5771885d243b3e017c4c4ca1326e86228d590a840e955'
            '6644c5cff46878c65bdc77977becbeda392675702264bfcc7c610a45a9982574')
options=('!emptydirs')

prepare () {
  cd pam_unix2-2.9.1

  patch -Np1 -i ../pam_unix2-glibc216.patch
}

build() {
  cd Linux-PAM-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sbindir='/usr/bin' \
    --disable-db
  make

  cd ../pam_unix2-2.9.1

  export CFLAGS="$CFLAGS -I"${srcdir}"/Linux-PAM-${pkgver}/libpam/include/"
  export LDFLAGS="$LDFLAGS -L"${srcdir}"/Linux-PAM-${pkgver}/libpam/.libs/"

  ./configure --prefix='/usr' \
              --libdir='/usr/lib32' \
              --sbindir='/usr/bin'
  make
}

package() {
  cd Linux-PAM-${pkgver}

  make DESTDIR="${pkgdir}" SCONFIGDIR='/etc/security' install
  rm -rf "${pkgdir}"/{etc,usr/{include,share,bin}}

  cd ../pam_unix2-2.9.1

  install -m 644 src/pam_unix2.so "${pkgdir}"/usr/lib32/security/

  cd "${pkgdir}"/usr/lib32/security

  ln -s pam_unix.so pam_unix_acct.so
  ln -s pam_unix.so pam_unix_auth.so
  ln -s pam_unix.so pam_unix_passwd.so
  ln -s pam_unix.so pam_unix_session.so
}

# vim: ts=2 sw=2 et:

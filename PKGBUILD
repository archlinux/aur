# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Frank Vanderham <twelve_dot_eighty_at_gmail_dot_com>

pkgname=pam_mount-git
pkgdesc='A PAM module that can mount volumes for a user session'
pkgver=2.22.r7.g78787d2
pkgrel=2
url='https://inai.de/projects/pam_mount/'
arch=(x86_64)
license=('LGPL-2.1-or-later AND GPL-2.0-or-later')
checkdepends=('libxml2')
makedepends=('git')
depends=('cryptsetup' 'glibc' 'libhx' 'libxml2' 'openssl' 'pam' 'pcre2' 'util-linux-libs')
provides=('pam_mount')
conflicts=('pam_mount')
options=(!emptydirs)
backup=('etc/security/pam_mount.conf.xml')
source=('git+https://codeberg.org/jengelh/pam_mount.git')
b2sums=('SKIP')

pkgver() {
  cd pam_mount
  # shellcheck disable=SC2312 # will render pkgver invalid on fail
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pam_mount

  aclocal
  libtoolize --no-warnings
  autoreconf --install
  automake --add-missing
  autoreconf
}

build() {
  cd pam_mount

  ./configure \
    --prefix=/usr \
    --with-ssbindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-slibdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-dtd

  make
}

check() (
  cd pam_mount

  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${PWD}/.libs"
  .libs/mount.crypt --help
  .libs/pmt-ehd --help
  .libs/pmvarrun -h

  xmllint --nonet --noout \
    --valid config/pam_mount.conf.xml \
    --strict-namespace
)

package() {
  cd pam_mount

  make DESTDIR="${pkgdir}" LIBTOOLFLAGS='--no-warnings' install
}

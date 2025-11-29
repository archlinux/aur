# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Frank Vanderham <twelve_dot_eighty_at_gmail_dot_com>

pkgname=pam_mount-git
pkgver=2.22.r1.g64dfcc8
pkgrel=1
pkgdesc='A PAM module that can mount volumes for a user session'
arch=('x86_64')
url='https://inai.de/projects/pam_mount/'
license=('LGPL-2.1-or-later')
depends=('cryptsetup' 'glibc' 'libhx' 'libxml2' 'openssl' 'pam' 'pcre2' 'util-linux-libs')
makedepends=('git')
provides=('pam_mount')
conflicts=('pam_mount')
backup=('etc/security/pam_mount.conf.xml')
options=(!emptydirs)
source=("${pkgname}::git+https://codeberg.org/jengelh/pam_mount.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  GIT_TAG="$(git describe --long --tags)"
  echo "${GIT_TAG}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  aclocal
  libtoolize --no-warnings
  autoreconf --install
  automake --add-missing
  autoreconf
}

build() {
  cd "${srcdir}/${pkgname}"

  ./configure \
    --prefix=/usr \
    --with-ssbindir=/usr/bin \
    --sbindir=/usr/bin \
    --with-slibdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var

  # Fix overlinking
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" LIBTOOLFLAGS=--no-warnings install
}

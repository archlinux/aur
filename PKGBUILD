# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Frank Vanderham <twelve_dot_eighty_at_gmail_dot_com>

pkgname=pam_mount-git
pkgver=2.21
pkgrel=1
pkgdesc='A PAM module that can mount volumes for a user session'
arch=(x86_64)
url='http://pam-mount.sourceforge.net/'
license=(GPL-2.0-or-later
         LGPL-2.1-or-later)
depends=(cryptsetup
         glibc
         libhx
         libxml2
         openssl
         pam
         pcre2
         util-linux-libs)
makedepends=(git)
provides=(pam_mount)
conflicts=(pam_mount)
backup=('etc/security/pam_mount.conf.xml')
options=(!emptydirs)
source=("${pkgname}::git+git://git.code.sf.net/p/pam-mount/pam-mount")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd -- "$srcdir/$pkgname"
  aclocal
  libtoolize
  autoreconf --install
  automake --add-missing
  autoreconf
  ./configure \
	--prefix=/usr \
	--with-ssbindir=/usr/bin \
	--sbindir=/usr/bin \
	--with-slibdir=/usr/lib \
	--sysconfdir=/etc \
	--localstatedir=/var
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package() {
  cd -- "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

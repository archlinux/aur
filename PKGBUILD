# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Stephanie Wilde-Hobbs
# Contributor: Radostin Stoyanov
pkgname=libvirt-sandbox
pkgver=0.8.0
pkgrel=6
pkgdesc="An application sandbox toolkit"
arch=('i686' 'x86_64')
url="http://sandbox.libvirt.org/"
license=('LGPL')
depends=('libvirt-glib' 'libselinux' 'libcap-ng' 'cpio')
makedepends=('gobject-introspection' 'intltool' 'pod2man' 'rpcsvc-proto')
optdepends=('dhclient: for sandbox network configuration using DHCP')
source=(
    http://libvirt.org/sources/sandbox/$pkgname-$pkgver.tar.gz{,.asc}
    '0001-builder-Use-prefix-to-identify-lib-path.patch'
    '0002-Use-boot-vmlinuz-linux-as-default-kernel-path.patch'
)

md5sums=('c8b4393ec3ea78cd77af826e478f34f9'
         'd714f9f47f4322d5e702694f0b9f2c19'
         'f1b8ba0a173499b6fbe5ea24d542047b'
         'd854d27d11b2d6cf8184667cae920839'
)

validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF')
# Daniel P. Berrange <dan@berrange.com>

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/0001-builder-Use-prefix-to-identify-lib-path.patch"
  patch -Np1 -i "${srcdir}/0002-Use-boot-vmlinuz-linux-as-default-kernel-path.patch"
  sed -i 's/as_fn_error $? "static LZMA is required/###/' 'configure' # See https://aur.archlinux.org/packages/libvirt-sandbox#comment-927182.
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ## Silence warnings that are due to old codebase.
  _no_cc_warnings=(
    #'address'
    #'attribute-warning'
    'deprecated-declarations'
    #'format-security'
    #'strict-aliasing'
    'unused-result'
  )
  _CFLAGSAPPEND=''
  for _no_cc_warn in "${_no_cc_warnings[@]}"; do
    _CFLAGSAPPEND+=" -Wno-error=${_no_cc_warn} -Wno-${_no_cc_warn}"
  done
  CFLAGS+=" ${_CFLAGSAPPEND}"
  CXXFLAGS+=" ${_CFLAGSAPPEND}"
  export CFLAGS
  export CXXFLAGS

  # --without-lzma is needed to work around '/usr/bin/ld: cannot find -llzma: No such file or directory'. If anyone has an idea how to fix it, please report to the Maintainer of this `PKGBUILD`. See also .

  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib/$pkgname \
      --sysconfdir=/etc \
      --enable-shared \
      --enable-static \
      --disable-werror \
      --disable-gtk-doc \
      --enable-gtk-doc-html \
      --disable-gtk-doc-pdf \
      --enable-introspection \
      --with-zlib \
      --without-lzma \
      --with-capng
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

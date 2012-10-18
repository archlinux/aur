# Upstream Maintainer: josephgbr <rafael.f.f1 at gmail.com> 
# Maintainer: Fantix King <fantix.king at gmail.com> 

_pkgbase=pam
pkgname=libx32-${_pkgbase}
pkgver=1.1.6
pkgrel=0.1
pkgdesc="PAM (Pluggable Authentication Modules) library (x32 ABI)"
arch=('x86_64')
license=('GPL2')
url="http://www.kernel.org/pub/linux/libs/pam/"
depends=('libx32-glibc' 'libx32-libtirpc' 'libx32-db' 'libx32-cracklib' "${_pkgbase}")
makedepends=('libx32-flex' 'gcc-multilib-x32')
options=('!libtool' '!emptydirs')
source=(https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${pkgver}.tar.bz2
        ftp://ftp.suse.com/pub/people/kukuk/pam/pam_unix2/pam_unix2-2.6.tar.bz2
        __libc_lock_define_initialized.patch)
md5sums=('7b73e58b7ce79ffa321d408de06db2c4'
         'e2788389a6c59224110a45fcff30e02b'
         '7d3c716fb7b0136e10abf57392c23bde')

build() {
  export CC='gcc -mx32'
  export CXX='g++ -mx32'
  export PKG_CONFIG_PATH='/usr/libx32/pkgconfig'
  
  cd "${srcdir}/Linux-PAM-${pkgver}"
  ./configure --libdir=/usr/libx32
  make

  cd "${srcdir}/pam_unix2-2.6"
  sed -e 's|pam_syslog (pam_handle_t|pam_syslog (const pam_handle_t|g' \
  	  -i src/public.h src/support.c
  patch -Np1 -i ../__libc_lock_define_initialized.patch
  ./configure --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/Linux-PAM-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  cd "${srcdir}/pam_unix2-2.6"
  #make DESTDIR="${pkgdir}" install
  install src/pam_unix2.so "${pkgdir}/usr/libx32/security/pam_unix2.so"

  # fix some missing symlinks from old pam for compatibility
  cd "${pkgdir}/usr/libx32/security"
  ln -s pam_unix.so pam_unix_acct.so
  ln -s pam_unix.so pam_unix_auth.so
  ln -s pam_unix.so pam_unix_passwd.so
  ln -s pam_unix.so pam_unix_session.so
  
  # cleanup for libx32 package
  rm -rf "${pkgdir}"/{etc,sbin,usr/{include,share}}
}

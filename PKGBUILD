# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=pam-minimal-git
pkgver=1.6.0
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'libtirpc' 'pambase' 'libxcrypt' 'libcrypt.so')
#makedepends=('flex' 'w3m')
provides=('libpam.so' 'libpamc.so' 'libpam_misc.so' 'pam')
conflicts=(pam)
backup=(etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/environment)
source=("git+https://github.com/linux-pam/linux-pam.git"
        $pkgname.tmpfiles)
sha256sums=('SKIP'
            'SKIP')
options=('!emptydirs')

pkgver() {
   cd linux-pam
   git describe --tags | sed 's/-/+/g'
}

build() {
  cd linux-pam
  ./autogen.sh 
  ./configure --libdir=/usr/lib --sbindir=/usr/bin --disable-db --disable-doc --disable-debug --without-mailspool --disable-audit --disable-selinux --disable-regenerate-docu
  make
}

package() {
  install -Dm 644 $pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  cd linux-pam
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install

  # set unix_chkpwd uid
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd
}

# Maintainer: Matteo Mattei <info@matteomattei.com>
# Maintainer: Amish <contact at via dot aur>

pkgname=php-pam
pkgver=2.2.4
pkgrel=3
pkgdesc="This extension provides PAM (Pluggable Authentication Modules) integration in PHP."
arch=('i686' 'x86_64')
url="https://github.com/amishmm/php-pam"
license=('PHP')
depends=('php>=7.2.0' 'pam')
makedepends=('autoconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('caed4eb5f84382b539960fe4ee6f5e2f69301e191ac79dc8c2dda87471489296')
backup=('etc/pam.d/php')

build() {
  cd "${pkgname}-${pkgver}"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install

  echo -e "extension=pam.so;\npam.servicename=\"php\";\npam.force_servicename=0;" | \
    install -Dm644 /dev/stdin "${pkgdir}/etc/php/conf.d/pam.ini"

  # use archlinux's own system-remote-login as PAM service
  # because that is expected to be well tested for security
  # and all future modifications will also automatically apply
  # NOTE: content copied from /etc/pam.d/sshd
  install -Dm644 /dev/stdin "${pkgdir}/etc/pam.d/php" << 'EOF'
#%PAM-1.0
#auth     required  pam_securetty.so     #disable remote root
auth      include   system-remote-login
account   include   system-remote-login
password  include   system-remote-login
session   include   system-remote-login
EOF
}

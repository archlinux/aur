# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Mark Crichton <crichton at gmail dot com>
# Contributor: Josh <moc tod liamg ta suoecal>

pkgname=duo_unix
pkgver=1.11.3
pkgrel=1
pkgdesc='Login utility and PAM module for Duo Security two-factor authentication'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.duosecurity.com/docs/duounix'
license=('custom:GPL2')
depends=('pam')
install="${pkgname}.install"
backup=('etc/duo/login_duo.conf' 'etc/duo/pam_duo.conf')
source=("https://dl.duosecurity.com/duo_unix-${pkgver}.tar.gz")

# https://www.duosecurity.com/docs/checksums#duounix
sha1sums=('2a1ee874a46b5bd40805adbee1b3f097e7a17e28')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # By default, login_duo is installed setuid root with system-wide config files
  # Using nobody as the privsep user to match the default openssh package
  # More config options here: https://github.com/duosecurity/duo_unix
  ./configure \
      --prefix=/usr \
      --sbindir=/usr/bin \
      --with-pam=/usr/lib/security \
      --with-privsep-user=nobody

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  # The license is GPL, but with a couple clarifications/exceptions (link the LICENSE file to /usr/share/licenses)
  # This link won't point to anything if the !docs option is specified
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

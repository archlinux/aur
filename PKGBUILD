# Maintainer: svalo <valo@eigenlab.org>
# Contributor: David Costa <david@zarel.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Based on monkeysphere-git from
# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
pkgname=monkeysphere
pkgver=0.39
pkgrel=1
pkgdesc="Leverage the OpenPGP web of trust for OpenSSH and Web authentication"
arch=('any')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('lockfile-progs' 'perl-crypt-openssl-rsa' 'perl-digest-sha1' 'gnupg>=2.1.13')
checkdepends=('socat' 'openssh' 'cpio' 'gnupg>=2.1.13')
optdepends=('agent-transfer')
source=(http://archive.monkeysphere.info/debian/pool/${pkgname}/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
    test-keytrans.patch
    binmerge.patch
    exclude-agent.patch
    )

sha256sums=('73331e2df361b22e1dc6445a7d2b0b2c5a124daa4d850c2ecce721579592c29f'
            'f0c90bd5ffd06b54457b6d0ccf9456bcc7899ab8362d31416cce2d7f982760d0'
            'e49a1097296b06090010ce5344588f5e4917aeb06a118de920fc58411d2a7cf7'
            'ee2d4942918a464216b7bde5ad6585441237d2a6235fa795a24a14e0d9962cad')

install=monkeysphere.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i "${srcdir}/test-keytrans.patch"
  patch -Ni "${srcdir}/binmerge.patch"
  patch -Ni "${srcdir}/exclude-agent.patch"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  mkdir -p "${pkgdir}/var/lib/monkeysphere"
  chown root:root "${pkgdir}/var/lib/monkeysphere"
}

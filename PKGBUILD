# Maintainer: svalo <valo@eigenlab.org>
# Contributor: David Costa <david@zarel.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Based on monkeysphere-git from
# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
pkgname=monkeysphere
pkgver=0.38
pkgrel=1
pkgdesc="Leverage the OpenPGP web of trust for OpenSSH and Web authentication"
arch=('any')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('lockfile-progs' 'perl-crypt-openssl-rsa' 'perl-digest-sha1' 'gnupg>=2.1.13')
checkdepends=('agent-transfer' 'socat' 'openssh' 'cpio' 'gnupg>=2.1.13')
optdepends=('agent-transfer')
source=(http://archive.monkeysphere.info/debian/pool/${pkgname}/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
    binmerge.patch
    exclude-agent.patch
    )

sha256sums=('6951821d11ad646e6e7651d677bfab8f800fbc52703a0ab9942d03cd13959073'
            'e49a1097296b06090010ce5344588f5e4917aeb06a118de920fc58411d2a7cf7'
            'ee2d4942918a464216b7bde5ad6585441237d2a6235fa795a24a14e0d9962cad')

install=monkeysphere.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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

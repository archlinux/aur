# Maintainer: svalo <valo@eigenlab.org>
# Contributor: David Costa <david@zarel.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Based on monkeysphere-git from
# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
pkgname=monkeysphere
pkgver=0.44
pkgrel=1
pkgdesc="Leverage the OpenPGP web of trust for OpenSSH and Web authentication"
arch=('any')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('agent-transfer' 'lockfile-progs' 'perl-crypt-openssl-rsa' 'perl-digest-sha1' 'perl-crypt-openssl-bignum' 'gnupg>=2.1.22')
checkdepends=('socat' 'openssh' 'cpio' 'gnupg>=2.1.22' 'perl-crypt-openssl-bignum')
source=(http://deb.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
    binmerge.patch
    exclude-agent.patch
    )

sha256sums=('6ac6979fa1a4a0332cbea39e408b9f981452d092ff2b14ed3549be94918707aa'
            'e0cdadd4f01deab281cb66543eef19216bd762cb41774d3b498bd2e7c17816e4'
            '90c3fcc64cbd2329489225af39afa52dc8ebeb6ad0877532c2842ccf616df4ea')

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

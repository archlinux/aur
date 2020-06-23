# Maintainer: dekart811
# Updated by: RoderickVM (June 21 2020)
# Updates: 1) Patch file name, 2) SHA256SUM for the patch filename

_pkgbase=veeamsnap
pkgname=veeamsnap
pkgver=4.0.0.1961
pkgrel=2
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="http://repository.veeam.com/backup/linux/agent"
license=('GPLv2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("${url}/rpm/el/7/x86_64/veeamsnap-${pkgver}-1.noarch.rpm"
        'fix-compilation-on-linux-5.7.patch::https://github.com/veeam/veeamsnap/pull/5.patch'
        'dkms.conf')
sha256sums=('40857406899712576e233dd76e54fa5fb9e73e45f6c616d5a9facdb4bcea6d8c'
            '492ae08fe620184d015574da9e0b1b3fab695318c1d81dd6b7a885ac0703281e'
            '7d2a83f28b7c41797fadf06f29ab124ae63d662f2dba4e81e1eb4d1ef15bee7c')

prepare() {
  cd "${srcdir}/usr/src/${pkgname}-${pkgver}"
  chmod 644 *
  # Convert line endings to LF to prevent patch from failing
  sed -i -e 's/\r$//g' cbt_storage.c
  sed -i -e 's/\r$//g' cbt_storage.h
  patch -l -p2 -i "$srcdir/fix-compilation-on-linux-5.7.patch"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${srcdir}/usr/src/${_pkgbase}-${pkgver}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

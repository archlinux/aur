# Maintainer: Stephan Brunner <s.brunner@stephan-brunner.net>

pkgname=cepces
pkgver=0.3.10
pkgrel=3
pkgdesc='certmonger plugin to enroll certificates through Active Directory Certificate Services CEP and CES.'
arch=(any)
url=https://github.com/openSUSE/cepces
license=(GPL-3.0)
depends=(
  certmonger
  python-cryptography
  python-requests
  python-requests-gssapi
  python-keyring
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "git+https://github.com/openSUSE/$pkgname.git#tag=v$pkgver"
  0001-Remove-insecure-enctypes.patch
  0002-feat-keyring-Implement-KeyringHandler-class-using-ke.patch
  0003-feat-keyring-Add-is_supported-function.patch
  0004-feat-auth-Replace-keyring-with-keyctl-class.patch
  0005-feat-credentials-Add-a-credentials-handler-based-on-.patch
  0006-feat-auth-Use-pinentry-instead-of-zenity.patch
  0007-tests-credentials-Add-manual-test-for-pinentry-Crede.patch
  0008-tests-keyring-Add-manual-test-for-keyctl-KeyringHand.patch
  0009-feat-README-Suggest-to-install-keyutils-and-pinentry.patch
  0010-fix-auth-Fix-exception-handling-in-KerberosAuthentic.patch
  0011-chore-auth-Rename-KerberosAuthenticationHandler-to-G.patch
  0012-fix-auth-Only-set-the-keytab-if-we-have-one-defined.patch
  0013-feat-krb5-Add-get_default_keytab_name.patch
  0014-fix-auth-If-no-keytab-is-specified-use-the-default.patch
  0015-chore-soap-Rename-TransportKerberosAuthentication.patch
)
sha256sums=(
  'b60a3196d8d7448ad58a5d452ea418d1f338a35ed7205e531e71caa299757c41'
  'a60a241a0da7ce380f5bd11cff18e8d0dacab5613a08107720f8889ae42734f2'
  '13dab90dcd1c7bd02eb3a6a923daf88ef2f9e3d637ecc87f6ca214a4603cbbcc'
  '2dbdab64458a2a9c31fee1a1a55b537bfef6be01973f8edba331f179062207a0'
  '499e59f597db86ec8982c17bf279c21420cdf991893bb2923e47887725b0775d'
  'de36911545c73d99881860cdfb336a03faf7e90ed330b43120459face1d8f082'
  '95edd330ae61207cf0211b88591078c19508920405d84c6ab2f3f1a63f8ced99'
  'c412b831084f1abf6f27e25e2be0cfa2c74444fb5d94fbadb8736dd05b51fb4e'
  '002ec2a10c09c200bc7e5aeb35d9f56f282e5d093f1dcd3817b12fd34ce84859'
  '0b6ecb935998697ae839ae8c1deeae9bff518d56ecb2f859e8f5c91190201238'
  '498ecee6c2a6da2ad6aa2c9f1b45884adc8908d887d89f9e3b9fe353a044c69e'
  '81207a07d104d585d97aedb77fc35bf05f7bde8bf134510cd11f51e5b99ac924'
  '2d1bb1cc12cde25e65b0112df082102a366634e920e6f1801b515d9cd426574d'
  'de4822abe60eea424f9fa90cb4f04f97e2dad68b3c3d25d1117adfc126ac25b3'
  '9fdf33859f444591e09b1f1fc56de346db9cdb9fa517279b91b62f3b439a6ecc'
  '9776db2833afad5c7d1c3b2ef57d412eb4d5b66194f6afad85230e348af32ad2'
)
validpgpkeys=(968479A1AFF927E37D1A566BB5690EEEBB952194) # GitHub <noreply@github.com>
backup=(
  etc/cepces/{cepces,logging}.conf
)

prepare() {
  cd "$pkgname"
  patch -p1 -i ../0001-Remove-insecure-enctypes.patch
  patch -p1 -i ../0002-feat-keyring-Implement-KeyringHandler-class-using-ke.patch
  patch -p1 -i ../0003-feat-keyring-Add-is_supported-function.patch
  patch -p1 -i ../0004-feat-auth-Replace-keyring-with-keyctl-class.patch
  patch -p1 -i ../0005-feat-credentials-Add-a-credentials-handler-based-on-.patch
  patch -p1 -i ../0006-feat-auth-Use-pinentry-instead-of-zenity.patch
  patch -p1 -i ../0007-tests-credentials-Add-manual-test-for-pinentry-Crede.patch
  patch -p1 -i ../0008-tests-keyring-Add-manual-test-for-keyctl-KeyringHand.patch
  patch -p1 -i ../0009-feat-README-Suggest-to-install-keyutils-and-pinentry.patch
  patch -p1 -i ../0010-fix-auth-Fix-exception-handling-in-KerberosAuthentic.patch
  patch -p1 -i ../0011-chore-auth-Rename-KerberosAuthenticationHandler-to-G.patch
  patch -p1 -i ../0012-fix-auth-Only-set-the-keytab-if-we-have-one-defined.patch
  patch -p1 -i ../0013-feat-krb5-Add-get_default_keytab_name.patch
  patch -p1 -i ../0014-fix-auth-If-no-keytab-is-specified-use-the-default.patch
  patch -p1 -i ../0015-chore-soap-Rename-TransportKerberosAuthentication.patch
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d $pkgdir/etc/cepces

  for cfg in cepces.conf logging.conf
  do
    install -Dm644 conf/$cfg.dist $pkgdir/etc/cepces/$cfg
  done

  install -dm750 $pkgdir/var/log/cepces
}

# vim: ts=2 sw=2 et:


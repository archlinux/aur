# Maintainer: Charlie Wolf <charlie@wolf.is>
# Contributor: Christian Hesse <mail@eworm.de>


_basename=openvpn
pkgname=openvpn-aws
pkgver=2.6.10
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) with patches to support AWS Client VPN'
arch=('x86_64')
url='https://github.com/samm-git/aws-vpn-client'
license=('custom')
depends=('libcap-ng' 'libcap-ng.so'
         'libnl' 'libnl-genl-3.so' 'libnl-3.so'
         'lz4'
         'lzo' 'liblzo2.so'
         'openssl' 'libcrypto.so' 'libssl.so'
         'pkcs11-helper' 'libpkcs11-helper.so'
         'systemd-libs' 'libsystemd.so')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd' 'python-docutils')
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7'  # OpenVPN - Security Mailing List <security@openvpn.net>
              'B62E6A2B4E56570B7BDC6BE01D829EFECA562812') # Gert Doering <gert@v6.de>
source=("git+https://github.com/OpenVPN/openvpn.git#tag=v${pkgver}?signed"
        '0001-unprivileged.patch'
        'openvpn-v2.6.10-aws.patch')
sha256sums=('9192c40cdd787a5327a4cb9cd869c06f4fb61e30fade9a534cdcf724672fb9a6'
            '77874824d96c1fd6c14259a6ea16232ae574dda3d5adba1798ccd6c93694846c'
            '3a2daf32fd68a05fb0395d56792393f54c36f910b2d4a92cec4611414c417adf')

prepare() {
  cd "${srcdir}"/${_basename}

  # https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg19302.html
  sed -i '/^CONFIGURE_DEFINES=/s/set/env/g' configure.ac

  # start with unprivileged user and keep granted privileges
  patch -Np1 < ../0001-unprivileged.patch

  # patches needed for aws
  patch -Np1 < ../openvpn-v2.6.10-aws.patch

  autoreconf --force --install
}

build() {
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build

  "${srcdir}"/openvpn/configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp -a "${srcdir}/build/src/openvpn/openvpn" "${pkgdir}/usr/bin/openvpn-aws" 
}

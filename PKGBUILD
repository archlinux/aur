# $Id: PKGBUILD 238334 2015-05-02 09:16:47Z anatolik $
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Original maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Jose Javier  <jojapa@terra.es>
#

pkgname=tftp-hpa-destruct
pkgver=5.2
pkgrel=6
pkgdesc="Official tftp server"
arch=('i686' 'x86_64')
url="http://www.kernel.org/pub/software/network/tftp/tftp-hpa/"
license=('BSD')
backup=('etc/conf.d/tftpd')
install='tftpd.install'
depends=('readline>=6.0.00')
conflicts=('tftp-hpa')
provides=('tftp-hpa')
source=(https://www.kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-$pkgver.tar.{gz,sign}
       LICENSE
       tftpd.conf
       tftpd.service
       tftpd.socket
       tftp-hpa-0.49-fortify-strcpy-crash.patch
       tftp-hpa-add-destructive-ipv4-mode.patch)
sha512sums=('d79c9bd41ccf573d44ae5c4d72726c27ed2f84c8fc4f7bb12e26c3deb9bee0ececcef8b4a49cca9c59da1673f1181e5187fd4ac0cbdc5285ca18f02c4788b89e'
         '244249a6247c7779309b1476060c771d2464aab3e74a3474950375cda8042dc838d0c027a62aa6223af0123fd4554964196b015f3e04680d06323d75a2853908'
         '567c5a47bfbaf19b910ec912df7a377d10366ce2e90674525264ff844ddb130805e6ebb362bc1ec571b1c6407443cbb1606df77c24a4158e0cfa6de01fe5f34c'
         '4e639b5ea55d3a62fc8f88b1e255e1cd5f5b3a43e174ebd7a5fc433e56d61446d9baa5bdf00c91c9b4c8f505e503f9c5717ea6ec3f77b729568558e5f0af0428'
         '4b21d4000bde38f2c5c658cdcfc1f5446b866b965bb829f14c7dac4848a078ea28e3eadd4fd35a23e8e29fc120e84a4e4a3aab675e57c4bf3b272d4e9331e8f0'
         'c320ced7c4909796fcffbbbbe1ea9cdccd66a901772db147ee26a53325eacd416e130f8a70c0e04d7af219c2edcff2b15e8c95cfaee822f1ec2eaf23989c0c4a'
         'ef2cecfb1509381b6c730fb4e2a1790d180f37a9f009ee89dbd04f4deabd92ca87158d3fa4eae11824a1235113f288627c4c00058c64cda7d83dd624c6b0469a'
         '91d68629f7129ae0585abb7a54dab545715ffc7fcaef91aba946cbac9e02425b1b28f2d83160f408832240db408b6eb94aaa5ee261b7ddf2b552dc6995d615f7')

validpgpkeys=('D86455E3D1D0962037AA86E088AE647D58F7ABFE') # "H. Peter Anvin (kernel.org file signing key) <hpa@kernel.org>"

prepare() {
  cd tftp-hpa-${pkgver}
  # fix #28103
  patch -Np1 -i ../tftp-hpa-0.49-fortify-strcpy-crash.patch
  # add our destructive patch
  patch -Np1 -i ../tftp-hpa-add-destructive-ipv4-mode.patch
}

build() {
  cd tftp-hpa-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin --without-tcpwrappers
  make
}

package() {
  cd tftp-hpa-${pkgver}
  make INSTALLROOT="${pkgdir}" install
  install -D -m644 "${srcdir}/tftpd.conf" "$pkgdir/etc/conf.d/tftpd"
  install -d "${pkgdir}/srv/tftp"
  install -D -m644 "${srcdir}/tftpd.service" "${pkgdir}/usr/lib/systemd/system/tftpd.service"
  install -D -m644 "${srcdir}/tftpd.socket" "${pkgdir}/usr/lib/systemd/system/tftpd.socket"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove conflict with iputils
  rm "${pkgdir}/usr/share/man/man8/tftpd.8"
}

# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgbase=linux-ubuntu
pkgver="4.4.0_31.50"
_pkgbasever=${pkgver%.*}
_pkgbasever=${_pkgbasever/_/-}
_kind=generic
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=(tar)
options=(!strip)
source=(http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-headers-${_pkgbasever}_${pkgver/_/-}_all.deb
        linux-ubuntu.preset)
source_x86_64=(http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-image-${_pkgbasever}-${_kind}_${pkgver/_/-}_amd64.deb
               http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-image-extra-${_pkgbasever}-${_kind}_${pkgver/_/-}_amd64.deb
               http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-headers-${_pkgbasever}-${_kind}_${pkgver/_/-}_amd64.deb)
source_i686=(http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-image-${_pkgbasever}-${_kind}_${pkgver/_/-}_i386.deb
             http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-image-extra-${_pkgbasever}-${_kind}_${pkgver/_/-}_i386.deb
             http://mirrors.kernel.org/ubuntu/pool/main/l/linux/linux-headers-${_pkgbasever}-${_kind}_${pkgver/_/-}_i386.deb)
noextract=("${source[@]##*/}"
           "${source_x86_64[@]##*/}"
           "${source_i686[@]##*/}")

sha256sums=('04c6de52c7423924ffbcb0771e42795e2809d4b05dab34290382e7a24c3bdaed'
            '1117944cc09613f305f985f6e17f67c14bdaacb0e8ac2b9cbc5beef74c10763c')
sha256sums_x86_64=('3b8dc893081dbb53868e9b71507d397388d2a4a465d1c892e587b1c4e4addad6'
                   '451da56c1374895a0e3ac607a3c07a25b0e71fda894cc4dc74d9ab734e0bea12'
                   'f444b484cb983ac94a1d392cc8b172d058a157f99095503f851fc39db7801005')
sha256sums_i686=('16365b61629a8d41496b06db06521f69cea274cd32eac9889a4e41bf7fec772c'
                 '3e4900b1137915b742f7949e851b20e6c085022bae5fe77109f9e662cd37ab4b'
                 '41e66e04f63fda9d57bd16f964020465590ce1df4e5c94ee4b07546a70699db3')

pkgname=("${pkgbase}" "${pkgbase}-headers")

package_linux-ubuntu() {
  pkgdesc="Linux kernel image with Ubuntu Patches (binary)"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  install=linux-ubuntu.install

  for x in linux-image-*.deb; do
    ar p "$x" data.tar.bz2 | tar -xjf - -C "$pkgdir/" --transform='s,^./lib,usr/lib,'
  done
  ln -sf "vmlinuz-${_pkgbasever}-${_kind}" "$pkgdir/boot/vmlinuz-$pkgname"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${pkgname#linux}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_pkgbasever}-${_kind}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
}

package_linux-ubuntu-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  for x in linux-headers-*.deb; do
    ar p "$x" data.tar.xz | tar -xJf - -C "$pkgdir/" --transform='s,^./lib,usr/lib,'
  done
}

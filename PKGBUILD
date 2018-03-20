# Maintainer: Paul Wilk <paul.wilk@null.net>

pkgname=open-vm-tools-dkms
epoch=6
pkgver=10.2.0
_pkgsubver=g2911709
pkgrel=4
pkgdesc='Open Virtual Machine Tools kernel modules (DKMS)'
arch=('i686' 'x86_64')
url='https://github.com/vmware/open-vm-tools'
license=('GPL2')
conflicts=('open-vm-tools-modules' 'vmware-modules-dkms')

depends=('dkms')
options=('!strip')
optdepends=('open-vm-tools: Open Virtual Machine Tools'
            'linux-headers: Header files for Linux kernel')
install=open-vm-tools-dkms.install

_name='open-vm-tools'
_dirname='stable-10.0.x'
_version="${pkgver}-${_pkgsubver}"
_full_name="vmware-open-vm-tools-2911709"
_dkms_version='2015.01.29'

source=(https://github.com/vmware/open-vm-tools/tarball/${pkgver}-0-${_pkgsubver}
        0001-Fix-vmxnet-module-on-kernels-3.16.patch
        0004-Support-backing-dev-info-kernel-4.0.patch
        0005-Remove-new_sync-for-Linux-4.1.patch
        0006-vmhgfs-support-linux-4.2.x-kernel.patch
        dkms.conf.in)
sha256sums=('433eef7333e394d85c8c3c5c799e5943c88c0cfbc4384cfde856f08fc3fa15e7'
            '6684cf4cd9a492b82b24dff076fbbafef19e59ef969f532ee3da1501136a7c48'
            'dac377beb660dc6c143356255346b34db0986511dcb74f051e06f243a0078af8'
            '38e2ae573a849251abde79c82b694d76f32cc75c9ff60878ebcb23f2f8c86928'
            'd8191b23b9d5689b321bd0cf20b71a4039fde454d08644de6dc3a6521d574fd0'
            '5255a183cccd80b2bfbbf519b1cc8cec81ae40bbc0b5a88dfddd95532ece84ed')

prepare() {
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0001-Fix-vmxnet-module-on-kernels-3.16.patch"
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0004-Support-backing-dev-info-kernel-4.0.patch"
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0005-Remove-new_sync-for-Linux-4.1.patch"
  patch -d "$srcdir/${_full_name}" -Np2 -i "$srcdir/0006-vmhgfs-support-linux-4.2.x-kernel.patch"
}

package() {
  cd "$srcdir/${_full_name}"
  sed -i "s/${_dkms_version}/${pkgver}/g" ./modules/linux/dkms.sh
  sh ./modules/linux/dkms.sh ./ "${pkgdir}/usr/src"
  sed "s/%pkgver%/${pkgver}/g" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_name}-${pkgver}/dkms.conf"
  for _module in {"vmblock","vmci","vmsync","vsock"}; do
    rm -rf "${pkgdir}/usr/src/${_name}-${pkgver}/${_module}"
  done
}


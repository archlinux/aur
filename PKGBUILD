_pkgbase=open-vm-tools
pkgname=open-vm-tools-wayland
# Maintainer: Lattice Sum <dsoyet@outlook.com>
conflicts=('open-vm-tools' 'open-vm-tools-clipway')
provides=('open-vm-tools')
epoch=6
pkgver=13.1.0
pkgrel=3
pkgdesc='open-vm-tools with Wayland clipboard support via clipway patch'
arch=('x86_64')
url='https://github.com/vmware/open-vm-tools'
license=('LGPL-2.1-only')
depends=('fuse3' 'icu' 'iproute2' 'libdnet' 'libmspack' 'libsigc++'
         'libxcrypt' 'libcrypt.so' 'libxss' 'lsb-release' 'procps-ng'
         'uriparser' 'which' 'xmlsec' 'wl-clipboard')
makedepends=('git' 'chrpath' 'doxygen' 'gtkmm3' 'libxtst' 'python' 'rpcsvc-proto' 'glib2-devel')
checkdepends=('cunit')
optdepends=('gtkmm3: DnD/CP plugin'
            'libxtst: DnD/CP, resolution set plugins'
            'netctl: suspend-resume network state'
            'networkmanager: suspend-resume network state')
backup=('etc/pam.d/vmtoolsd'
        'etc/vmware-tools/vgauth.conf'
        'etc/xdg/autostart/vmware-user.desktop')
options=('docs')
source=("git+https://github.com/vmware/open-vm-tools#tag=stable-${pkgver}"
        'vmtoolsd.pam'
        'vmtoolsd.service'
        'vmware-vmblock-fuse.service'
        clipway.patch
        desktopEvents-wayland.patch
        open-vm-tools-gcc16.patch)
sha256sums=('916a09225a22653ec5e56b1df5bbfacc7f69b2b9e8ac734052936bcb75cde49a'
            '9848f4b621bb1134e463fea099f03933cf3f48f1ac5e580228abef264d26137e'
            '0626cc86232f75a7286c24c52d6b44260bba55e2e96c17fa22ed36decb61a4d9'
            '99e3cc1da20a751049144cc02dec77174a55109b5b5960e1facd78709da7724f'
            '0e7d333bfdf9ebb903d40ec4e8b9fe16c75e34d17f9e67cf22646992574a4d77'
            '15f26a57d81ec482ef657ea665d72664e70332e9f5b33e3aa495c6f9f86620b7'
            '2c3b3fa378c86307223b9977c6b07ec1781d5b396c1526ee7fef73b7604a0c6d')

prepare() {
  cd "${srcdir}/${_pkgbase}/open-vm-tools/"
  patch -Np1 -i ../../open-vm-tools-gcc16.patch
  patch -Np1 -i ../../clipway.patch
  patch -Np1 -i ../../desktopEvents-wayland.patch
  autoreconf -vi
}

build() {
  cd "${srcdir}/${_pkgbase}/open-vm-tools/"

  sh ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --without-kernel-modules
  make
}

check() {
  cd "${srcdir}/${_pkgbase}/open-vm-tools/"

  make check
}

package() {
  cd "${srcdir}/${_pkgbase}/open-vm-tools/"

  make install DESTDIR="${pkgdir}"
  chmod 7755 "${pkgdir}"/usr/bin/vmware-user-suid-wrapper

  # install vmware-xdg-detect-de
  install -D -m0755 scripts/common/vmware-xdg-detect-de "${pkgdir}"/usr/bin/vmware-xdg-detect-de

  # install pam configuration
  install -D -m0644 "${srcdir}"/vmtoolsd.pam "${pkgdir}"/etc/pam.d/vmtoolsd

  # install systemd files
  install -D -m0644 "${srcdir}"/vmtoolsd.service "${pkgdir}"/usr/lib/systemd/system/vmtoolsd.service
  install -D -m0644 "${srcdir}"/vmware-vmblock-fuse.service "${pkgdir}"/usr/lib/systemd/system/vmware-vmblock-fuse.service
}

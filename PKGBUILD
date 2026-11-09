_pkgbase=open-vm-tools
pkgname=open-vm-tools-clipway
conflicts=('open-vm-tools' 'open-vm-tools-git' 'open-vm-tools-wayland')
provides=('open-vm-tools')
epoch=6
pkgver=13.1.0
pkgrel=4
pkgdesc='open-vm-tools for VMware with clipway patch (Wayland sessions clipboard fix)'
arch=('x86_64')
url='https://github.com/vmware/open-vm-tools'
license=('LGPL-2.1-only')
depends=('fuse3' 'icu' 'iproute2' 'libdnet' 'libmspack' 'libsigc++'
         'libxcrypt' 'libcrypt.so' 'libxss' 'lsb-release' 'procps-ng'
         'uriparser' 'which' 'xmlsec' 'wl-clipboard' 'gtkmm3' 'libxtst')
makedepends=('git' 'chrpath' 'doxygen' 'libxtst' 'python' 'rpcsvc-proto' 'glib2-devel' 'gtkmm3')
checkdepends=('cunit')
optdepends=('netctl: suspend-resume network state'
            'networkmanager: suspend-resume network state')
backup=('etc/pam.d/vmtoolsd'
        'etc/vmware-tools/vgauth.conf'
        'etc/xdg/autostart/vmware-user.desktop')
options=('docs')
source=("git+https://github.com/vmware/open-vm-tools#tag=stable-${pkgver}"
        'vmtoolsd.pam'
        'vmtoolsd.service'
        'vmware-vmblock-fuse.service'
        'clipway.patch'
        'open-vm-tools-gcc16.patch'
        'clipway.service')
sha256sums=('916a09225a22653ec5e56b1df5bbfacc7f69b2b9e8ac734052936bcb75cde49a'
            '9848f4b621bb1134e463fea099f03933cf3f48f1ac5e580228abef264d26137e'
            '0626cc86232f75a7286c24c52d6b44260bba55e2e96c17fa22ed36decb61a4d9'
            '99e3cc1da20a751049144cc02dec77174a55109b5b5960e1facd78709da7724f'
            '53fc2dec9c0069d1fac804fee2fb6ccf2503f8470782e368aefc6d9f2209e5cb'
            '2c3b3fa378c86307223b9977c6b07ec1781d5b396c1526ee7fef73b7604a0c6d'
            '00cd9899ebfd22a58c5c289929f65e571a1227072f6a527c830f635434fd425c')

prepare() {
  cd "${srcdir}/${_pkgbase}/open-vm-tools/"
  rm -f services/plugins/dndcp/copyPasteDnDWayland.cpp \
    services/plugins/dndcp/copyPasteUIWayland.cpp \
    services/plugins/dndcp/copyPasteUIWayland.h \
    services/plugins/dndcp/dndGuestBase/copyPasteDnDWayland.h
  patch -Np1 -i ../../open-vm-tools-gcc16.patch
  patch -Np1 -i ../../clipway.patch
  autoreconf -vi
}

build() {
  cd "${srcdir}/${_pkgbase}/open-vm-tools/"

  sh ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --without-kernel-modules \
    --without-gtk4 \
    --with-gtk3 \
    --with-gtkmm3
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

  # clipway optional service, usually not needed for KDE Plasma under wayland
  install -D -m0644 "${srcdir}"/clipway.service "${pkgdir}"/usr/lib/systemd/system/clipway.service
  
  # Create symlink to libdndcp only
  mkdir -p "${pkgdir}/usr/lib/open-vm-tools/plugins/clipway"
  pushd "${pkgdir}/usr/lib/open-vm-tools/plugins/clipway"
  ln -s ../vmusr/libdndcp.so libdndcp.so
  popd
}

# Maintainer: Nicola Fontana <ntd@entidi.it>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgbase='etherlab-ethercat'
pkgname=('etherlab-ethercat' 'etherlab-ethercat-dkms' 'etherlab-ethercat-tools')
pkgver=1.6.7
pkgrel=4
arch=('i686' 'x86_64')
url='https://etherlab.org'
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "ethercat.sysusers"
        "ethercat.udev"
        "dkms.conf")
sha512sums=('1a26b6fbbae7cf371468171dc2d05190ab4461b7e1bcce6ded51207c2083f8c9b8a426d37887b144011f364b4d55acb59ee563d3d48b17c8956e94e321dda34a'
            'b029d47d10850569f180801fdc6bb2209dc9014649615123fe677416586df1c5a4f0901bcbd2da73b0e48ce752fe2a732272afdbf2445edf9ed4740be1ada7d8'
            'b3baca5c546af8d57fe59e30d3acd63310a128fc938436b4a151e12fe2fde75029cf0f47b0ac2edc676e762a4cf7ac308b8229594a5d2c8301a02c0e8f623569'
            '1b13d1fab22d82b08af2c90535ad4e02f232ff4cadd22a0aea5a7819c857862e64f50daa5445ed512527fa7a3b1d038d6da93046e35182330ec0e7112d908ca9')

prepare() {
  cp -r "${srcdir}/ethercat-${pkgver}" "${srcdir}/ethercat-${pkgver}-dkms"
}

build() {
  cd "ethercat-$pkgver"

  # This build is shared between `etherlab-ethercat` (that requires
  # building the modules) and `etherlab-ethercat-dkms` (that does not
  # require them), so I always forcibly build the modules (if possible)
  # even for `etherlab-ethercat-dkms`.
  if test -d /usr/src/linux; then
    # Package `linux-headers` present: build the kernel modules
    kernel_args="--enable-kernel --enable-generic --with-linux-dir=/usr/src/linux"
  else
    # Package `linux-headers` absent: disable the kernel modules
    kernel_args="--disable-kernel"
  fi

  ./configure $kernel_args \
    --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-tool --enable-userlib --disable-initd
  make all

  if test "$kernel_args" != "--disable-kernel"; then
    make modules
  fi
}

check() {
  cd "ethercat-$pkgver"
  make check
}

package_etherlab-ethercat() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  license=('GPL-2.0-only')
  depends=('linux' 'linux-headers' 'etherlab-ethercat-tools')
  provides=('etherlab-ethercat')
  conflicts=('etherlab-ethercat-dkms')

  cd "ethercat-$pkgver"
  # 1. Skip `depmod`: it will be executed automatically
  #    by pacman hooks on the target OS
  # 2. By default kernel modules are installed in `/lib`
  #    but archlinux expects them in `/usr/lib`
  make cmd_depmod=: INSTALL_MOD_PATH="$pkgdir/usr" modules_install
}

package_etherlab-ethercat-dkms() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  license=('GPL-2.0-only')
  depends=('dkms' 'etherlab-ethercat-tools')
  provides=('etherlab-ethercat')
  conflicts=('etherlab-ethercat')

  cd "ethercat-$pkgver-dkms"
  mkdir -p ${pkgdir}/usr/src/ethercat-dkms-${pkgver}/
  cp -r ./* ${pkgdir}/usr/src/ethercat-dkms-${pkgver}/
  cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/ethercat-dkms-${pkgver}
  # Set version
  sed -e "s/#MODULE_VERSION#/${pkgver}/" \
    -i "${pkgdir}"/usr/src/ethercat-dkms-${pkgver}/dkms.conf
}

package_etherlab-ethercat-tools() {
  pkgdesc="Tools for IgH EtherCAT(R) Master component"
  license=('LGPL-2.1-only')
  backup=('etc/ethercat.conf')

  install -Dm 0644 ethercat.udev "$pkgdir/usr/lib/udev/rules.d/99-EtherCAT.rules"
  install -Dm 0644 ethercat.sysusers "$pkgdir/usr/lib/sysusers.d/ethercat.conf"

  cd "ethercat-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.8.12.1
pkgrel=2
pkgdesc="Open source implementation of the AFS distributed file system"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('krb5' 'libxcrypt')
optdepends=('openafs-modules: Kernel module for OpenAFS'
            'openafs-modules-dkms: Kernel module for OpenAFS, built automatically using dkms')
conflicts=('openafs-features')
backup=(etc/conf.d/openafs
	etc/openafs/ThisCell
        etc/openafs/cacheinfo
        etc/openafs/CellServDB)
options=(!emptydirs)
install=openafs.install
source=(http://openafs.org/dl/openafs/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2
        http://openafs.org/dl/openafs/${pkgver}/${pkgname}-${pkgver}-doc.tar.bz2
        tmpfiles.d-openafs.conf
        0001-Adjust-RedHat-config-and-service-files.patch
        0001-rx-Define-symbolic-names-for-Rx-magic-numbers.patch
        0002-opr-replace-MIN-MAX-macros-with-opr_min-opr_max.patch
        0003-Remove-MIN-and-MAX-macro-definitions.patch
        0004-rx-Remove-includes-for-MIN-MAX-in-rx_packet.h.patch)
sha256sums=('dfe2f39bef9fb3d6791d602e725be7c34b885e4299018266ff9743cb401e594a'
            '79808f059ab01d5f929bc75d057b129f8b2a375356fe5afd780a075f2b25c562'
            '18d7b0173bbffbdc212f4e58c5b3ce369adf868452aabc3485f2a6a2ddb35d68'
            'c15539241045e96252d6af4901311f3c494eae42c64edaaa1dcd1c70ef118624'
            '89858ec91fb7cef85f7996c2eeeeb087a7996ed5d902ae4e3ac668e086753b05'
            '247fbe76610056123525b11511f4a426913c7ee61b59f88fdbc0871239af9a94'
            '9b3cac93406f13b3c1ad41c424c43e4df2c997ba9af68e8b73caf3db7e4df42f'
            'a7c4eb9dec81628459783705ceee531b29a81c254298e84c89cdc99e6c77729e')

# If you need the kauth tools set this to 1. But be aware that these tools
# are considered insecure since 2003! This also affects the PAM libs.
ENABLE_KAUTH=0

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Adjust RedHat config and service files to our needs
  patch -p1 < "${srcdir}"/0001-Adjust-RedHat-config-and-service-files.patch

  # Patches for Linux 6.11
  patch -p1 < "$srcdir"/0001-rx-Define-symbolic-names-for-Rx-magic-numbers.patch
  patch -p1 < "$srcdir"/0002-opr-replace-MIN-MAX-macros-with-opr_min-opr_max.patch
  patch -p1 < "$srcdir"/0003-Remove-MIN-and-MAX-macro-definitions.patch
  patch -p1 < "$srcdir"/0004-rx-Remove-includes-for-MIN-MAX-in-rx_packet.h.patch

  # Only needed when changes to configure were made
  #./regen.sh -q
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  case "$CARCH" in
    "i686")    sysname=i386_linux26 ;;
    "x86_64")  sysname=amd64_linux26 ;;
    "armv7h")  sysname=arm_linux26 ;;
    *)         error "Unknown architecture '$CARCH'" && false
  esac

  if [ $ENABLE_KAUTH -eq 1 ]; then
    kauth="enable-kauth"
  else
    kauth="disable-kauth"
  fi

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --disable-kernel-module \
              --without-swig \
              --with-afs-sysname=$sysname \
              --$kauth

  make all_nolibafs
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install_nolibafs

  # install systemd service files
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-client.service" "${pkgdir}/usr/lib/systemd/system/openafs-client.service"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-server.service" "${pkgdir}/usr/lib/systemd/system/openafs-server.service"

  # install default configs
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/afsd/CellServDB" "${pkgdir}/etc/${pkgname}/CellServDB"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs.sysconfig" "${pkgdir}/etc/conf.d/openafs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-ThisCell" "${pkgdir}/etc/${pkgname}/ThisCell"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-cacheinfo" "${pkgdir}/etc/${pkgname}/cacheinfo"

  # install license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install tmpfiles.d entry for /afs
  install -Dm644 "${srcdir}/tmpfiles.d-openafs.conf" "${pkgdir}/usr/lib/tmpfiles.d/openafs.conf"

  # rename backup which is a script installed as part of tar
  mv "${pkgdir}/usr/bin/backup" "${pkgdir}/usr/bin/backup-openafs"
  mv "${pkgdir}/usr/share/man/man8/backup.8" "${pkgdir}/usr/share/man/man8/backup-openafs.8"

  # if kauth was installed rename kpasswd which is already provided by krb5 and move PAM libs
  if [ $ENABLE_KAUTH -eq 1 ]; then
    install -dm755 "${pkgdir}/usr/lib/security"
    mv "${pkgdir}/usr/lib/pam_afs.krb.so" "${pkgdir}/usr/lib/pam_afs.so" "${pkgdir}/usr/lib/security/"
    mv "${pkgdir}/usr/bin/kpasswd" "${pkgdir}/usr/bin/kpasswd-openafs"
    mv "${pkgdir}/usr/share/man/man1/kpasswd.1" "${pkgdir}/usr/share/man/man1/kpasswd-openafs.1"
  fi
}

# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.8.6
pkgrel=3
pkgdesc="Open source implementation of the AFS distributed file system"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('krb5')
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
        0001-Temporary-fix-for-compilation-with-GCC-10.patch
        0002-Adjust-RedHat-config-and-service-files.patch
        0003-rx-rx_InitHost-do-not-overwrite-RAND_bytes-rx_nextCi.patch
        0004-rx-update_nextCid-overflow-handling-is-broken.patch
        0005-Remove-overflow-check-from-update_nextCid.patch)
sha256sums=('8b4e9d3180f1ecd752753da17ac630df04eb7007c90a921a5f6403c0339d2945'
            'e34fa28d9ee06b47d080e4ed0c1f55fe2629ce974f1a7a7ec60dd6e87a9d21e9'
            '18d7b0173bbffbdc212f4e58c5b3ce369adf868452aabc3485f2a6a2ddb35d68'
            '5a64f667ef5c63a0b54e859ccde0a69f6d883bfadfa5ce4b3e0a98e613764258'
            '30cd5cb67782161a8510039c14479a02252e3bb80fdf23795753ddb7f1aeadf7'
            '302cf63380e43145949f6e91e9510fdc8ed94de915b90975212a5bdb55bb9259'
            '3ab566be3b11bcd8e59d7809ee4e73e3b7206b7cf21097d5cf55675543c2b785'
            '94dea81621ba41b7b1122d977c60d66431b64bead0d6796ef322b04196579e63')

# If you need the kauth tools set this to 1. But be aware that these tools
# are considered insecure since 2003! This also affects the PAM libs.
ENABLE_KAUTH=0

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}/0001-Temporary-fix-for-compilation-with-GCC-10.patch"

  # Adjust RedHat config and service files to our needs
  patch -p1 < "${srcdir}/0002-Adjust-RedHat-config-and-service-files.patch"

  # Fix RX bug triggered after 14.01.2021 08:25:36 UTC
  # https://gerrit.openafs.org/#/c/14493/
  # https://gerrit.openafs.org/#/c/14494/
  # https://gerrit.openafs.org/#/c/14497/
  patch -p1 < "${srcdir}"/0003-rx-rx_InitHost-do-not-overwrite-RAND_bytes-rx_nextCi.patch
  patch -p1 < "${srcdir}"/0004-rx-update_nextCid-overflow-handling-is-broken.patch
  patch -p1 < "${srcdir}"/0005-Remove-overflow-check-from-update_nextCid.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
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

  # if kauth was installed rename kpasswd which is already provided by krb5 and move PAM libs
  if [ $ENABLE_KAUTH -eq 1 ]; then
    install -dm755 "${pkgdir}/usr/lib/security"
    mv "${pkgdir}/usr/lib/pam_afs.krb.so" "${pkgdir}/usr/lib/pam_afs.so" "${pkgdir}/usr/lib/security/"
    mv "${pkgdir}/usr/bin/kpasswd" "${pkgdir}/usr/bin/kpasswd-openafs"
    mv "${pkgdir}/usr/share/man/man1/kpasswd.1" "${pkgdir}/usr/share/man/man1/kpasswd-openafs.1"
  fi
}

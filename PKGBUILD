# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.8.8.1
pkgrel=2
pkgdesc="Open source implementation of the AFS distributed file system"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
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
        0001-Accepted-changes-for-openafs-stable-1_8_x.patch.gz
        0002-Pending-changes-for-openafs-stable-1_8_x.patch.gz
        0003-Linux-Introduce-file-mapping-readpage-helpers.patch
        0004-Linux-5.19-Rename-aops-readpage-to-read_folio.patch
        0005-Linux-5.19-Remove-flags-from-aops-write_begin.patch
        0006-Adjust-RedHat-config-and-service-files.patch)
sha256sums=('e7c4bed7075bcd6402e3f0c2d5b9dbe76ad2ee3c5fd5ddc3973a3356ca23ef44'
            'cb5ecedc2e164bea3b48c6b2c9d6f1c36bfde91d068a4c62a9c885df48fe8e6b'
            '18d7b0173bbffbdc212f4e58c5b3ce369adf868452aabc3485f2a6a2ddb35d68'
            '8e9fd9e37fe55a379534f4ccb48be9f37c141e13e7f28aa834793eaa7ade1bd4'
            'eb78d128fa3bfad82e40c9077ff972f0dd34a9745a6463ae2ac0f6cb9d912853'
            '0e902a093d5bad45f422ef1fc47c686503315fa3049f304eadb8b9dae6be8027'
            '0bb7ac77fa5d3d42bd78f67974ecbcc7cb8973e2859d74c361cb5fa18275cb8e'
            '7c7c6d9e76b436f95ba46138b979694cb50ff33eba2de82f1f5d426213f1768c'
            'd5b8223ab81a84639bd5614dffe67724640f2ea437374d2b0f2d066bd53cde2d')

# If you need the kauth tools set this to 1. But be aware that these tools
# are considered insecure since 2003! This also affects the PAM libs.
ENABLE_KAUTH=0

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Changes that have been accepted for OpenAFS 1.8.x
  zcat "${srcdir}"/0001-Accepted-changes-for-openafs-stable-1_8_x.patch.gz | patch -p1

  # Changes likely to be accepted for OpenAFS 1.8.x
  zcat "${srcdir}"/0002-Pending-changes-for-openafs-stable-1_8_x.patch.gz | patch -p1

  # Changes to support Linux 5.19
  patch -p1 < "${srcdir}"/0003-Linux-Introduce-file-mapping-readpage-helpers.patch
  patch -p1 < "${srcdir}"/0004-Linux-5.19-Rename-aops-readpage-to-read_folio.patch
  patch -p1 < "${srcdir}"/0005-Linux-5.19-Remove-flags-from-aops-write_begin.patch

  # Adjust RedHat config and service files to our needs
  patch -p1 < "${srcdir}"/0006-Adjust-RedHat-config-and-service-files.patch

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

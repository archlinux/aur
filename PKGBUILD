# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.8.9
pkgrel=1
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
        0001-Adjust-RedHat-config-and-service-files.patch)
sha256sums=('d126178be1f42cca18cb7c0c2691ac354518e3790170150a76bbd25f4d151f06'
            'ef91e854eab4aa74268525954a41c2a2ad0a2eaf530eaa22bb9e4bf453b15939'
            '18d7b0173bbffbdc212f4e58c5b3ce369adf868452aabc3485f2a6a2ddb35d68'
            'c67d55cf9899610d3c43389861c61ebb88d196ba8503547911dfa821b54ccd29')

# If you need the kauth tools set this to 1. But be aware that these tools
# are considered insecure since 2003! This also affects the PAM libs.
ENABLE_KAUTH=0

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Adjust RedHat config and service files to our needs
  patch -p1 < "${srcdir}"/0001-Adjust-RedHat-config-and-service-files.patch

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

  # if kauth was installed rename kpasswd which is already provided by krb5 and move PAM libs
  if [ $ENABLE_KAUTH -eq 1 ]; then
    install -dm755 "${pkgdir}/usr/lib/security"
    mv "${pkgdir}/usr/lib/pam_afs.krb.so" "${pkgdir}/usr/lib/pam_afs.so" "${pkgdir}/usr/lib/security/"
    mv "${pkgdir}/usr/bin/kpasswd" "${pkgdir}/usr/bin/kpasswd-openafs"
    mv "${pkgdir}/usr/share/man/man1/kpasswd.1" "${pkgdir}/usr/share/man/man1/kpasswd-openafs.1"
  fi
}

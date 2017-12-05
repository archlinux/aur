# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.6.22
pkgrel=1
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
source=(http://openafs.org/dl/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2
        http://openafs.org/dl/${pkgver}/${pkgname}-${pkgver}-doc.tar.bz2
        0001-Adjust-RedHat-config-and-service-files.patch
        0002-Add-configure-option-to-not-install-kauth.patch
        0003-Do-not-install-kauth-manpages-when-kauth-is-disabled.patch
        0004-vol-add-missing-include-of-stdint.h-to-volinodes.h.patch
        0005-Correct-m4-conditionals-in-curses.m4.patch
        0006-gtx-link-against-libtinfo-if-termlib-is-seperated.patch
        tmpfiles.d-openafs.conf)
sha256sums=('835410b75d14aec1ac6a1138d8194897f1badeffa3a0c282963ad51996712347'
            '0e177e007ea802891d23bcecd5a836f7c768e9af0d70aab4259233cd2d474a0f'
            'd8f7a86b38e23b4cf87e0ee2316dff7181bbc665bda67a675dc038ee863d75e9'
            '58d4c6ccf6593c1d636f754151f519f1739fadb8b58f09876eac1b186830d53b'
            '637301787ee0097c879065f1f22a3b240692d97f5d735ec1a3bfb12571c761c6'
            'a4a944df1b23a1ae90b9af05382b09a624ec80629f3c307dc9f8b245ace7b73e'
            '0e374c821390685fbb90beab178da9381e765b57608e95ed339d864facd71150'
            'ee998d2e06c5443f19cfbad811459e962052c1adabf29058d3802dbe54c22681'
            '18d7b0173bbffbdc212f4e58c5b3ce369adf868452aabc3485f2a6a2ddb35d68')

# If you need the kauth tools set this to 1. But be aware that these tools
# are considered insecure since 2003!
ENABLE_KAUTH=0

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Adjust RedHat config and service files to our needs
  patch -p1 < ${srcdir}/0001-Adjust-RedHat-config-and-service-files.patch

  # Backport possibility to disable kauth
  patch -p1 < ${srcdir}/0002-Add-configure-option-to-not-install-kauth.patch
  patch -p1 < ${srcdir}/0003-Do-not-install-kauth-manpages-when-kauth-is-disabled.patch

  # Fix missing include of stdint.h (under review: https://gerrit.openafs.org/12724/)
  patch -p1 < ${srcdir}/0004-vol-add-missing-include-of-stdint.h-to-volinodes.h.patch

  # Fix curses checks during configure (https://gerrit.openafs.org/12740/)
  patch -p1 < ${srcdir}/0005-Correct-m4-conditionals-in-curses.m4.patch

  # Fix build when ncurses was compiled with --with-termlib=tinfo
  # https://rt.central.org/rt/Ticket/Display.html?id=134420
  # https://gerrit.openafs.org/12760/
  # Should not be required anymore: https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/ncurses&id=987faeb8442d44e76a7a58642e8e6432eb220c25
  # but let's keep it for future ncurses updates.
  patch -p1 < ${srcdir}/0006-gtx-link-against-libtinfo-if-termlib-is-seperated.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

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
              --with-afs-sysname=$sysname \
              --$kauth

  make all_nolibafs
}


package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install_nolibafs

  # move PAM libs
  install -dm755 ${pkgdir}/usr/lib/security
  mv ${pkgdir}/usr/lib/pam_afs.krb.so.1 ${pkgdir}/usr/lib/pam_afs.so.1 ${pkgdir}/usr/lib/security/

  # install systemd service files
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-client.service ${pkgdir}/usr/lib/systemd/system/openafs-client.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-server.service ${pkgdir}/usr/lib/systemd/system/openafs-server.service

  # install default configs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/afsd/CellServDB ${pkgdir}/etc/${pkgname}/CellServDB
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs.sysconfig ${pkgdir}/etc/conf.d/openafs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-ThisCell ${pkgdir}/etc/${pkgname}/ThisCell
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-cacheinfo ${pkgdir}/etc/${pkgname}/cacheinfo

  # install license
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # install tmpfiles.d entry for /afs
  install -Dm644 ${srcdir}/tmpfiles.d-openafs.conf ${pkgdir}/usr/lib/tmpfiles.d/openafs.conf

  # if kauth was installed rename kpasswd which is already provided by krb5
  if [ $ENABLE_KAUTH -eq 1 ]; then
    mv ${pkgdir}/usr/bin/kpasswd ${pkgdir}/usr/bin/kpasswd-openafs
    mv ${pkgdir}/usr/share/man/man1/kpasswd.1 ${pkgdir}/usr/share/man/man1/kpasswd-openafs.1
  fi
}

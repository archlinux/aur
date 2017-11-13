# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.6.21.1
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
source=(http://openafs.org/dl/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2
        http://openafs.org/dl/${pkgver}/${pkgname}-${pkgver}-doc.tar.bz2
        0001-Adjust-RedHat-config-and-service-files.patch
        0002-Add-configure-option-to-not-install-kauth.patch
        0003-Do-not-install-kauth-manpages-when-kauth-is-disabled.patch
        0004-vol-add-missing-include-of-stdint.h-to-volinodes.h.patch
        0005-Correct-m4-conditionals-in-curses.m4.patch
        0006-gtx-link-against-libtinfo-if-termlib-is-seperated.patch
        tmpfiles.d-openafs.conf)
sha256sums=('aed896b0f598e3033e9ceb2a1eae24addff9ec0bb2d713ab63945a449ded3a5a'
            'a8b2482eaa3bd5a3521b8dfde69337e5e01b1b1626c0a2e0a489049834a2983a'
            '87f08df5c1a2e899fe2ef6fb28cb1f7ad9bb0de640eec55e168c1bc93324feff'
            '5f31cdf2feca73e7b245138a33bc2132a34cfa331d63bb47292ed30528cbf15c'
            '161a24a29299e30288d0f8ebfbb22eca1d3563fbc5104a6f2e0f76f46d6458c9'
            '91f3e85e475358d86dd597022420bc98475c5ab644973e83fd54733e616f9f50'
            '7ee59c390419b2f09c1dc1874f7ea5e8f4a77be6fa2f7b1b051ad4f7a663d021'
            'd62a3b24d3b86f9f498b89dec9a43be489a0bb7aebce4efe46007424a0f23595'
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

# $Id$
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=shadow-selinux
pkgver=4.1.5.1
pkgrel=7
pkgdesc="Password and account management tool suite with support for shadow files and PAM - SELinux support"
arch=('i686' 'x86_64')
url='http://pkg-shadow.alioth.debian.org/'
license=('BSD')
groups=('selinux')
depends=('bash' 'pam-selinux' 'acl' 'libselinux')
conflicts=("${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(etc/login.defs
        etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
        etc/pam.d/{chgpasswd,groupmems}
        etc/default/useradd)
options=(strip debug)
install='shadow.install'
source=("http://pkg-shadow.alioth.debian.org/releases/${pkgname/-selinux}-$pkgver.tar.bz2"{,.sig}
        LICENSE
        chgpasswd
        chpasswd
        defaults.pam
        login.defs
        newusers
        passwd
        shadow.cron.daily
        useradd.defaults
        xstrdup.patch
        shadow-strncpy-usage.patch
        lastlog.tmpfiles)
sha1sums=('81f38720b953ef9c2c100c43d02dfe19cafd6c30'
          'SKIP'
          '33a6cf1e44a1410e5c9726c89e5de68b78f5f922'
          '4ad0e059406a305c8640ed30d93c2a1f62c2f4ad'
          '12427b1ca92a9b85ca8202239f0d9f50198b818f'
          '0e56fed7fc93572c6bf0d8f3b099166558bb46f1'
          'e92045fb75e0c21a3f294a00de0bd2cd252e9463'
          '12427b1ca92a9b85ca8202239f0d9f50198b818f'
          '611be25d91c3f8f307c7fe2485d5f781e5dee75f'
          '98f4919014b1a9eb9f01ca7731e04b1d973cedd5'
          '9ae93de5987dd0ae428f0cc1a5a5a5cd53583f19'
          '6010fffeed1fc6673ad9875492e1193b1a847b53'
          '21e12966a6befb25ec123b403cd9b5c492fe5b16'
          'f57ecde3f72b4738fad75c097d19cf46a412350f')

build() {
  cd "${pkgname/-selinux}-$pkgver"

  # avoid transitive linking issues with binutils 2.22
  sed -i '/^user\(mod\|add\)_LDADD/s|$| -lattr|' src/Makefile.am

  # link to glibc's crypt(3)
  export LIBS="-lcrypt -lselinux"

  # need to offer these upstream
  patch -Np1 <"$srcdir/xstrdup.patch"
  patch -Np1 <"$srcdir/shadow-strncpy-usage.patch"

  # supress etc/pam.d/*, we provide our own
  sed -i '/^SUBDIRS/s/pam.d//' etc/Makefile.in

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --with-libpam \
    --with-selinux \
    --with-group-name-max-length=32

  make
}

package() {
  cd "${pkgname/-selinux}-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/shadow/LICENSE"

  # useradd defaults
  install -Dm644 "$srcdir/useradd.defaults" "$pkgdir/etc/default/useradd"

  # cron job
  install -Dm744 "$srcdir/shadow.cron.daily" "$pkgdir/etc/cron.daily/shadow"

  # login.defs
  install -Dm644 "$srcdir/login.defs" "$pkgdir/etc/login.defs"

  # PAM config - custom
  install -dm755 "$pkgdir/etc/pam.d"
  install -t "$pkgdir/etc/pam.d" -m644 "$srcdir"/{passwd,chgpasswd,chpasswd,newusers}

  # PAM config - from tarball
  install -Dm644 etc/pam.d/groupmems "$pkgdir/etc/pam.d/groupmems"

  # we use the 'useradd' PAM file for other similar utilities
  for file in chage groupadd groupdel groupmod shadow \
      useradd usermod userdel; do
    install -Dm644 "$srcdir/defaults.pam" "$pkgdir/etc/pam.d/$file"
  done

  # lastlog log file creation
  install -Dm644 "$srcdir/lastlog.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lastlog.conf"

  # Remove evil/broken tools
  rm "$pkgdir"/usr/sbin/logoutd

  # Remove utilities provided by util-linux
  rm \
      "$pkgdir"/usr/bin/{login,su,chsh,chfn,sg,nologin} \
      "$pkgdir"/usr/sbin/{vipw,vigr}

  # but we keep newgrp, as sg is really an alias to it
  mv "$pkgdir"/usr/bin/{newgrp,sg}

  # ...and their many man pages
  find "$pkgdir"/usr/share/man \
      '(' -name 'chsh.1'    -o \
          -name 'chfn.1'    -o \
          -name 'su.1'      -o \
          -name 'logoutd.8' -o \
          -name 'login.1'   -o \
          -name 'nologin.8' -o \
          -name 'vipw.8'    -o \
          -name 'vigr.8'    -o \
          -name 'newgrp.1' ')' \
      -delete
  rmdir \
      "$pkgdir"/usr/share/man/{fi,id,zh_TW}/man1 \
      "$pkgdir"/usr/share/man/{fi,ko/man8}

  # move everything else to /usr/bin, because this isn't handled by ./configure
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir/usr/sbin"
}

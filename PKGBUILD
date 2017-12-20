# $Id$
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
# SELinux Contributor: Zezadas

pkgname=shadow-selinux
pkgver=4.5
pkgrel=4
pkgdesc="Password and account management tool suite with support for shadow files and PAM - SELinux support"
arch=('x86_64')
url='https://github.com/shadow-maint/shadow'
license=('BSD')
groups=('selinux')
depends=('bash' 'pam-selinux' 'acl' 'libsemanage')
makedepends=('git' 'libxslt' 'docbook-xsl' 'gnome-doc-utils')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(etc/login.defs
        etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
        etc/pam.d/{chgpasswd,groupmems}
        etc/default/useradd)
options=(strip debug)
install='shadow.install'
validpgpkeys=('D5C2F9BFCA128BBA22A77218872F702C4D6E25A8')  # Christian Perrier
source=("git+https://github.com/shadow-maint/shadow.git#tag=$pkgver"
        LICENSE
        chgpasswd
        chpasswd
        defaults.pam
        login.defs
        newusers
        passwd
        shadow.{timer,service}
        useradd.defaults
        xstrdup.patch
        shadow-strncpy-usage.patch)
sha1sums=('SKIP'
          '33a6cf1e44a1410e5c9726c89e5de68b78f5f922'
          '4ad0e059406a305c8640ed30d93c2a1f62c2f4ad'
          '12427b1ca92a9b85ca8202239f0d9f50198b818f'
          '0e56fed7fc93572c6bf0d8f3b099166558bb46f1'
          '81a02eadb5f605fef5c75b6d8a03713a7041864b'
          '12427b1ca92a9b85ca8202239f0d9f50198b818f'
          '611be25d91c3f8f307c7fe2485d5f781e5dee75f'
          'a154a94b47a3d0c6c287253b98c0d10b861226d0'
          'b5540736f5acbc23b568973eb5645604762db3dd'
          'c173208c5cf34528602f9931468a67b7f68abad3'
          '6010fffeed1fc6673ad9875492e1193b1a847b53'
          '21e12966a6befb25ec123b403cd9b5c492fe5b16')

pkgver() {
  cd "${pkgname/-selinux}"

  git describe
}

prepare() {
  cd "${pkgname/-selinux}"

  # need to offer these upstream
  patch -Np1 <"$srcdir/xstrdup.patch"
  patch -Np1 <"$srcdir/shadow-strncpy-usage.patch"

  autoreconf -v -f --install

  # supress etc/pam.d/*, we provide our own
  sed -i '/^SUBDIRS/s/pam\.d//' etc/Makefile.in
}

build() {
  cd "${pkgname/-selinux}"

  ./configure \
    LIBS="-lcrypt" \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --enable-man \
    --sysconfdir=/etc \
    --with-libpam \
    --with-group-name-max-length=32 \
    --with-selinux

  make
}

package() {
  cd "${pkgname/-selinux}"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # useradd defaults
  install -Dm644 "$srcdir/useradd.defaults" "$pkgdir/etc/default/useradd"

  # systemd timer
  install -D -m644 "$srcdir/shadow.timer" "$pkgdir/usr/lib/systemd/system/shadow.timer"
  install -D -m644 "$srcdir/shadow.service" $pkgdir/usr/lib/systemd/system/shadow.service
  install -d -m755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"

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

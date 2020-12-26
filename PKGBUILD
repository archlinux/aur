# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow-minimal-git
pkgver=4.8.1
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=('x86_64')
url='https://github.com/shadow-maint/shadow'
license=('BSD')
# libcap-ng needed by install scriptlet for 'filecap'
depends=('pam' 'acl' 'libacl.so' 'libcap-ng' 'libcap-ng.so'
         'libxcrypt' 'libcrypt.so')
backup=(etc/login.defs
        etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
        etc/pam.d/{chgpasswd,groupmems}
        etc/default/useradd)
options=(strip)
provides=(shadow)
conflicts=(shadow)
#validpgpkeys=('D5C2F9BFCA128BBA22A77218872F702C4D6E25A8'   # Christian Perrier
#              'F1D08DB778185BF784002DFFE9FEEA06A85E3F9D')  # Serge Hallyn
source=("git+https://github.com/shadow-maint/shadow"
        LICENSE
        chgpasswd
        chpasswd
        defaults.pam
        login.defs
        newusers
        passwd
        shadow.{timer,service}
        useradd.defaults)
install=shadow.install
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

pkgver() {
   cd shadow
   git describe --tags | sed 's/-/+/g'
}

build() {
  cd shadow

  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --disable-account-tools-setuid \
    --with-libpam \
    --with-group-name-max-length=32 \
    --without-audit \
    --without-btrfs \
    --without-selinux

  make
}

package() {
  cd shadow

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/shadow/LICENSE"

  # useradd defaults
  install -Dm600 "$srcdir/useradd.defaults" "$pkgdir/etc/default/useradd"

  # systemd units
  install -D -m644 "$srcdir/shadow.timer" "$pkgdir/usr/lib/systemd/system/shadow.timer"
  install -D -m644 "$srcdir/shadow.service" "$pkgdir/usr/lib/systemd/system/shadow.service"
  install -d -m755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"

  # login.defs
  install -Dm644 "$srcdir/login.defs" "$pkgdir/etc/login.defs"

  # PAM config - custom
  rm "$pkgdir/etc/pam.d"/*
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
#  find "$pkgdir"/usr/share/man \
#      '(' -name 'chsh.1'    -o \
#          -name 'chfn.1'    -o \
#          -name 'su.1'      -o \
#          -name 'logoutd.8' -o \
#          -name 'login.1'   -o \
#          -name 'nologin.8' -o \
#          -name 'vipw.8'    -o \
#          -name 'vigr.8'    -o \
#          -name 'newgrp.1' ')' \
#      -delete
#  rmdir \
#      "$pkgdir"/usr/share/man/{fi,id,zh_TW}/man1 \
#      "$pkgdir"/usr/share/man/{fi,ko/man8}

  # move everything else to /usr/bin, because this isn't handled by ./configure
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir/usr/sbin"
}

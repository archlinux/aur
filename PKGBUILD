# Maintainer: Alec Larsen <hello@alec.ninja>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow-relaxed
pkgver=4.11.1
pkgrel=1
pkgdesc="The official Arch shadow package with Fedora's shadow-4.8-goodname.patch"
arch=('x86_64')
url='https://github.com/shadow-maint/shadow'
license=('BSD')
# libcap-ng needed by install scriptlet for 'filecap'
depends=('pam' 'acl' 'libacl.so' 'audit' 'libaudit.so' 'libcap-ng' 'libcap-ng.so'
         'libxcrypt' 'libcrypt.so')
conflicts=('shadow')
provides=('shadow')
backup=(etc/login.defs
        etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
        etc/pam.d/{chgpasswd,groupmems}
        etc/default/useradd)
options=('!emptydirs')
validpgpkeys=('66D0387DB85D320F8408166DB175CFA98F192AF2')  # Serge Hallyn
source=("https://github.com/shadow-maint/shadow/releases/download/v$pkgver/shadow-$pkgver.tar.xz"{,.asc}
	"https://src.fedoraproject.org/rpms/shadow-utils/raw/rawhide/f/shadow-4.8-goodname.patch"
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
sha1sums=('9cb767b86ff2b46e880b428e817972aa07b3a67c'
          'SKIP'
	  '3a26667844689c69a26fc964b798586f652d3df5'
          '33a6cf1e44a1410e5c9726c89e5de68b78f5f922'
          '4ad0e059406a305c8640ed30d93c2a1f62c2f4ad'
          '12427b1ca92a9b85ca8202239f0d9f50198b818f'
          '0e56fed7fc93572c6bf0d8f3b099166558bb46f1'
          '81a02eadb5f605fef5c75b6d8a03713a7041864b'
          '12427b1ca92a9b85ca8202239f0d9f50198b818f'
          '611be25d91c3f8f307c7fe2485d5f781e5dee75f'
          'a154a94b47a3d0c6c287253b98c0d10b861226d0'
          'b5540736f5acbc23b568973eb5645604762db3dd'
          'c173208c5cf34528602f9931468a67b7f68abad3')

build() {
  cd "shadow-$pkgver"

  # apply Fedora's shadow-utils/raw/f33/f/shadow-4.8-goodname.patch
  patch -Np1 <"$srcdir/shadow-4.8-goodname.patch"

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
    --with-audit \
    --without-selinux \
    --without-su

  make
}

package() {
  cd "shadow-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

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
      "$pkgdir"/usr/bin/{login,chsh,chfn,sg,nologin} \
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

  # move everything else to /usr/bin, because this isn't handled by ./configure
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir/usr/sbin"
}

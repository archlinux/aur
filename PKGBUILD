# Note: I am only maintainer of this patched version and do not release updates frequently
# Maintainer: Andy Pieters <arch at AndyPieters dot me dot uk>
pkgname=shadow-capitals
pkgver=4.2.1
pkgrel=2
pkgdesc="Password and account management tool suite with support for shadow files and PAM; Patched to allow capitals in user, and group names"
arch=('i686' 'x86_64')
url='http://pkg-shadow.alioth.debian.org/'
license=('BSD')
groups=('base')
depends=('bash' 'pam' 'acl')
backup=(etc/login.defs
        etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
        etc/pam.d/{chgpasswd,groupmems}
        etc/default/useradd)
provides=(shadow)
replaces=(shadow)
conflicts=(shadow)
options=(strip)
install='shadow.install'
validpgpkeys=('D5C2F9BFCA128BBA22A77218872F702C4D6E25A8')  # Christian Perrier
source=("http://pkg-shadow.alioth.debian.org/releases/shadow-$pkgver.tar.xz"{,.sig}
		LICENSE 					chgpasswd
		chpasswd					defaults.pam
		login.defs					newusers
		passwd						shadow.{timer,service}
		useradd.defaults			xstrdup.patch
		shadow-strncpy-usage.patch	lastlog.tmpfiles
		username-allow-capitals.patch
)

sha1sums=(
	'0917cbadd4ce0c7c36670e5ecd37bbed92e6d82d'	#shadow-$pkgver.tar.xz
	'SKIP'										#shadow-$pkgver.tar.xz.sig
	'33a6cf1e44a1410e5c9726c89e5de68b78f5f922'	#LICENSE
	'4ad0e059406a305c8640ed30d93c2a1f62c2f4ad'	#chgpasswd
	'12427b1ca92a9b85ca8202239f0d9f50198b818f'	#chpasswd
	'0e56fed7fc93572c6bf0d8f3b099166558bb46f1'	#defaults.pam
	'e92045fb75e0c21a3f294a00de0bd2cd252e9463'	#login.defs
	'12427b1ca92a9b85ca8202239f0d9f50198b818f'	#newusers
	'611be25d91c3f8f307c7fe2485d5f781e5dee75f'	#paswd
	'a154a94b47a3d0c6c287253b98c0d10b861226d0'	#shadow.timer
	'e40fc20894e69a07fb0070b41f567d0c27133720'	#shadow.service
	'9ae93de5987dd0ae428f0cc1a5a5a5cd53583f19'	#useradd.defaults
	'6010fffeed1fc6673ad9875492e1193b1a847b53'	#xstrdup.patch
	'21e12966a6befb25ec123b403cd9b5c492fe5b16'	#shadow-strncpy-usage.patch
	'f57ecde3f72b4738fad75c097d19cf46a412350f'	#lastlog.tmpfiles
	'0fa4e993557025c77253535324f384ef49a3a9f2'	#username-allow-capitals.patch
)

prepare() {
  cd "shadow-$pkgver"

  # need to offer these upstream
  patch -Np1 <"$srcdir/xstrdup.patch"
  patch -Np1 <"$srcdir/shadow-strncpy-usage.patch"
  patch -Np1 <"$srcdir/username-allow-capitals.patch"

  # supress etc/pam.d/*, we provide our own
  sed -i '/^SUBDIRS/s/pam\.d//' etc/Makefile.in
}

build() {
  cd "shadow-$pkgver"

  ./configure \
    LIBS="-lcrypt" \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --with-libpam \
    --with-group-name-max-length=32 \
    --without-selinux

  make
}

package() {
  cd "shadow-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/shadow/LICENSE"

  # useradd defaults
  install -Dm644 "$srcdir/useradd.defaults" "$pkgdir/etc/default/useradd"

  # systemd timer
  install -D -m644 "$srcdir/shadow.timer" "$pkgdir/usr/lib/systemd/system/shadow.timer"
  install -D -m644 "$srcdir/shadow.service" $pkgdir/usr/lib/systemd/system/shadow.service
  install -d -m755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/shadow.timer"

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
  install -Dm644 "$srcdir/lastlog.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lastlog.conf"

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

# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
# SELinux Contributor: Zezadas
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=shadow-selinux
pkgver=4.20.0.arch1
_upstream_tag=${pkgver%.*}
_dist_tag=${pkgver%.*}-arch${pkgver#*.arch}
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM - SELinux support"
arch=(x86_64 aarch64)
url="https://github.com/shadow-maint/shadow"
license=(
  0BSD
  BSD-3-Clause
)
groups=(selinux)
depends=(
  glibc
  'libsemanage>=3.2'
)
makedepends=(
  acl
  audit
  docbook-xsl
  git
  itstool
  libcap
  libxcrypt
  libxslt
  pam-selinux
)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/chpasswd
  etc/pam.d/newusers
  etc/pam.d/passwd
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
options=(!emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/
source=(
  git+$url.git?signed#tag=${_upstream_tag}
  https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/releases/${_dist_tag}/downloads/${pkgname/-selinux}-${_dist_tag}.patch.{sig,zst}
  shadow.{timer,service}
  useradd.defaults
  LICENSE
)
sha512sums=('c21152c9aaf7bf817d87be9f8eb4b804a3ee6c5090829a44742099e48817d3da0a1a754f78a9842ef9284eaebc78b290ad4a6bcdc40511158a33c240c2f78add'
            'SKIP'
            '9e57ff88750c3e283232a9dd33db06b094009b8ce72b92a07be2eb81cd407402c747dbea8e1373c8421a28d46acffbb908d75e82fa84b2f233b580487de43183'
            'e4edf705dd04e088c6b561713eaa1afeb92f42ac13722bff037aede6ac5ad7d4d00828cfb677f7b1ff048db8b6788238c1ab6a71dfcfd3e02ef6cb78ae09a621'
            '2c8689b52029f6aa27d75b8b05b0b36e2fc322cab40fdfbb50cdbe331f61bc84e8db20f012cf9af3de8c4e7fdb10c2d5a4925ca1ba3b70eb5627772b94da84b3'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('9539673cd7f8cfd43844171546001b9686a1f35e55489750b1e80c76317ba06ee0e35cdffeef5c5cce28099f4b53afb62763cff1ba3b680d3220c40dfe482577'
        'SKIP'
        '323d2ef8d92d73388b9013fbe620d7ebfa960bcdb871941325090f7f1005e07374853ae57ed1877e0d66b74f36551610c5e920091dea180c54df4006ebbab666'
        '5cfc936555aa2b2e15f8830ff83764dad6e11a80e2a102c5f2bd3b7c83db22a5457a3afdd182e3648c9d7d5bca90fa550f59576d0ac47a11a31dfb636cb18f2b'
        'a69191ab966f146c35e7e911e7e57c29fffd54436ea014aa8ffe0dd46aaf57c635d0a652b35916745c75d82b3fca7234366ea5f810b622e94730b45ec86f122c'
        'f743922062494fe342036b3acb8b747429eb33b1a13aa150daa4bb71a84e9c570cfcc8527a5f846e3ea7020e6f23c0b10d78cf2ba8363eea0224e4c34ea10161'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')
validpgpkeys=(
  66D0387DB85D320F8408166DB175CFA98F192AF2  # Serge Hallyn <sergeh@kernel.org>
  A9348594CE31283A826FBDD8D57633D441E25BB5  # Alejandro Colomar <alx@kernel.org>
  991F6E3F0765CF6295888586139B09DA5BF0D338  # David Runge <dvzrv@archlinux.org>
)

prepare() {
  cd "${pkgname/-selinux}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --bindir=/usr/bin
    --disable-account-tools-setuid  # no setuid for chgpasswd, chpasswd, groupadd, groupdel, groupmod, newusers, useradd, userdel, usermod
    --enable-man
    --libdir=/usr/lib
    --mandir=/usr/share/man
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-audit
    --with-fcaps  # use capabilities instead of setuid for setuidmap and setgidmap
    --with-group-name-max-length=32
    --with-libpam  # PAM integration for chpasswd, newusers, passwd
    --with-yescrypt
    --without-bcrypt
    --without-libbsd  # shadow can use internal implementation for getting passphrase
    --without-nscd  # we do not ship nscd anymore
    --with-selinux
    --without-su  # su is provided by util-linux
  )

  cd "${pkgname/-selinux}"
  # add extra check, preventing accidental deletion of other user's home dirs when using `userdel -r <user with home in />`
  export CFLAGS="$CFLAGS -DEXTRA_CHECK_HOME_DIR"
  ./configure "${configure_options[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(
    acl libacl.so
    audit libaudit.so
    libxcrypt libcrypt.so
    pam libpam.so libpam_misc.so
  )

  cd "${pkgname/-selinux}"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"

  # systemd units
  install -vDm 644 ../shadow.timer -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../shadow.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vdm 755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"
}

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
pkgver=4.13
pkgrel=2
pkgdesc="Password and account management tool suite with support for shadow files and PAM - SELinux support"
arch=(x86_64 aarch64)
url="https://github.com/shadow-maint/shadow"
license=(BSD)
groups=(selinux)
depends=(
  acl libacl.so
  attr libattr.so
  audit libaudit.so
  glibc
  libxcrypt libcrypt.so
  pam-selinux libpam.so libpam_misc.so
  'libsemanage>=3.2'
)
makedepends=(docbook-xsl itstool libcap libxslt)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/{chage,{,ch,chg}passwd,group{add,del,mems,mod},newusers,shadow,user{add,del,mod}}
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
options=(!emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/v4.13.0.arch1
source=(
  https://github.com/shadow-maint/shadow/releases/download/$pkgver/shadow-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-and-man-pages.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  0004-Add-Arch-Linux-defaults-for-etc-pam.d.patch
  shadow.{timer,service}
  useradd.defaults
)
sha512sums=('2949a728c3312bef13d23138d6b79caf402781b1cb179e33b5be546c1790971ec20778d0e9cd3dbe09691d928ffcbe88e60da42fab58c69a90d5ebe5e3e2ab8e'
            'SKIP'
            '23215dbc4efa5cb321f32442be30b92f79f1e008c7418ee5daac27540785c1674e790a5e4ee755e9a5a086589be8437e25efbee4a4668918b14337b86309192b'
            '26160ba1bc42619077dd826fc6e472196e47f4f2e29f9a70d68373a73df9d6187e3a2671369a223e230b05b42af113c38aacf24cd6cb99fbc00b8baca71ab6b7'
            '3b8bec1dc5dfdc5a3b7b3a4579c05d7fc71ac80c87bdb35031820c2442efcae5dfcc97c763ca9430c1dc3f5d3827dc391999cb67e89d3758d31bdc694dff4601'
            'fcedd59f0c1294ca03ff2553591058295073e9c795500f66e571e34635016898b999afa816c5994846e459bf743d2c7a358a5be1f561a86a75846df2112194e1'
            'e4edf705dd04e088c6b561713eaa1afeb92f42ac13722bff037aede6ac5ad7d4d00828cfb677f7b1ff048db8b6788238c1ab6a71dfcfd3e02ef6cb78ae09a621'
            '79afad34a698444e6971408d353ea7510aa2e3d0b93e096b2ce528748632a76084b4f69b64a97a1fd1d9942ce84165b0b82cfad828c5a5a9dca2e91f82839995'
            'e9ffea021ee4031b9ad3a534bfb94dbf9d0dfd45a55ecac5dedb2453ea0c17fb80bbb9ad039686bc1f3349dc371977eb548e3a665c56531469c22f29fc4eced8')
b2sums=('315ab8a7e598aeefb50c11293e20cfa0982c3c3ae21c35ae243d09a4facf97a13c1d672990876e74ef94f5284402acf14997663743e2aaefa6cfc4369b7d24dc'
        'SKIP'
        'e109e09f7709270e6042389f74ee59f44d95c3bd02aa57fedbe27f1e111d36fdb2fc4bb9f837916bfd83ebfa7d1d0859a50d6fefe573da3fd6f849cfd61a0187'
        '9d3490810bc94c8809442e9e3928fd4dfc62a22e7134ecc63098a1e2ab5db6c64867f6f067641bb7bccf712a7269b67c36434d2ae3ed3e0a206ac66eef299dc9'
        '92474c0a9cd8bc4df08984a304c73122a9711f1e4c036361e1dcbc027b1e43e007d1e35cdd5db4295829603a097ab360adb66289c4b479a5d5ccee4947f72da7'
        'aee9aaadae6d49872b4eb98334fbffee7a49b1625b81019927908ac79753364fdac4d87433fcd5d2d2327d7b65eddcfc2edabe7c6a2a67ad7b101ab0bf6deaad'
        '5cfc936555aa2b2e15f8830ff83764dad6e11a80e2a102c5f2bd3b7c83db22a5457a3afdd182e3648c9d7d5bca90fa550f59576d0ac47a11a31dfb636cb18f2b'
        '9b8946b14607cbe2f2abb8b616ed50d1ea737687b540f22c4ab451acec30aca86eea3400765dd78e0ab2577b5438a66d91507fc4afc6c0888ac4bc97381dd08d'
        'd5bea0cfc2e6d3d1749c65440ca911533d41b6f8117fe09e9efec23524637cfa823d230303a7fbb45d3cd251bf8036d48b9b21049ced208f7ed191fcbd75e879')
validpgpkeys=(66D0387DB85D320F8408166DB175CFA98F192AF2)  # Serge Hallyn <sergeh@kernel.org>

prepare() {
  local filename

  cd "${pkgname/-selinux}-$pkgver"
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      printf "Applying patch %s\n" "${filename##*/}"
      patch -Np1 -i "$srcdir/${filename##*/}"
    fi
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --bindir=/usr/bin
    --sbindir=/usr/bin
    --libdir=/usr/lib
    --mandir=/usr/share/man
    --sysconfdir=/etc
    --disable-account-tools-setuid
    --enable-man
    --with-fcaps
    --with-libpam
    --with-group-name-max-length=32
    --with-audit
    --with-bcrypt
    --with-yescrypt
    --with-selinux
    --without-su
  )

  cd "${pkgname/-selinux}-$pkgver"
  ./configure "${configure_options[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${pkgname/-selinux}-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"

  # systemd units
  install -vDm 644 ../shadow.timer -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../shadow.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vdm 755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"
}

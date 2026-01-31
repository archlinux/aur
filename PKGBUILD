pkgname=binkd
pkgver=1.1a.115
pkgrel=1
pkgdesc="Binkley protocol daemon for transferring files between Fidonet systems"
arch=('i686' 'x86_64')
url="https://github.com/pgul/binkd"
license=('GPL')
backup=("etc/binkd/binkd.conf")
source=("git+https://github.com/pgul/binkd.git"
        "binkd.service"
        "binkd@.service"
        "binkd.socket"
        "binkd.tmpfiles"
        "0001_gcc14_bz2_detection_fix.patch"
        "0002_stdc23_build_fix.patch"
        "0003_config_reload_crashfix_on_defnode_with_pipe.patch"
        "0004_dont_warn_if_bind_family_not_supported_on_remote.patch"
        "0005_stop_compression_after_skips.patch"
        "0006_perlhooks_rc2_on_session_with_skips.patch"
        "0007_fix_unexpected_session_close_by_remote_right_after_skip.patch"
        "ftnaddr.patch"
        "ftnnode.patch"
        )
install="binkd.install"
sha256sums=('SKIP'
            '3f2ddf00b1552ad90a7320c7d904afab13fb2de525568190c80c7d87f67cc0c8'
            '2ebaebb7b525f9eaa1915dfeabba1626422d300f9820981225509203e6dcbc59'
            '2ddcb26a54f7a0f9a8ab5d8819431fb1f2bd961169c6fe5e7afa7f4c89e11786'
            '5032916082884a938978f0d5168fd053baab230bd34e84008ae637515e04a685'
            'b90daa916c43eb76371ee4b6bfd65953fa76b6b7bbfb7103c8a21fc8a861b58e'
            '05847455f218bc041ca15b532d845b23b16fb1ce2a7c983ed283dc1ea9f31f55'
            'bd8c5ffdcef73bee8f2b383bb5950b4a77f43c0ae4ebc40e8542f33f92e14e2e'
            'e2655f8a0c375e9413ca6ff213d260d5ac175d49e46e27210dab45dd511fbcea'
            '0b416062465ca0a30acd45c109c27037e17c88bac52872fdc723e7d5045ce26b'
            '4a9a1a93769c4ca78cbbbe7f5182eea5802f71ffc4423a345713f3ebc61adb70'
            '26db164082ac0769b27935238c10cd877dff8383f05af0c2dbd050b1676b77a9'
            '0503990e3dc9911a1ca7272f64e9ff8114cb545bf8fa028e5a4d68f1d15f1fcf'
            '9bf0005f9b97ada9029da67dc95ebc51dab3cffe6849040fde3e9cc7dc28f797')

pkgver() {
  grep Version "$srcdir/binkd/mkfls/unix/binkd.spec" | awk '{ print $2 }'
  #git describe --tags | sed 's/^binkd-//; s/-/.r/; s/[-_]/./g'
}

build() {
  cd "$srcdir/binkd"
  patch -p1 -i ../0001_gcc14_bz2_detection_fix.patch
  patch -p1 -i ../0002_stdc23_build_fix.patch
  patch -p1 -i ../0003_config_reload_crashfix_on_defnode_with_pipe.patch
  patch -p1 -i ../0004_dont_warn_if_bind_family_not_supported_on_remote.patch
  patch -p1 -i ../0005_stop_compression_after_skips.patch
  patch -p1 -i ../0006_perlhooks_rc2_on_session_with_skips.patch
  patch -p1 -i ../0007_fix_unexpected_session_close_by_remote_right_after_skip.patch
  patch -p1 -i ../ftnaddr.patch
  patch -p1 -i ../ftnnode.patch
  cp mkfls/unix/{Makefile*,configure*,install-sh,mkinstalldirs} .
  export CFLAGS="${CFLAGS} -D_GNU_SOURCE"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --mandir=/usr/share/man \
    --sysconfdir=/etc       \
    --with-debug            \
    --with-zlib             \
    ;
  make
}

package() {
  cd "$srcdir/binkd"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  install -dm0755 "$pkgdir/etc/binkd"
  mv "$pkgdir/etc/binkd.conf-dist" "$pkgdir/etc/binkd/binkd.conf"

  for dir in inbound{,-temp,-unsecure} outbound/fidonet longbox personalboxes nodelist; do
    mkdir -p "$pkgdir/var/spool/ftn/$dir"
  done

  cd "$srcdir"
  install -Dm0644 binkd.service   "$pkgdir/usr/lib/systemd/system/binkd.service"
  install -Dm0644 binkd@.service  "$pkgdir/usr/lib/systemd/system/binkd@.service"
  install -Dm0644 binkd.socket    "$pkgdir/usr/lib/systemd/system/binkd.socket"
  install -Dm0644 binkd.tmpfiles  "$pkgdir/usr/lib/tmpfiles.d/binkd.conf"
}

# vim: ts=2:sw=2:et

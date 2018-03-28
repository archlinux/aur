# $Id$
# Contributor: judd <jvinet@zeroflux.org>

_target=aarch64-linux-gnu
_pkgbase=util-linux
pkgbase=${_target}-util-linux
#pkgname=(${_target}-util-linux ${_target}-libutil-linux)
pkgname=(${_target}-util-linux ${_target}-libutil-linux)
_pkgmajor=2.32
pkgver=${_pkgmajor}
pkgrel=1
pkgdesc="Miscellaneous system utilities for Linux"
url="https://www.kernel.org/pub/linux/utils/util-linux/"
arch=('any')
makedepends=('systemd' 'python' 'libcap-ng')
license=('GPL2')
options=('strip' 'debug')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v$_pkgmajor/$_pkgbase-$pkgver.tar."{xz,sign}
        pam-{login,common,su}
        'util-linux.sysusers'
        '60-rfkill.rules'
        'rfkill-unblock_.service'
        'rfkill-block_.service')
sha256sums=('6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734'
            'SKIP'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92'
            'fc6807842f92e9d3f792d6b64a0d5aad87995a279153ab228b1b2a64d9f32f20'
            '51eac9c2a2f51ad3982bba35de9aac5510f1eeff432d2d63c6362e45d620afc0'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37'
            '8ccec10a22523f6b9d55e0d6cbf91905a39881446710aa083e935e8073323376'
            'a22e0a037e702170c7d88460cc9c9c2ab1d3e5c54a6985cd4a164ea7beff1b36')

build() {
  cd "$_pkgbase-$pkgver"

if [ n != "$RUN_PREPARE" ]; then
  if [ 1 = "$ccache" ]; then
    export CC=${CC:-ccache ${_target}-gcc}
    export CXX=${CXX:-ccache ${_target}-g++}
  fi
  unset CFLAGS CXXFLAGS
  ./configure --prefix=/usr/${_target} \
              --libdir=/usr/${_target}/lib \
              --bindir=/usr/${_target}/bin \
              --host=${_target} \
              --localstatedir=/run \
              --enable-fs-paths-extra=/usr/bin \
              --enable-raw \
              --enable-vipw \
              --enable-newgrp \
              --enable-write \
              --enable-mesg \
              --without-systemd \
              --without-python

#              --with-python=3
#              --enable-chfn-chsh \

fi

  make
}

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

check() {
  local s readelfarch
  readelfarch='AArch64'
  cd "$_pkgbase-$pkgver"

  s=$(find . -type f "(" -name "*.so*" -o -name "*.a" ")" -print0 | \
    2>/dev/null LC_ALL=C xargs -0 readelf -h | \
    sed -n -e '/File:/h;/Machine:/{/'"$readelfarch"'/!{H;x;p}}' | head -10)

  if [ -n "$s" ]; then
    >&2 echo "some binaries have wrong architecture:"
    >&2 echo "$s"
    return 1
  fi
}

package_util-linux() {
if false; then
  conflicts=('eject' 'zramctl' 'rfkill')
  provides=('eject' 'zramctl' 'rfkill')
  replaces=('zramctl' 'rfkill')
fi
  depends=('pam' 'shadow' 'coreutils' 'libsystemd' 'libcap-ng' "${_target}-libutil-linux")
  optdepends=('python: python bindings to libmount')
  groups=('base' 'base-devel')
  backup=(
#          etc/pam.d/chfn
#          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/su
          etc/pam.d/su-l)

  cd "$_pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install
if false; then

  # setuid chfn and chsh
  #chmod 4755 "$pkgdir"/usr/${_target}/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
  install -m644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
  install -m644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
  install -m644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su"
  install -m644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su-l"

  # TODO(dreisner): offer this upstream?
  sed -i '/ListenStream/ aRuntimeDirectory=uuidd' "$pkgdir/usr/${_target}/lib/systemd/system/uuidd.socket"
fi

  # adjust for usrmove
  # TODO(dreisner): fix configure.ac upstream so that this isn't needed
  cd "$pkgdir/usr/${_target}"
  shopt -s nullglob
  mv {,../}sbin/* bin
  rmdir sbin ../sbin*
  shopt -u nullglob

  ### runtime libs are shipped as part of libutil-linux
  rm "$pkgdir"/usr/${_target}/lib/lib*.{a,so}*

  ### install systemd-sysusers
  #install -Dm644 "$srcdir/util-linux.sysusers" \
  #  "$pkgdir/usr/${_target}/lib/sysusers.d/util-linux.conf"

  install -Dm644 "$srcdir/60-rfkill.rules" \
    "$pkgdir/usr/${_target}/lib/udev/rules.d/60-rfkill.rules"

  #install -Dm644 "$srcdir/rfkill-unblock_.service" \
  #  "$pkgdir/usr/${_target}/lib/systemd/system/rfkill-unblock@.service"
  #install -Dm644 "$srcdir/rfkill-block_.service" \
  #  "$pkgdir/usr/${_target}/lib/systemd/system/rfkill-block@.service"

  # delete all executables
  rm -rf "$pkgdir/usr/${_target}/bin"
}

package_libutil-linux() {
  pkgdesc="util-linux runtime libraries"
  provides=('libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so')

  make -C "$_pkgbase-$pkgver" DESTDIR="$pkgdir" install-usrlib_execLTLIBRARIES
}

# define target package functions
for p in "${pkgname[@]}"; do
  eval "package_${p}() { package_${p/${_target}-/} "'"$@"'"; }"
done

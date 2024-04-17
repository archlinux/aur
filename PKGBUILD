# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor:: AndyRTR <andyrtr@archlinux.org>

pkgname=xorg-xwayland-bug865-issue1578
pkgver=23.2.6
pkgrel=1
arch=('x86_64')
license=(
    LicenseRef-Adobe-Display-PostScript
    BSD-3-Clause
    LicenseRef-DEC-3-Clause
    HPND
    LicenseRef-HPND-sell-MIT-disclaimer-xserver
    HPND-sell-variant
    ICU
    ISC
    MIT
    MIT-open-group
    NTP
    SGI-B-2.0
    SMLNJ
    X11
    X11-distribute-modifications-variant
)
groups=('xorg')
url="https://xorg.freedesktop.org"
pkgdesc="run X clients under wayland"
depends=('nettle' 'libepoxy' 'systemd-libs' 'libxfont2' 
         'pixman' 'xorg-server-common' 'libxcvt' 'mesa'
         'libglvnd' 'libxau' 'wayland' 'libdrm' 'libtirpc'
         'libxshmfence' 'glibc')
makedepends=('meson' 'xorgproto' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util' 'wayland-protocols' 'mesa-libgl'
             'systemd' 'egl-wayland')
source=("https://xorg.freedesktop.org/archive/individual/xserver/xwayland-$pkgver.tar.xz"
        "freedesktop-bug-865.patch" # The patch for freedesktop bug 865
        "revert-for-issue-1578.patch") # The patch for revert change that break issue 1578 workaround
sha1sums=('8c45b889051bdea66fba51f267374a38b1fd1f49'
          '5c4f422327ae37c40a72e960e239591ca5e03c3a'
          'ad932cfba975aa42bfbd9379df156aca5bc62116')
provides=('xorg-xwayland')
conflicts=('xorg-xwayland')

prepare() {
  cd "xwayland-$pkgver"

  for patch in "${source[@]}"; do
    if [[ $patch == *.patch ]]; then
      msg2 "Applying $patch"
      patch --no-backup-if-mismatch -Np1 -i "$srcdir/$patch"
    fi
  done

  # Workaround for freedesktop issue 1578
  sed -i '/total = delta;/i\    delta *= 1.9;'  dix/getevents.c
}

build() {
  arch-meson xwayland-$pkgver build \
    -D ipv6=true \
    -D xvfb=false \
    -D xdmcp=false \
    -D xcsecurity=true \
    -D dri3=true \
    -D xwayland_eglstream=true \
    -D glamor=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb

  # Print config
  meson configure build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  # xorg-server-common file /usr/lib/xorg/protocol.txt
  rm "${pkgdir}"/usr/lib/xorg/protocol.txt
  rmdir "${pkgdir}"/usr/lib/xorg
  rm "${pkgdir}"/usr/share/man/man1/Xserver.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xwayland-$pkgver/COPYING
}

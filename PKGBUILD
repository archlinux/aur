# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-bug865
pkgname=xorg-server-bug865

_commit=bc111a2e67e16d4e6d4f3196ab86c22c1e278c45 # server-1.20-branch 2020-12-01 = 1.20.10

pkgver=1.20.10
pkgrel=3
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson' 'git'
             'wayland-protocols' 'egl-wayland')
source=(#https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2{,.sig}
        "git+https://gitlab.freedesktop.org/xorg/xserver#commit=${_commit}" #?signed"
        xserver-autobind-hotplug.patch
        0001-v2-FS-58644.patch
        0002-fix-libshadow-2.patch
        xvfb-run # with updates from FC master
        xvfb-run.1
        freedesktop-bug-865.patch)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
              ''
              '3BB639E56F861FA2E86505690FDD682D974CA72A')
sha256sums=('SKIP'
            'cae1b7f296c18177de38f9b1215a4f916da2288b85f1fcb9e80373a42e2892b8'
            '6253fb5cf06cf650539be585d6ca13cfa00217b51ca9825476c8fd55c09341a4'
            'd07b2fe55828dad61517a80c77f6f183113916f5e1fce30ff43041550d58bd6e'
            'd709078f5658576931655c7a46ff90b3586a2643a9124075d00ff3a567937845'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
            '460615227a7e42d124639d4ae02e55d1b2a250c7bdf539e018b46de71230364f')

pkgver() {
  cd xserver
  git describe --tags | sed 's/^xorg.server.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  #cd "xorg-server-${pkgver}"
  cd xserver

  # patch from Fedora, not yet merged
  patch -Np1 -i ../xserver-autobind-hotplug.patch

  # Fix rootless xorg - FS#58644
  # https://bugs.freedesktop.org/show_bug.cgi?id=106588
  patch -Np1 -i ../0001-v2-FS-58644.patch

  # Fix libshadow.so: libfb.so => not found - merge in master
  patch -Np1 -i ../0002-fix-libshadow-2.patch

  # The patch for freedesktop bug 865
  patch -Np1 -i "${srcdir}/freedesktop-bug-865.patch"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  #arch-meson xorg-server-$pkgver build \
  arch-meson xserver build \
    -D os_vendor="Arch Linux" \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D xwayland=true \
    -D xwayland_eglstream=true \
    -D glamor=true \
    -D udev=true \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb

  # Print config
  meson configure build
  ninja -C build

  # fake installation to be seperated into packages
  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}
package_xorg-server-bug865() {
  pkgdesc="Xorg X server with the patch for freedesktop bug 865 (need to kick hotkeys on release, not press)"
  depends=(libepoxy libxfont2 pixman xorg-server-common libunwind
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' "xorg-server=$pkgver")
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server.install

  _install fakeinstall/usr/bin/{Xorg,cvt,gtf}
  ln -s /usr/bin/Xorg "${pkgdir}/usr/bin/X"
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-quirks.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,cvt,gtf}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,modesetting}.4
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xorg-server-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# noudev: based on artix PKGBUILD
# - disable udev and logind support
# - change default keyboard driver to kbd
# - set SUID on /usr/bin/X to allow user to start X

pkgbase=xorg-server-noudev
_pkgbase=xorg-server
pkgname=('xorg-server-noudev' 'xorg-server-xephyr-noudev' 'xorg-server-xvfb-noudev' 'xorg-server-xnest-noudev'
         'xorg-server-common-noudev' 'xorg-server-devel-noudev')

_commit=bc111a2e67e16d4e6d4f3196ab86c22c1e278c45 # server-1.20-branch 2020-12-01 = 1.20.10

pkgver=1.20.10
pkgrel=3
arch=('x86_64' 'aarch64')
license=('custom')
groups=('xorg-noudev')
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'meson' 'git'
             'wayland-protocols' 'egl-wayland')
source=(#https://xorg.freedesktop.org/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
        "git+https://gitlab.freedesktop.org/xorg/xserver#commit=$_commit"
        xserver-autobind-hotplug.patch
        0001-v2-FS-58644.patch
        0002-fix-libshadow-2.patch
        xvfb-run # with updates from FC master
        xvfb-run.1)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
              ''
              '3BB639E56F861FA2E86505690FDD682D974CA72A')
sha256sums=('SKIP'
            'cae1b7f296c18177de38f9b1215a4f916da2288b85f1fcb9e80373a42e2892b8'
            '6253fb5cf06cf650539be585d6ca13cfa00217b51ca9825476c8fd55c09341a4'
            'd07b2fe55828dad61517a80c77f6f183113916f5e1fce30ff43041550d58bd6e'
            '021e5d2d22fe7e707d5fe239433d828764ea8c141248b9a71fd4006286a4d275'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776')

pkgver() {
  cd xserver
   git describe --tags | sed 's/^xorg.server.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  #cd "${_pkgbase}-${pkgver}"
  cd xserver

  # patch from Fedora, not yet merged
  patch -Np1 -i ../xserver-autobind-hotplug.patch

  # Fix rootless xorg - FS#58644
  # https://bugs.freedesktop.org/show_bug.cgi?id=106588
  patch -Np1 -i ../0001-v2-FS-58644.patch

  # Fix libshadow.so: libfb.so => not found - merge in master
  patch -Np1 -i ../0002-fix-libshadow-2.patch
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  #arch-meson ${_pkgbase}-$pkgver build \
  arch-meson xserver build \
    -D os_vendor="Artix Linux"  \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D xwayland=true \
    -D xwayland_eglstream=true \
    -D glamor=true \
    -D udev=false \
    -D xkb_default_rules=kbd \
    -D systemd_logind=false \
    -D elogind=false \
    -D suid_wrapper=false \
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

package_xorg-server-common-noudev() {
  pkgdesc="Xorg server common files (without udev support)"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  provides=('xorg-server-common')
  replaces=('xorg-server-common')
  conflicts=('xorg-server-common')

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  #install -m644 -Dt "${pkgdir}/var/lib/xkb/" "${_pkgbase}-${pkgver}"/xkb/README.compiled
  install -m644 -Dt "${pkgdir}/var/lib/xkb/" xserver/xkb/README.compiled
  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

package_xorg-server-noudev() {
  pkgdesc="Xorg X server (without udev support)"
  depends=(libepoxy libxfont2 pixman xorg-server-common-noudev libunwind
           dbus libgl nettle
           libpciaccess libdrm libxshmfence) # FS#52949

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('xorg-server' 'X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server')
  conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xf86-input-libinput')
  replaces=('xorg-server' 'glamor-egl' 'xf86-video-modesetting')

  _install fakeinstall/usr/bin/{Xorg,cvt,gtf}
  ln -s /usr/bin/Xorg "${pkgdir}/usr/bin/X"
  #_install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-quirks.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,cvt,gtf}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,modesetting}.4
  _install fakeinstall/usr/share/man/man5/{xorg.conf,xorg.conf.d}.5

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
  
  # SUID on Xorg to allow user to start it
  chmod u+s "${pkgdir}/usr/bin/Xorg"
}

package_xorg-server-xephyr-noudev() {
  pkgdesc="A nested X server that runs as an X application (without udev support)"
  depends=(libxfont2 libgl libepoxy libunwind libxv pixman xorg-server-common-noudev
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
           nettle libtirpc)
  provides=('xorg-server-xephyr')
  conflicts=('xorg-server-xephyr')
  replaces=('xorg-server-xephyr')

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

package_xorg-server-xvfb-noudev() {
  pkgdesc="Virtual framebuffer X server (without udev support)"
  depends=(libxfont2 libunwind pixman xorg-server-common-noudev xorg-xauth libgl nettle)
  provides=('xorg-server-xvfb')
  conflicts=('xorg-server-xvfb')
  replaces=('xorg-server-xvfb')

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

package_xorg-server-xnest-noudev() {
  pkgdesc="A nested X server that runs as an X application (without udev support)"
  depends=(libxfont2 libxext pixman xorg-server-common-noudev nettle libtirpc)
  provides=('xorg-server-xnest')
  conflicts=('xorg-server-xnest')
  replaces=('xorg-server-xnest')

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

package_xorg-server-devel-noudev() {
  pkgdesc="Development files for the X.Org X server (without udev support)"
  depends=('xorgproto' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  provides=('xorg-server-devel')
  conflicts=('xorg-server-devel')
  replaces=('xorg-server-devel')

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING

  # make sure there are no files left to install
  rm fakeinstall/usr/bin/Xwayland
  find fakeinstall -depth -print0 | xargs -0 rmdir
}

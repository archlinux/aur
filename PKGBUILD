# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-bug865
pkgname=xorg-server-bug865

pkgver=21.1.18
pkgrel=2
arch=('x86_64')
license=('LicenseRef-Adobe-Display-PostScript'
         'BSD-3-Clause'
         'LicenseRef-DEC-3-Clause'
         'HPND'
         'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
         'HPND-sell-variant'
         'ICU'
         'ISC'
         'MIT'
         'MIT-open-group'
         'NTP'
         'SGI-B-2.0'
         'SMLNJ'
         'X11'
         'X11-distribute-modifications-variant'
)
groups=('xorg')
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson' 'git')
source=(xorg-server::git+https://gitlab.freedesktop.org/xorg/xserver.git?signed#tag=xorg-server-${pkgver}
        xvfb-run # with updates from FC master
        xvfb-run.1
        freedesktop-bug-865.patch)
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF'  # Peter Hutterer (Who-T) <office@who-t.net>
              '67DC86F2623FC5FD4BB5225D14706DBE1E4B4540'  # Olivier Fourdan <fourdan@xfce.org>
              'FD0004A26EADFE43A4C3F249C6F7AE200374452D' # Povilas Kanapickas <povilas@radix.lt>
              '3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
sha512sums=('7677bb9585e44f5cfeba955514152ae8232841db402e833696b841c9620662a9f11dcf1d1a6b7392a6e22489607048b022b9c22c9c544703cd76e520cdb01e11'
            '672375cb5028ba9cda286e317d17bd8c9a9039483e7f79c21f223fd08ba07655729e9f59a082f4b8f5d8de45a77a9e9affce1002fb8c6657e26ef1a490654e49'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
            'c3b541c7ac95c94f682577cacedc06e79427003a870cde844056a7662087873b59dc06933552bb867b16fc0387f8a061672df780454769f26aa3e53b13a94edf')

prepare() {
  cd "xorg-server"

  # The patch for freedesktop bug 865
  patch -Np1 -i "${srcdir}/freedesktop-bug-865.patch"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  arch-meson xorg-server build \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D glamor=true \
    -D udev=true \
    -D dtrace=false \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D linux_acpi=false \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D libunwind=true

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
    # use copy so a new file is created and fakeroot can track properties such as setuid
    cp -av "${src}" "${dir}/"
    rm -rf "${src}"
  done
}
package_xorg-server-bug865() {
  pkgdesc="Xorg X server with the patch for freedesktop bug 865 (need to kick hotkeys on release, not press)"
  depends=(libepoxy libxfont2 pixman xorg-server-common libunwind
           dbus libgl xf86-input-libinput nettle
           libxdmcp sh glibc libxau systemd-libs libtirpc
           libpciaccess libdrm libxshmfence libxcvt) # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=25.2' 'X-ABI-XINPUT_VERSION=24.4' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' "xorg-server=$pkgver")
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server.install

  _install fakeinstall/usr/bin/{X,Xorg,gtf}
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-quirks.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,gtf}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,inputtestdrv,modesetting}.4
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xorg-server/COPYING"
}

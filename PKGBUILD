# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xlibre-xserver
pkgname=('xlibre-xserver' 'xlibre-xserver-xephyr' 'xlibre-xserver-xvfb'
         'xlibre-xserver-xnest' 'xlibre-xserver-common' 'xlibre-xserver-devel')
pkgver=25.1.8
pkgrel=3
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
groups=('xlibre')
url="https://xlibre.net"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson')
source=(https://github.com/X11Libre/xserver/archive/refs/tags/${pkgbase}-"${pkgver}".tar.gz
        xvfb-run # with updates from FC master
        xvfb-run.1
)
sha512sums=('6a6d8fe212258d22de899cdee853c7f6517db0d982a96a9d0009f8ddef58bb5804614e0c984f354febd8854da836c46a53817204767355b47615c9b7b6af7a60'
            '672375cb5028ba9cda286e317d17bd8c9a9039483e7f79c21f223fd08ba07655729e9f59a082f4b8f5d8de45a77a9e9affce1002fb8c6657e26ef1a490654e49'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22')

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  arch-meson "xserver-${pkgbase}-${pkgver}" build \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D xfbdev=true \
    -D glamor=true \
    -D udev=true \
    -D udev_kms=true \
    -D dtrace=false \
    -D seatd_libseat=false \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D linux_acpi=false \
    -D legacy_nvidia_padding=true \
    -D legacy_nvidia_340x=true \
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

package_xlibre-xserver-common() {
  pkgdesc="XLibre server common files"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  provides=('xorg-server-common')
  conflicts=('xlibre-xserver-common-beta' 'xorg-server-common')

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "xserver-${pkgbase}-${pkgver}"/xkb/README.compiled
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver() {
  pkgdesc="XLibre X server"
  depends=(libepoxy libxfont2 pixman xlibre-xserver-common libunwind
           dbus libgl nettle
           libxdmcp sh glibc libxau systemd-libs libtirpc libbsd
           libpciaccess libdrm libxshmfence libxcvt) # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('xorg-server' 'X-ABI-VIDEODRV_VERSION=28.0' 'X-ABI-XINPUT_VERSION=26.0' 'X-ABI-EXTENSION_VERSION=11.0' 'x-server')
  conflicts=('xlibre-xserver-beta' 'xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  replaces=('glamor-egl' 'xf86-video-modesetting')

  _install fakeinstall/usr/bin/{X,Xorg,gtf,Xfbdev}
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-{nvidia,nvidia-modules,quirks}.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,gtf,Xfbdev}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,inputtestdrv,modesetting}.4
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xephyr() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont2 libgl libepoxy libunwind systemd-libs pixman xlibre-xserver-common
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
           nettle libtirpc
           xcb-util libxdmcp libx11 libxau libxshmfence glibc)
  provides=('xorg-server-xephyr')
  conflicts=('xlibre-xserver-xephyr-beta' 'xorg-server-xephyr')

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xvfb() {
  pkgdesc="Virtual framebuffer X server"
  # xvfb-run is GPLv2, rest is MIT
  license=('MIT' 'GPL-2.0-only')
  depends=(libxfont2 libunwind pixman xlibre-xserver-common xorg-xauth
           libgl nettle libtirpc systemd-libs
           libxdmcp sh glibc libxau)
  provides=('xorg-server-xvfb')
  conflicts=('xlibre-xserver-xvfb-beta' 'xorg-server-xvfb')

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xnest() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont2 libunwind libxext pixman xlibre-xserver-common nettle
           libtirpc systemd-libs
           libxdmcp glibc libx11 libxau)
  provides=('xorg-server-xnest')
  conflicts=('xlibre-xserver-xnest-beta' 'xorg-server-xnest')

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-devel() {
  pkgdesc="Development files for the XLibre Xserver"
  depends=('xlibre-xserver' 'xorgproto' 'mesa' 'libpciaccess' 'pixman'
           # not technically required but almost every XLibre pkg needs it to build
           'xorg-util-macros')
  provides=('xorg-server-devel')
  conflicts=('xlibre-xserver-devel-beta' 'xorg-server-devel')

  rm fakeinstall/etc/X11/xorg.conf.d/10-nvidia-modules.conf.debian
  rm fakeinstall/etc/X11/xorg.conf.d/10-nvidia.conf.debian

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xlibre-server.pc
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${pkgbase}-${pkgver}"/COPYING

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir
}

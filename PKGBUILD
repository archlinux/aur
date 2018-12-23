# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# noudev: based on artix PKGBUILD
# - disable udev and logind support
# - change default keyboard driver to kbd
# - set SUID on /usr/bin/X to allow user to start X

pkgbase=xorg-server-noudev
_pkgbase=xorg-server
pkgname=('xorg-server-noudev' 'xorg-server-xephyr-noudev' 'xorg-server-xdmx-noudev' 'xorg-server-xvfb-noudev' 'xorg-server-xnest-noudev'
         'xorg-server-xwayland-noudev' 'xorg-server-common-noudev' 'xorg-server-devel-noudev')
pkgver=1.20.3
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg-noudev')
url="http://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'wayland-protocols' 'egl-wayland' 'meson') # 'git')
source=(https://xorg.freedesktop.org/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
        'xwayland-config.h.meson.in::https://cgit.freedesktop.org/xorg/xserver/plain/include/xwayland-config.h.meson.in?id=xorg-server-1.20.0'
        xserver-autobind-hotplug.patch
        0001-v2-FS-58644.patch
        0002-fix-libshadow-2.patch
        xvfb-run # with updates from FC master
        xvfb-run.1)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
              '995ED5C8A6138EB0961F18474C09DD83CAAA50B2')
sha512sums=('ee44554f86df4297f54c5871fe7a18954eeef4338775a25f36d6577b279c4775f61128da71b86cfaeadcc080838d6749dede138d4db178866579da2056543fba'
            'SKIP'
            'd707e0870367de2665c3b82f09564d17ed3f62c9e8b4bd471c11af1fb1e9249e306e92c7961a04e355756eec9f5271bc8e66999e56c73c31bc9da4127ff30a8e'
            'd84f4d63a502b7af76ea49944d1b21e2030dfd250ac1e82878935cf631973310ac9ba1f0dfedf10980ec6c7431d61b7daa4b7bbaae9ee477b2c19812c1661a22'
            '74e1aa0c101e42f0f25349d305641873b3a79ab3b9bb2d4ed68ba8e392b4db2701fcbc35826531ee2667d3ee55673e4b4fecc2a9f088141af29ceb400f72f363'
            '0c7f7e43a2ba2372509f4a35e33a8a87a2e631c7e630c9c7c67ecaad00453b52c31d9dc26d1852ecd2fe1cb8c02cb716c1f39a4723473c38a0ef6e559bead271'
            '55bbf520333f6e818b0125b37179a7039b69a0d3d2242b80a08da003d94cbf6c1fb912d880abcce318a85d7947e3eff8fbc4cdf57d7118572e8ebc56c4569af6'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22')

prepare() {
  # missing from tarball
  cp xwayland-config.h.meson.in ${_pkgbase}-${pkgver}/include/

  cd "${_pkgbase}-${pkgver}"

  # patch from Fedora, not yet merged
  patch -Np1 -i ../xserver-autobind-hotplug.patch

  # Fix rootless xorg - FS#58644
  # https://bugs.freedesktop.org/show_bug.cgi?id=106588
  patch -Np1 -i ../0001-v2-FS-58644.patch

  # Fix libshadow.so: libfb.so => not found - FS#58731
  # https://bugs.freedesktop.org/show_bug.cgi?id=106656
  patch -Np1 -i ../0002-fix-libshadow-2.patch
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  arch-meson ${_pkgbase}-$pkgver build \
    -D os_vendor="Artix Linux" \
    -D ipv6=true \
    -D dmx=true \
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

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "${_pkgbase}-${pkgver}"/xkb/README.compiled
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
}

package_xorg-server-noudev() {
  pkgdesc="Xorg X server (without udev support)"
  depends=(libepoxy libxfont2 pixman xorg-server-common-noudev libunwind
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('xorg-server' 'X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server')
  conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xf86-input-evdev')
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
  
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
}

package_xorg-server-xdmx-noudev() {
  pkgdesc="Distributed Multihead X Server and utilities (without udev support)"
  depends=(libxfont2 libxi libxaw libxrender libdmx libxfixes
           pixman xorg-server-common-noudev nettle)
  provides=('xorg-server-xdmx')
  conflicts=('xorg-server-xdmx')
  replaces=('xorg-server-xdmx')

  _install fakeinstall/usr/bin/{Xdmx,dmx*,vdltodmx,xdmxconfig}
  _install fakeinstall/usr/share/man/man1/{Xdmx,dmxtodmx,vdltodmx,xdmxconfig}.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
}

package_xorg-server-xwayland-noudev() {
  pkgdesc="run X clients under wayland (without udev support)"
  depends=(libxfont2 libepoxy libunwind libgl pixman xorg-server-common-noudev
           nettle libtirpc)
  provides=('xorg-server-xwayland')
  conflicts=('xorg-server-xwayland')
  replaces=('xorg-server-xwayland')

  _install fakeinstall/usr/bin/Xwayland

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}-${pkgver}"/COPYING

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir
}

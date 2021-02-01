# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>

pkgbase=xorg-server-dev
_srcname=xorg-server
pkgname=('xorg-server-dev' 'xorg-server-xephyr-dev' 'xorg-server-xdmx-dev' 'xorg-server-xvfb-dev' 'xorg-server-xnest-dev'
         'xorg-server-xwayland-dev' 'xorg-server-common-dev' 'xorg-server-devel-dev')
pkgver=1.20.10
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
pkgdesc='Xorg X server - bleeding edge version'
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson' 'git'
             'wayland-protocols' 'egl-wayland')
source=("https://xorg.freedesktop.org/releases/individual/xserver/${_srcname}-${pkgver}.tar.bz2"{,.sig}
        'xserver-autobind-hotplug.patch'
        '0001-v2-FS-58644.patch'
        '0002-fix-libshadow-2.patch'
        'xvfb-run' # with updates from FC master
        'xvfb-run.1')
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
              '3BB639E56F861FA2E86505690FDD682D974CA72A')
sha512sums=('a07bee380bb72f2117fe6f831a6e4aded19bea1f2b36e42a019a30348e98d6fe65c0617cf819be9c6b405502f88cafb829df30aab32393774b71f1418a4cefae'
            'SKIP'
            'd84f4d63a502b7af76ea49944d1b21e2030dfd250ac1e82878935cf631973310ac9ba1f0dfedf10980ec6c7431d61b7daa4b7bbaae9ee477b2c19812c1661a22'
            '74e1aa0c101e42f0f25349d305641873b3a79ab3b9bb2d4ed68ba8e392b4db2701fcbc35826531ee2667d3ee55673e4b4fecc2a9f088141af29ceb400f72f363'
            '3d3be34ad9fa976daec53573d3a30a9f1953341ba5ee27099af0141f0ef7994fa5cf84dc08aae848380e6abfc10879f9a67f07601c7a437abf8aef13a3ec9fe1'
            '73c8ead9fba6815dabfec0a55b3a53f01169f6f2d14ac4a431e53b2d96028672dbd6b50a3314568847b37b1e54ea4fc02bdf677feabb3b2697af55e2e5331810'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22')

prepare() {
  cd "${_srcname}-${pkgver}"

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

  arch-meson ${_srcname}-$pkgver build \
    -D os_vendor="Arch Linux" \
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

package_xorg-server-common-dev() {
  pkgdesc="Xorg server common files"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  provides=(xorg-server-common)
  conflicts=(xorg-server-common)

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "${_srcname}-${pkgver}"/xkb/README.compiled
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-dev() {
  pkgdesc="Xorg X server"
  depends=(libepoxy libxfont2 pixman xorg-server-common libunwind
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('xorg-server' 'X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server')
  conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-dev.install

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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-xephyr-dev() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont2 libgl libepoxy libunwind systemd-libs libxv pixman xorg-server-common
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
           nettle libtirpc)
  provides=(xorg-server-xephyr)
  conflicts=(xorg-server-xephyr)

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-xvfb-dev() {
  pkgdesc="Virtual framebuffer X server"
  depends=(libxfont2 libunwind pixman xorg-server-common xorg-xauth
           libgl nettle libtirpc)
  provides=(xorg-server-xvfb)
  conflicts=(xorg-server-xvfb)

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-xnest-dev() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont2 libxext pixman xorg-server-common nettle libtirpc)
  provides=(xorg-server-xnest)
  conflicts=(xorg-server-xnest)

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-xdmx-dev() {
  pkgdesc="Distributed Multihead X Server and utilities"
  depends=(libxfont2 libxi libxaw libxrender libdmx libxfixes
           pixman xorg-server-common nettle)
  provides=(xorg-server-xdmx)
  conflicts=(xorg-server-xdmx)

  _install fakeinstall/usr/bin/{Xdmx,dmx*,vdltodmx,xdmxconfig}
  _install fakeinstall/usr/share/man/man1/{Xdmx,dmxtodmx,vdltodmx,xdmxconfig}.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-xwayland-dev() {
  pkgdesc="run X clients under wayland"
  depends=(libxfont2 libepoxy libunwind systemd-libs libgl pixman xorg-server-common
           nettle libtirpc)
  provides=(xorg-server-xwayland)
  conflicts=(xorg-server-xwayland)

  _install fakeinstall/usr/bin/Xwayland

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING
}

package_xorg-server-devel-dev() {
  pkgdesc="Development files for the X.Org X server"
  depends=('xorgproto' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  provides=(xorg-server-devel)
  conflicts=(xorg-server-devel)

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}-${pkgver}"/COPYING

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir
}

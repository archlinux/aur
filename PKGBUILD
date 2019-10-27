# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-bug865
pkgname=xorg-server-bug865
pkgver=1.20.5
pkgrel=4
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'wayland-protocols' 'egl-wayland' 'meson') # 'git')
source=(https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2{,.sig}
        xserver-autobind-hotplug.patch
        0001-v2-FS-58644.patch
        0002-fix-libshadow-2.patch
        0001-Revert-present-scmd-Check-that-the-flip-and-screen-p.patch
        glvnd.patch
        xvfb-run # with updates from FC master
        xvfb-run.1
        freedesktop-bug-865.patch)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
              '995ED5C8A6138EB0961F18474C09DD83CAAA50B2')
sha512sums=('625f0626b122cf95600abe382c3217348999357a0e2d2443092f1b67cff1c98d7ef09303884ceaeac181e0555dc56b0d4d44bda45cc464dac2d9a50c5b32d631'
            'SKIP'
            'd84f4d63a502b7af76ea49944d1b21e2030dfd250ac1e82878935cf631973310ac9ba1f0dfedf10980ec6c7431d61b7daa4b7bbaae9ee477b2c19812c1661a22'
            '74e1aa0c101e42f0f25349d305641873b3a79ab3b9bb2d4ed68ba8e392b4db2701fcbc35826531ee2667d3ee55673e4b4fecc2a9f088141af29ceb400f72f363'
            '0c7f7e43a2ba2372509f4a35e33a8a87a2e631c7e630c9c7c67ecaad00453b52c31d9dc26d1852ecd2fe1cb8c02cb716c1f39a4723473c38a0ef6e559bead271'
            'd60662f4eefeb64a034563cbfc36167466e0f4b0357d996bdb3462de14b2936420414e3527defe72af781d9fe9757e7486a43f952d8b7740b08815bc5df7b28f'
            '0cdb9972af7fb215f0f2a7677cf05f0a35b7227a2953cb68a59d9947a02f6f1c128a080cf3e28d6c6295fc24d673cb258e29d6a976b8c924f73a797e5188452a'
            '55bbf520333f6e818b0125b37179a7039b69a0d3d2242b80a08da003d94cbf6c1fb912d880abcce318a85d7947e3eff8fbc4cdf57d7118572e8ebc56c4569af6'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
            '81be7b0ecd9de850f0c740762d37c7489f12b34eb6adb19b3d3077f66d66e48e1206eff4bd29e50f5640509390a08fa138a4664b60d90878d4d17cb1f6919baf')    

prepare() {
  cd "xorg-server-${pkgver}"

  # patch from Fedora, not yet merged
  patch -Np1 -i ../xserver-autobind-hotplug.patch

  # Fix rootless xorg - FS#58644
  # https://bugs.freedesktop.org/show_bug.cgi?id=106588
  patch -Np1 -i ../0001-v2-FS-58644.patch

  # Fix libshadow.so: libfb.so => not found - FS#58731
  # https://bugs.freedesktop.org/show_bug.cgi?id=106656
  patch -Np1 -i ../0002-fix-libshadow-2.patch

  # fix building with libglvnd - partially merged upstream - FS#64228
  patch -Np1 -i ../glvnd.patch

  # fix FS#62973 - merged upstream
  patch -Np1 -i ../0001-Revert-present-scmd-Check-that-the-flip-and-screen-p.patch

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

  arch-meson xorg-server-$pkgver build \
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xorg-server-${pkgver}"/COPYING
}

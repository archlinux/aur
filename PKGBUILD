# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-bug865
pkgname=xorg-server-bug865

pkgver=21.1.2
pkgrel=2
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson' 'git')
#source=(${pkgbase}-${pkgver}::git+https://gitlab.freedesktop.org/xorg/xserver.git#commit=27a0ee32ccef8d621aaa758c804fc9a5ceeb5a56
source=(https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${pkgver}.tar.xz{,.sig}
        xvfb-run # with updates from FC master
        xvfb-run.1
        0001-xf86-logind-Fix-compilation-error-when-built-without.patch
        0002-xf86-logind-fix-missing-call-to-vtenter-if-the-platf.patch
        freedesktop-bug-865.patch)
validpgpkeys=('FD0004A26EADFE43A4C3F249C6F7AE200374452D') # Povilas Kanapickas <povilas@radix.lt>
sha512sums=('6d7a0d29d5be09f80ed505c4d6ae964795127525a0ab73a4eab4f601788ab3627033143e5aeb4c2565c6683dd3402084d13acab5554606fbd519c4aec0a79def'
            'SKIP'
            '4154dd55702b98083b26077bf70c60aa957b4795dbf831bcc4c78b3cb44efe214f0cf8e3c140729c829b5f24e7466a24615ab8dbcce0ac6ebee3229531091514'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
            'f4f04d4bf98104bf22861f1e0f7434a3c2aedf6a67ce0fe39ed7b4186f162a03979ae6659c40d6e6816c735801c0691e5362375250a58c742ca089d35513297d'
            '906d13faf041cfb0e27923edcea134d33836f798ba3ee5f815cb3da8e219f5a10f25e05255552366a30e267bb14c6d1fdc02ed678ce3a6fcaaf7a63cd3057f3b'
            'c3b541c7ac95c94f682577cacedc06e79427003a870cde844056a7662087873b59dc06933552bb867b16fc0387f8a061672df780454769f26aa3e53b13a94edf')

prepare() {
  cd "xorg-server-${pkgver}"

  # FS#73075 - merged in trunk
  patch -Np1 -i ../0001-xf86-logind-Fix-compilation-error-when-built-without.patch
  patch -Np1 -i ../0002-xf86-logind-fix-missing-call-to-vtenter-if-the-platf.patch

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
    # use copy so a new file is created and fakeroot can track properties such as setuid
    cp -av "${src}" "${dir}/"
    rm -rf "${src}"
  done
}
package_xorg-server-bug865() {
  pkgdesc="Xorg X server with the patch for freedesktop bug 865 (need to kick hotkeys on release, not press)"
  depends=(libepoxy libxfont2 pixman xorg-server-common libunwind
           dbus libgl xf86-input-libinput nettle
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xorg-server-${pkgver}"/COPYING
}

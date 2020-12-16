# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-git
pkgname=(
  'xorg-server-git'
  'xorg-server-xephyr-git'
  'xorg-server-xvfb-git'
  'xorg-server-xnest-git'
  'xorg-server-common-git'
  'xorg-server-devel-git')
_pkgbase='xserver'
pkgver=1.20.0.r800.ge4a9f0bb4
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://gitlab.freedesktop.org/xorg/xserver.git"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'wayland-protocols' 'egl-wayland' 'meson' 'git')
_srcurl="git+https://gitlab.freedesktop.org/xorg/xserver.git"
source=($_srcurl
        xvfb-run
        xvfb-run.1)
sha256sums=('SKIP'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776')

pkgver() {
  cd "${_pkgbase}"
  # cutting off 'xorg.server.' prefix that presents in the git tag
  git describe --long --tags| sed 's/^xorg.server.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgbase}"
  cd ..
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  export CFLAGS="$CFLAGS -fplt -fno-lto"
  export CXXFLAGS="$CXXFLAGS -fplt -fno-lto"
  export LDFLAGS="$LDFLAGS,-fno-lto"

  arch-meson ${_pkgbase} build \
    $mesonFlags \
    -D os_vendor="Arch Linux" \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D xwayland=false \
    -D xwayland_eglstream=false \
    -D glamor=true \
    -D udev=true \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D b_lto=false \
    -D b_lundef=false

  # Print config
  meson configure build
}

build() {
  msg2 "Please confirm"
  for VAR in VIDEODRV XINPUT EXTENSION; do
    echo "X-ABI-${VAR}_VERSION=$(grep -Po "${VAR}_V.*\(\K[^)]*" xserver/hw/xfree86/common/xf86Module.h |& sed 's/, /./')"
  done

  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  
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

package_xorg-server-common-git() {
  _pkgname='xorg-server-common'
  provides=('xorg-server-common')
  conflicts=('xorg-server-common')
  pkgdesc="Xorg server common files (git version)"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "${_pkgbase}"/xkb/README.compiled
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-git() {
  _pkgname='xorg-server'
  pkgdesc="Xorg X server (git version)"
  depends=(libepoxy libxfont2 pixman xorg-server-common-git libunwind
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('xorg-server' 'X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server')
  conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server.install

  _install fakeinstall/usr/bin/{Xorg,cvt,gtf}
  ln -s /usr/bin/Xorg "${pkgdir}/usr/bin/X"
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-quirks.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,cvt,gtf}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,modesetting,inputtestdrv}.4
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-xephyr-git() {
  _pkgname='xorg-server-xephyr'
  provides=('xorg-server-xephyr')
  conflicts=('xorg-server-xephyr')
  pkgdesc="A nested X server that runs as an X application (git version)"
  depends=(libxfont2 libgl libepoxy libunwind systemd-libs libxv pixman xorg-server-common-git
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
           nettle libtirpc)

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-xvfb-git() {
  _pkgname='org-server-xvfb'
  provides=('xorg-server-xvfb')
  conflicts=('xorg-server-xvfb')
  pkgdesc="Virtual framebuffer X server (git version)"
  depends=(libxfont2 libunwind pixman xorg-server-common-git xorg-xauth libgl nettle)

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-xnest-git() {
  _pkgname='xorg-server-xnest'
  provides=('xorg-server-xnest')
  conflicts=('xorg-server-xnest')
  pkgdesc="A nested X server that runs as an X application (git version)"
  depends=(libxfont2 libxext pixman xorg-server-common-git nettle libtirpc)

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-devel-git() {
  _pkgname='xorg-server-devel'
  provides=('xorg-server-devel')
  conflicts=('xorg-server-devel')
  pkgdesc="Development files for the X.Org X server (git version)"
  depends=('xorgproto' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir
}

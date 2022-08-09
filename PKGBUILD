# Mantainer: pac85 <antomani103@gmail.com>
# Contributor: JustKidding <jk@vin.ovh>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/xorg-server by

pkgbase=xorg-server-multimonitor-vrr-git
pkgname=(
  'xorg-server-multimonitor-vrr-git'
  'xorg-server-multimonitor-vrr-common-git'
  'xorg-server-multimonitor-vrr-devel-git'
  'xorg-server-multimonitor-vrr-xephyr-git'
  'xorg-server-multimonitor-vrr-xnest-git'
  'xorg-server-multimonitor-vrr-xvfb-git'
)
_pkgbase='xserver'
pkgver=xorgvrrfix
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
options=('debug')
makedepends=('xorgproto-git' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson' 'git')
_srcurl=xserver::git+https://gitlab.com/pac85/xorg-server.git#branch=cleaned
source=($_srcurl
        xvfb-run # with updates from FC master
        xvfb-run.1
)
sha512sums=('SKIP'
            '87c79b4a928e74463f96f58d277558783eac9b8ea6ba00d6bbbb67ad84c4d65b3792d960ea2a70089ae18162e82ae572a49ad36df169c974cc99dbaa51f63eb2'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22')

pkgver() {
  printf "xorgvrrfix"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  arch-meson "${_pkgbase}" build \
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
    -D xkb_output_dir=/var/lib/xkb \
    -D libunwind=true

  # Print config
  meson configure build
  ninja -C build

  # fake installation to be seperated into packages
  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
}

check() {
  meson test -C build
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

package_xorg-server-multimonitor-vrr-common-git() {
  pkgdesc="Xorg server common files (git version)"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  provides=('xorg-server-common')
  conflicts=('xorg-server-common')

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "${_pkgbase}"/xkb/README.compiled
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-multimonitor-vrr-git() {
  pkgdesc="Xorg X server (git version)"
  depends=(libepoxy libxfont2 pixman xorg-server-multimonitor-vrr-common-git libunwind
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence libxcvt) # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=25.3' 'X-ABI-XINPUT_VERSION=24.4' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' 'xorg-server')
  conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-git.install

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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-multimonitor-vrr-xephyr-git() {
  pkgdesc="A nested X server that runs as an X application (git version)"
  depends=(libxfont2 libgl libepoxy libunwind systemd-libs libxv pixman xorg-server-multimonitor-vrr-common-git
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
           nettle libtirpc)
  provides=('xorg-server-xephyr')
  conflicts=('xorg-server-xephyr')

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-multimonitor-vrr-xvfb-git() {
  pkgdesc="Virtual framebuffer X server (git version)"
  depends=(libxfont2 libunwind pixman xorg-server-multimonitor-vrr-common-git xorg-xauth
           libgl nettle libtirpc systemd-libs)
  provides=('xorg-server-xvfb')
  conflicts=('xorg-server-xvfb')

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-multimonitor-vrr-xnest-git() {
  pkgdesc="A nested X server that runs as an X application (git version)"
  depends=(libxfont2 libunwind libxext pixman xorg-server-multimonitor-vrr-common-git nettle libtirpc systemd-libs)
  provides=('xorg-server-xnest')
  conflicts=('xorg-server-xnest')

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING
}

package_xorg-server-multimonitor-vrr-devel-git() {
  pkgdesc="Development files for the X.Org X server (git version)"
  depends=('xorgproto-git' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  provides=('xorg-server-devel')
  conflicts=('xorg-server-devel')

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING

  # make sure there are no files left to install
  #find fakeinstall -depth -print0 | xargs -0 rmdir
}

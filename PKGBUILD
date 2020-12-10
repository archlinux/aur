# Maintainer    : Vincent Grande
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>

pkgname=(
	'xorg-server-rootless-nosystemd-minimal'
#	'xorg-server-xephyr-rootless-nosystemd-minimal'
#	'xorg-server-xvfb-rootless-nosystemd-minimal'
#	'xorg-server-xnest-rootless-nosystemd-minimal'
	'xorg-server-xwayland-rootless-nosystemd-minimal'
	'xorg-server-common-rootless-nosystemd-minimal'
	'xorg-server-devel-rootless-nosystemd-minimal')

pkgver=1.20.10
pkgrel=1
url="http://xorg.freedesktop.org"
source=("https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2")

makedepends=(
	'xorgproto'
	'pixman'
	'libx11'
	'mesa'
#	'mesa-libgl'
	'xtrans'
	'libxkbfile'
	'libxfont2'
	'libpciaccess'
	'libxv'
	'libxmu'
	'libxrender'
	'libxi'
	'libxaw'
	'libxtst'
	'libxres'
	'xorg-xkbcomp'
	'xorg-util-macros'
	'xorg-font-util'
	'libepoxy'
	'xcb-util'
	'xcb-util-image'
	'xcb-util-renderutil'
	'xcb-util-wm'
	'xcb-util-keysyms'
	'libxshmfence'
#	'libunwind'
#	'wayland-protocols'
#	'egl-wayland'
	'meson')

optdepends=('wayland-protocols: xwayland support'
	    'egl-wayland: xwayland support')

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
#  export CFLAGS=${CFLAGS/-fno-plt}
#  export CXXFLAGS=${CXXFLAGS/-fno-plt}
#  export LDFLAGS=${LDFLAGS/,-z,now}


  arch-meson xorg-server-$pkgver build \
    -D os_vendor="Arch Linux" \
    -D ipv6=false \
    -D xcsecurity=true \
    -D xorg=true \
    -D xwayland=true \
    -D xwayland_eglstream=true \
    -D udev=true \
    -D suid_wrapper=false \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D systemd_logind=false \
    -D b_lto=false \
    -D b_lundef=false \
    -D xinerama=true \
    -D screensaver=false \
    -D dmx=false \
    -D glamor=true \
    -D linux_apm=false \
    -D mitshm=true \
    -D vgahw=false \
    -D xdmcp=false \
    -D xephyr=false \
    -D xnest=false \
    -D xquartz=false \
    -D xv=true \
    -D xvmc=false \
    -D xvfb=false \
    -D xwin=false \
    -D xres=false \
    -D xdm-auth-1=false \
    -D secure-rpc=false \
    -D dtrace=false \
    -D listen_tcp=false \
    -D dpms=false \
    -D xf86bigfont=false \
    -D xselinux=false \
    -D dga=false \
    -D linux_acpi=false \
    -D agp=false \
    -D dri1=false \
    -D dri2=false \
    -D xpbproxy=false \
    -D errorlogs=false \
    -D stdsplit=false \
    -D b_pgo=off \
    -D optimization=3 \
    -D libunwind=false \
    -D debug=false
    -D libunwind=false \
    -D debug=false
     
# xinerama needed with nvidia blob/amdgpu/mesa
# mitshm needed with nvidia blob/amdgpu/mesa
# xv needed with nvidia blob/amdgpu/mesa
# glamor needed for xwayland support
# b_lto needs to be set to false or build fails
# b_pgo needs to be set to off or build fails

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

package_xorg-server-common-rootless-nosystemd-minimal() {
  pkgdesc="Xorg server common files"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  conflicts=('xorg-server-common')
  provides=('xorg-server-common')
 
  
  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

#  install -m644 -Dt "${pkgdir}/var/lib/xkb/" xserver/xkb/README.compiled
  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
}

package_xorg-server-rootless-nosystemd-minimal() {
  pkgdesc="Xorg X server"
  depends=(libepoxy libxfont2 pixman xorg-server-common-rootless-nosystemd-minimal 
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949
  optdepends=('libunwind: unwind backtrace support')

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' 'xorg-server')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-rootless-nosystemd-minimal.install

  
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
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
}

#package_xorg-server-xephyr-rootless-nosystemd-minimal() {
#  pkgdesc="A nested X server that runs as an X application"
#  depends=(libxfont2 libgl libepoxy libxv pixman xorg-server-common-rootless-nosystemd-minimal
#           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
#           nettle libtirpc)
#  optdepends=('libunwind: unwind backtrace support')
#  conflicts=('xorg-server-xephyr')
#  provides=('xorg-server-xephyr')
  
#  _install fakeinstall/usr/bin/Xephyr
#  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
#}

#package_xorg-server-xvfb-rootless-nosystemd-minimal() {
#  pkgdesc="Virtual framebuffer X server"
#  depends=(libxfont2 pixman xorg-server-common-rootless-nosystemd-minimal xorg-xauth libgl nettle libtirpc)
#  optdepends=('libunwind: unwind backtrace support')
#  conflicts=('xorg-server-xvfb')
#  provides=('xorg-server-xvfb')
  
#  _install fakeinstall/usr/bin/Xvfb
#  _install fakeinstall/usr/share/man/man1/Xvfb.1

#  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
#  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
#}

#package_xorg-server-xnest-rootless-nosystemd-minimal() {
#  pkgdesc="A nested X server that runs as an X application"
#  depends=(libxfont2 libxext pixman xorg-server-common-rootless-nosystemd-minimal nettle libtirpc)
#  conflicts=('xorg-server-xnest')
#  provides=('xorg-server-xnest')
  
#  _install fakeinstall/usr/bin/Xnest
#  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
#}

package_xorg-server-xwayland-rootless-nosystemd-minimal() {
  pkgdesc="run X clients under wayland"
  depends=(libxfont2 libepoxy libgl pixman xorg-server-common-rootless-nosystemd-minimal
           nettle libtirpc)
  optdepends=('libunwind: unwind backtrace support')
  conflicts=('xorg-server-xwayland')
  provides=('xorg-server-xwayland')
  
  _install fakeinstall/usr/bin/Xwayland

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
}

package_xorg-server-devel-rootless-nosystemd-minimal() {
  pkgdesc="Development files for the X.Org X server"
  depends=('xorgproto' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  conflicts=('xorg-server-devel')
  provides=('xorg-server-devel')
  
  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING

  # make sure there are no files left to install
#  find fakeinstall -depth -print0 | xargs -0 rmdir
}

arch=('x86_64')

groups=('xorg')

license=('custom')

sha512sums=('SKIP')

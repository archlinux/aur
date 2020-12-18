# Maintainer    : Vincent Grande
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>

pkgname=(
	'xorg-server-rootless-nosystemd-minimal-git'
#	'xorg-server-xephyr-rootless-nosystemd-minimal-git'
#	'xorg-server-xvfb-rootless-nosystemd-minimal-git'
#	'xorg-server-xnest-rootless-nosystemd-minimal-git'
	'xorg-server-xwayland-rootless-nosystemd-minimal-git'
	'xorg-server-common-rootless-nosystemd-minimal-git'
	'xorg-server-devel-rootless-nosystemd-minimal-git')

pkgver=1.20.999
pkgrel=1
url="http://xorg.freedesktop.org"
source=("git+https://gitlab.freedesktop.org/xorg/xserver.git")

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
#	'libxres'
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

pkgver() {
  cd xserver
  # cutting off 'xorg.server.' prefix that presents in the git tag
  git describe --long --tags| sed 's/^xorg.server.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
#  export CFLAGS=${CFLAGS/-fno-plt}
#  export CXXFLAGS=${CXXFLAGS/-fno-plt}
#  export LDFLAGS=${LDFLAGS/,-z,now}


  arch-meson xserver build \
    -D os_vendor="Arch Linux" \
    -D ipv6=false \
    -D xcsecurity=true \
    -D xorg=true \
    -D xwayland=true \
    -D xwayland_eglstream=false \
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
    -D libunwind=false \
    -D debug=false
     
# xinerama required for nvidia blob/amdgpu/mesa
# mitshm required for nvidia blob/amdgpu/mesa
# xv required for nvidia blob/amdgpu/mesa
# glamor required for xwayland support
# b_lto set to false or build fails
# b_pgo set to off or build fails
# dpms and dri1 set to true or xf86-video-amdgpu build fails

  # Print config
  meson configure build
  ninja $NINJAFLAGS -C build
 
  # fake installation to be seperated into packages
  DESTDIR="${srcdir}/fakeinstall" ninja $NINJAFLAGS -C build install
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

package_xorg-server-common-rootless-nosystemd-minimal-git() {
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

package_xorg-server-rootless-nosystemd-minimal-git() {
  pkgdesc="Xorg X server"
  depends=(libepoxy libxfont2 pixman xorg-server-common-rootless-nosystemd-minimal-git 
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949
  optdepends=('libunwind: unwind backtrace support')

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' 'xorg-server')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-rootless-nosystemd-minimal-git.install

  
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

#package_xorg-server-xephyr-rootless-nosystemd-minimal-git() {
#  pkgdesc="A nested X server that runs as an X application"
#  depends=(libxfont2 libgl libepoxy libxv pixman xorg-server-common-rootless-nosystemd-minimal-git
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

#package_xorg-server-xvfb-rootless-nosystemd-minimal-git() {
#  pkgdesc="Virtual framebuffer X server"
#  depends=(libxfont2 pixman xorg-server-common-rootless-nosystemd-minimal-git xorg-xauth libgl nettle libtirpc)
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

#package_xorg-server-xnest-rootless-nosystemd-minimal-git() {
#  pkgdesc="A nested X server that runs as an X application"
#  depends=(libxfont2 libxext pixman xorg-server-common-rootless-nosystemd-minimal-git nettle libtirpc)
#  conflicts=('xorg-server-xnest')
#  provides=('xorg-server-xnest')
  
#  _install fakeinstall/usr/bin/Xnest
#  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
#}

package_xorg-server-xwayland-rootless-nosystemd-minimal-git() {
  pkgdesc="run X clients under wayland"
  depends=(libxfont2 libepoxy pixman xorg-server-common
           nettle)
  optdepends=('libunwind: unwind backtrace support')
  conflicts=('xorg-server-xwayland' 'xorg-xwayland')
  provides=('xorg-server-xwayland' 'xorg-xwayland')
  
  _install fakeinstall/usr/bin/Xwayland

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING
}

package_xorg-server-devel-rootless-nosystemd-minimal-git() {
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

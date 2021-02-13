# Maintainer    : Vincent Grande
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>

pkgname=(
	'xorg-xwayland-rootless-nosystemd-minimal-git'
	'xorg-xwayland-common-rootless-nosystemd-minimal-git'
	'xorg-xwayland-devel-rootless-nosystemd-minimal-git')

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
    -D xcsecurity=false \
    -D xorg=false \
    -D xwayland=true \
    -D xwayland_eglstream=false \
    -D udev=true \
    -D suid_wrapper=false \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D systemd_logind=false \
    -D b_lto=true \
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
    -D hal=false \
    -D xf86-input-inputtest=false \
    -D xace=false \
    -D debug=false \
    -D input_thread=true \
    -D int10=false \
    -D sparkle=false \
    -D composite=false \
    -D record=false \
    -D dri=false \
    -D dri3=true \
    -D present=false \
    -D xf86vidmode=false \
    -D dbe=false \
    -D xfree86-utils=false \
    -D windowsdri=false \
    -D kdrive=false \
    -D systemd-daemon=false \
    -D libdrm=false \
    -D clientids=false \
    -D pciaccess=false \
    -D xshmfence=false

# dri3 required for xwayland support
# glamor required for xwayland support
# dga required for xorg nvidia blob/amdgpu/mesa ### NOT REQUIRED FOR XWAYLAND
# pciaccess required or build fails with xorg enabled ### NOT REQUIRED FOR XWAYLAND
# agp required or build fails with xorg enabled ### NOT REQUIRED FOR XWAYLAND
# libdrm required or build fails with xorg enabled ### NOT REQUIRED FOR XWAYLAND
# xinerama required for nvidia blob/amdgpu/mesa
# mitshm required for nvidia blob/amdgpu/mesa
# xv required for nvidia blob/amdgpu/mesa
# composite required for nvidia blob/amdgpu/mesa
# b_pgo set to off or build fails
# dpms and dri1 set to true or xf86-video-amdgpu build fails

### enable-unit-tests + xorg flags break compile if -flto / b_lto is enable

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

package_xorg-xwayland-common-rootless-nosystemd-minimal-git() {
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

package_xorg-xwayland-rootless-nosystemd-minimal-git() {
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

package_xorg-xwayland-devel-rootless-nosystemd-minimal-git() {
  pkgdesc="Development files for the X.Org X server"
  depends=('xorgproto' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  conflicts=('xorg-server-devel')
  provides=('xorg-server-devel')
  
  _install fakeinstall/usr/include/xorg/*
#  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
#  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
#  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xorg-server/COPYING

  # make sure there are no files left to install
#  find fakeinstall -depth -print0 | xargs -0 rmdir
}

arch=('x86_64')

groups=('xorg')

license=('custom')

sha512sums=('SKIP')

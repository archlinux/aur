# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-bug865
pkgname=xorg-server-bug865
pkgver=1.20.0
pkgrel=2
arch=('x86_64')
license=('custom')
groups=('xorg')
url="http://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'wayland-protocols' 'meson') # 'git')
#_commit=d0d1a694f967af770fba0d36043fd5218ff20984 # branch 1.19

#source=("git+https://anongit.freedesktop.org/git/xorg/xserver.git#commit=$_commit"
source=(https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2{,.sig}
        xwayland-config.h.meson.in # missing from tarball
        xserver-autobind-hotplug.patch
        xvfb-run # with updates from FC master
        xvfb-run.1
        freedesktop-bug-865.patch)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
              '995ED5C8A6138EB0961F18474C09DD83CAAA50B2')
sha512sums=('1489e8511c9da682ef0460182dfeeddd241c72d4ef4d206d9706f1e39572c09953df851fab18cefb65a1ee4c6710c6ba13c63c9c9fc0bc1b5f12c50780412cde'
            'SKIP'
            '4ed2a66dd98697accef34f84d44490594bf071232fa74640d514a170f1fbe760b292a0b53fe47080b73acf6083cea57e35f11cfd42ba9dc211b8e8dcac343dfc'
            'd84f4d63a502b7af76ea49944d1b21e2030dfd250ac1e82878935cf631973310ac9ba1f0dfedf10980ec6c7431d61b7daa4b7bbaae9ee477b2c19812c1661a22'
            '55bbf520333f6e818b0125b37179a7039b69a0d3d2242b80a08da003d94cbf6c1fb912d880abcce318a85d7947e3eff8fbc4cdf57d7118572e8ebc56c4569af6'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
	    '81be7b0ecd9de850f0c740762d37c7489f12b34eb6adb19b3d3077f66d66e48e1206eff4bd29e50f5640509390a08fa138a4664b60d90878d4d17cb1f6919baf')    

#pkgver() {
#  cd xserver
#  git describe --tags | sed 's/^xorg-server-//;s/_/./g;s/-/+/g'
#}

prepare() {
  cp xwayland-config.h.meson.in xorg-server-${pkgver}/include/

  #cd xserver
  cd "xorg-server-${pkgver}"

  # patch from Fedora, not yet merged
  patch -Np1 -i ../xserver-autobind-hotplug.patch

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
    -D glamor=true \
    -D udev=true \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb
     
#     -D xwayland_eglstream=true \ # requires weston-eglstream from AUR

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
  provides=('X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' 'xorg-server=1.20')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server.install

  
  _install fakeinstall/usr/bin/{Xorg,cvt,gtf}
  ln -s /usr/bin/Xorg "${pkgdir}/usr/bin/X"
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-quirks.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,cvt,gtf}.1.gz
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,modesetting}.4.gz
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5.gz

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xorg-server-${pkgver}"/COPYING
}

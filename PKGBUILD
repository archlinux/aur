# Maintainer: dec05eba <dec05eba@protonmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-phoenix
pkgname=('xorg-server-phoenix' 'xorg-server-xephyr-phoenix' 'xorg-server-xvfb-phoenix' 'xorg-server-xnest-phoenix'
         'xorg-server-common-phoenix' 'xorg-server-devel-phoenix' 'xorg-server-src-phoenix')
pkgver=26.1.99.1
pkgrel=5
_commit=662cf9d6dffa469b014ae1a6ef391d3b9db1e443
_srcname=xserver-${_commit}
_upstreamname=xorg-server
arch=('x86_64')
license=('LicenseRef-Adobe-Display-PostScript'
         'BSD-3-Clause' 
         'LicenseRef-DEC-3-Clause' 
         'HPND'
         'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
         'HPND-sell-variant' 
         'ICU'
         'ISC'
         'MIT'
         'MIT-open-group'
         'NTP'
         'SGI-B-2.0'
         'SMLNJ'
         'X11'
         'X11-distribute-modifications-variant'
)
groups=('xorg')
url="https://github.com/dec05eba/xserver"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'meson' 'git')
source=(${_upstreamname}-${_commit}.tar.gz::https://github.com/dec05eba/xserver/archive/${_commit}.tar.gz
        xvfb-run # with updates from FC master
        xvfb-run.1
        0001-Revert_damage_Unlink_a_damage_from_the_list_it_was_actually.patch
)
sha512sums=('be414dac9d96c6a8b51cd920d850897d0d5adebc7c548236a5fc2435dc9b1cc4f62b82b4b5b3086ad75df1c9dfc0530c01193c387440768013256e082b25248d'
            '672375cb5028ba9cda286e317d17bd8c9a9039483e7f79c21f223fd08ba07655729e9f59a082f4b8f5d8de45a77a9e9affce1002fb8c6657e26ef1a490654e49'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
            '5b749d10a968ba37b6ff59a459e80e6799e750d00f4b043b93033f9deb152cbb3fbb49cab7b2be2bc650ecf7fad5b4f0bbdaa80f40da017f074ee436d59ae4c3')

prepare() {
  cd ${_srcname}
  # fix ABI breakage
  patch -Np1 -i ../0001-Revert_damage_Unlink_a_damage_from_the_list_it_was_actually.patch
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  # save tree for source package after prepare() may have applied patches
  tar czf ${_upstreamname}-${pkgver}.tar.gz \
    --exclude='.git*' \
    --exclude=.appveyor.yml \
    --exclude=.travis.yml \
    --transform="s|^${_srcname}|${_upstreamname}|" \
    ${_srcname}

  arch-meson ${_srcname} build \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D xwayland=false \
    -D docs=false \
    -D devel-docs=false \
    -D glamor=true \
    -D udev=true \
    -D dtrace=false \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D linux_acpi=false \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D libunwind=true

  # Print config
  meson configure build --no-pager
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

package_xorg-server-common-phoenix() {
  pkgdesc="Xorg server common files"
  provides=("xorg-server-common=${pkgver}")
  conflicts=('xorg-server-common')
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "${_srcname}"/xkb/README.compiled
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}"/COPYING
}

package_xorg-server-phoenix() {
  pkgdesc="A fork of the Xorg server with HDR and proper multimonitor support"
  depends=(libepoxy libxfont2 pixman xorg-server-common libunwind
           dbus libgl xf86-input-libinput-phoenix nettle
           libxdmcp sh glibc libxau systemd-libs libtirpc
           libpciaccess libdrm libxshmfence libxcvt) # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=("xorg-server=${pkgver}" 'X-ABI-VIDEODRV_VERSION=28.0' 'X-ABI-XINPUT_VERSION=26.0' 'X-ABI-EXTENSION_VERSION=11.0' 'x-server')
  conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
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
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}"/COPYING
}

package_xorg-server-xephyr-phoenix() {
  pkgdesc="A nested X server that runs as an X application"
  provides=("xorg-server-xephyr=${pkgver}")
  conflicts=('xorg-server-xephyr')
  depends=(libxfont2 libgl libepoxy libunwind systemd-libs pixman xorg-server-common
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
           nettle libtirpc
           xcb-util libxdmcp libx11 libxau libxshmfence glibc)

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}"/COPYING
}

package_xorg-server-xvfb-phoenix() {
  pkgdesc="Virtual framebuffer X server"
  provides=("xorg-server-xvfb=${pkgver}")
  conflicts=('xorg-server-xvfb')
  # xvfb-run is GPLv2, rest is MIT
  license=('MIT' 'GPL-2.0-only')
  depends=(libxfont2 libunwind pixman xorg-server-common xorg-xauth 
           libgl nettle libtirpc systemd-libs
           libxdmcp sh glibc libxau)

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}"/COPYING
}

package_xorg-server-xnest-phoenix() {
  pkgdesc="A nested X server that runs as an X application"
  provides=("xorg-server-xnest=${pkgver}")
  conflicts=('xorg-server-xnest')
  depends=(libxfont2 libunwind libxext pixman xorg-server-common nettle
           libtirpc systemd-libs
           libxdmcp glibc libx11 libxau)

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}"/COPYING
}

package_xorg-server-devel-phoenix() {
  pkgdesc="Development files for the X.Org X server"
  provides=("xorg-server-devel=${pkgver}")
  conflicts=('xorg-server-devel')
  depends=('xorgproto' 'mesa' 'libpciaccess' 'pixman'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/xorg-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcname}"/COPYING

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir
}

package_xorg-server-src-phoenix() {
  pkgdesc="Source files of the X.Org X server"
  provides=("xorg-server-src=${pkgver}")
  conflicts=('xorg-server-src')

  install -d "${pkgdir}"/usr/src/
  cd "${pkgdir}"/usr/src/
  tar xvf "${srcdir}/${_upstreamname}-${pkgver}.tar.gz"
  chown root:root --recursive ${_upstreamname}
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_upstreamname}"/COPYING
}

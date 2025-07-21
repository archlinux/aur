# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="xlibre-server"
_pkgname=("${_pkgbase}"{,-bootstrap,-common,-devel,-xephyr,-xnest,-xvfb})
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgname[@]/%/-git}")
pkgver=25.0.0.5.r70.85a66a723
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://github.com/x11libre/xserver"
license=('LicenseRef-Adobe-Display-PostScript' 'BSD-3-Clause' 'LicenseRef-DEC-3-Clause' 
         'HPND' 'LicenseRef-HPND-sell-MIT-disclaimer-xserver' 'HPND-sell-variant' 
         'ICU' 'ISC' 'MIT' 'MIT-open-group' 'NTP' 'SGI-B-2.0' 'SMLNJ' 'X11'
         'X11-distribute-modifications-variant')
makedepends=('git' 'libepoxy' 'libpciaccess' 'libunwind' 'libx11' 'libxaw'
             'libxcvt' 'libxfont2' 'libxi' 'libxkbfile' 'libxmu' 'libxrender'
             'libxres' 'libxshmfence>=1.1' 'libxtst' 'libxv' 'mesa'
             'mesa-libgl' 'meson>=0.58' 'pixman>=0.27.2' 'systemd>=209'
             'xcb-util' 'xcb-util-image' 'xcb-util-keysyms'
             'xcb-util-renderutil' 'xcb-util-wm' 'xorg-font-util'
             'xorg-util-macros' 'xorg-xkbcomp' 'xorgproto>=7.0.31'
             'xtrans>=1.3.5')
groups=('xlibre-git')
options=('!emptydirs')
_pkgsrc="${_pkgbase}"
source=("${_pkgsrc}::git+${url}.git"
        "xvfb-run"{,.1}) # with updates from FC master
b2sums=('SKIP'
        '58c48ed893be841d14d3a09c9e1092a6da7bcb7fb773e1bf634c50a12e51ea3ad4aeba3843164a2834ee9f8ea95a7bca8b3ce8196a5328ce782724c082cb416f'
        '0e3738e099ee2b958df3e5a5adbdfcbd1150ad64645fdae70d74b50123c3f3d43f9f95f5e4bac82bf5c72b3deb978655b8c3177d37de0bd0a2a6e0e343863511')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local tag ver rev hash
  tag="$(git tag -l "xlibre-xserver-*" --sort=-v:refname | head -n1)"
  ver="${tag#xlibre-xserver-}"
  rev="$(git rev-list --count "$tag"..HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.%s" "$ver" "$rev" "$hash"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS="${CFLAGS/-fno-plt}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS="${LDFLAGS/-Wl,-z,now}"
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    -D ipv6=true
    -D xvfb=true
    -D xnest=true
    -D xcsecurity=true
    -D xorg=true
    -D xephyr=true
    -D glamor=true
    -D udev=true
    -D dtrace=false
    -D systemd_logind=true
    -D suid_wrapper=true
    -D xkb_dir='/usr/share/X11/xkb'
    -D xkb_output_dir='/var/lib/xkb'
    -D libunwind=true
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

package_xlibre-server-git() {
  pkgdesc="XLibre X server"
  depends=('dbus' 'glibc' 'libdrm' 'libepoxy' 'libgl' 'libpciaccess' 'libtirpc'
           'libunwind' 'libxau' 'libxcvt' 'libxdmcp' 'libxfont2'
           'libxshmfence>=1.1' 'nettle' 'pixman>=0.27.2' 'sh'
           'systemd-libs>=209' 'xlibre-input-libinput'
           "${_pkgbase}-common-git=${pkgver}-${pkgrel}") # FS#52949
  # see xlibre-server*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xlibre-server-devel pkg
  provides=("${_pkgbase}=${pkgver%%.r*}" 'X-ABI-VIDEODRV_VERSION=28.0' 'X-ABI-XINPUT_VERSION=26.0' 'X-ABI-EXTENSION_VERSION=11.0' 'x-server') # {xlibre,xorg}"-server=${pkgver%%.r*}"
  conflicts=({xlibre,xorg}'-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  replaces=("${_pkgbase}-bootstrap-git") # 'glamor-egl' 'xf86-video-modesetting'
  options=('emptydirs')
  install="${_pkgbase}.install"

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}"
  install -vdm755 "etc/X11/xorg.conf.d"

  cd "usr"
  # devel
  rm -rf "include" "lib/pkgconfig" "share/aclocal"
  # common
  rm -f "lib/xorg/protocol.txt" "share/man/man1/Xserver.1"
  # xephyr, xnest, xvfb
  find . -type f,l \( -name '*Xephyr*' -o -name '*Xnest*' -o -name '*Xvfb*' \) -delete
}

package_xlibre-server-bootstrap-git() {
  pkgdesc="XLibre X server (bootstrap)"
  depends=('dbus' 'glibc' 'libdrm' 'libepoxy' 'libgl' 'libpciaccess' 'libtirpc'
           'libunwind' 'libxau' 'libxcvt' 'libxdmcp' 'libxfont2'
           'libxshmfence>=1.1' 'nettle' 'pixman>=0.27.2' 'sh'
           'systemd-libs>=209'
           "${_pkgbase}-common-git=${pkgver}-${pkgrel}") # FS#52949
  # see xlibre-server*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xlibre-server-devel pkg
  provides=("${_pkgbase}"{,-bootstrap}"=${pkgver%%.r*}" 'x-server' # {xlibre,xorg}"-server=${pkgver%%.r*}" "xlibre-server-bootstrap=${pkgver%%.r*}"
            'X-ABI-VIDEODRV_VERSION=28.0' 'X-ABI-XINPUT_VERSION=26.0' 'X-ABI-EXTENSION_VERSION=11.0')
  conflicts=({xlibre,xorg}'-server' 'xlibre-server-bootstrap' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  # replaces=('glamor-egl' 'xf86-video-modesetting')
  options=('emptydirs')
  install="${_pkgbase}.install"

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}"
  install -vdm755 "etc/X11/xorg.conf.d"

  cd "usr"
  # devel
  rm -rf "include" "lib/pkgconfig" "share/aclocal"
  # common
  rm -f "lib/xorg/protocol.txt" "share/man/man1/Xserver.1"
  # xephyr, xnest, xvfb
  find . -type f,l \( -name '*Xephyr*' -o -name '*Xnest*' -o -name '*Xvfb*' \) -delete
}

package_xlibre-server-common-git() {
  pkgdesc="XLibre server common files"
  arch=('any')
  depends=('xkeyboard-config' 'xorg-setxkbmap' 'xorg-xkbcomp')
  provides=("${_pkgbase}-common=${pkgver%%.r*}") # {xlibre,xorg}"-server-common=${pkgver%%.r*}"
  conflicts=({xlibre,xorg}'-server-common')

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  find "${pkgdir}" -type f,l ! \( -name 'protocol.txt' -o -name 'Xserver.1' \) -delete

  cd "${_pkgsrc}"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
  install -vDm644 "xkb/README.compiled" "${pkgdir}/var/lib/xkb/README.compiled"
}

package_xlibre-server-devel-git() {
  pkgdesc="Development files for the XLibre X server"
  arch=('any')
  depends=('libpciaccess' 'mesa' 'pixman>=0.27.2' 'xorgproto>=7.0.31'
           'xorg-util-macros') # not technically required but almost every Xorg pkg needs it to build
  provides=("${_pkgbase}-devel=${pkgver%%.r*}") # {xlibre,xorg}"-server-devel=${pkgver%%.r*}"
  conflicts=({xlibre,xorg}'-server-devel')

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  find "${pkgdir}" -type f,l ! \( -name '*.h' -o -name '*.pc' -o -name '*.m4' \) -delete
}

package_xlibre-server-xephyr-git() {
  pkgdesc="A nested XLibre server that runs as an X application"
  depends=('glibc' 'libepoxy' 'libgl' 'libtirpc' 'libunwind' 'libx11' 'libxau'
           'libxdmcp' 'libxfont2' 'libxshmfence' 'nettle' 'pixman>=0.27.2'
           'systemd-libs>=209' 'xcb-util' 'xcb-util-image' 'xcb-util-keysyms'
           'xcb-util-renderutil' 'xcb-util-wm'
           "xlibre-server-common-git=${pkgver}-${pkgrel}")
  provides=("${_pkgbase}-xephyr=${pkgver%%.r*}") # {xlibre,xorg}"-server-xephyr=${pkgver%%.r*}"
  conflicts=({xlibre,xorg}'-server-xephyr')

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  find "${pkgdir}" -type f,l ! -name '*Xephyr*' -delete
}

package_xlibre-server-xnest-git() {
  pkgdesc="A nested XLibre server that runs as an X application"
  depends=('glibc' 'libtirpc' 'libunwind' 'libx11' 'libxau' 'libxdmcp'
           'libxext' 'libxfont2' 'nettle' 'pixman>=0.27.2'
           'systemd-libs>=209' "xlibre-server-common-git=${pkgver}-${pkgrel}")
  provides=("${_pkgbase}-xnest=${pkgver%%.r*}") # {xlibre,xorg}"-server-xnest=${pkgver%%.r*}"
  conflicts=({xlibre,xorg}'-server-xnest')

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  find "${pkgdir}" -type f,l ! -name '*Xnest*' -delete
}

package_xlibre-server-xvfb-git() {
  pkgdesc="Virtual framebuffer XLibre server"
  license=('MIT' 'GPL-2.0-only')
  depends=('glibc' 'libgl' 'libtirpc' 'libunwind' 'libxau' 'libxdmcp'
           'libxfont2' 'nettle' 'pixman' 'sh' 'systemd-libs>=209'
           "xlibre-server-common-git=${pkgver}-${pkgrel}" 'xorg-xauth')
  provides=("${_pkgbase}-xvfb=${pkgver%%.r*}") # {xlibre,xorg}"-server-xvfb=${pkgver%%.r*}"
  conflicts=({xlibre,xorg}'-server-xvfb')

  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  find "${pkgdir}" -type f,l ! -name '*Xvfb*' -delete

  install -vDm755 "xvfb-run"   "${pkgdir}/usr/bin/xvfb-run"
  install -vDm644 "xvfb-run.1" "${pkgdir}/usr/share/man/man1/xvfb-run.1" # outda
}

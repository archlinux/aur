# Maintainer: Ingo Bürk <admin at airblader dot de>

pkgname=i3-gaps-fullscreen-next-git
pkgver=4.16.1.r178.g31c0f1b8
pkgrel=1
pkgdesc='A fork of a fork of i3wm tiling window manager, with multi-monitor fullscreen workaround for VMWare, mpv, etc.'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/i3/tree/gaps-next'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git' 'i3-git' 'i3-gaps-git' 'i3-gaps' 'i3-gaps-next-git')
groups=('i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11')
makedepends=('git' 'asciidoc' 'docbook-xsl' 'xmlto' 'perl' 'pkgconfig')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
options=('docs' '!strip')
source=('git://github.com/Airblader/i3#branch=gaps-next')
sha1sums=('SKIP')

_gitname='i3'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"
  patch -p1 << EOF
diff --git a/include/atoms_NET_SUPPORTED.xmacro b/include/atoms_NET_SUPPORTED.xmacro
index a81948a9..096c6229 100644
--- a/include/atoms_NET_SUPPORTED.xmacro
+++ b/include/atoms_NET_SUPPORTED.xmacro
@@ -23,6 +23,7 @@ xmacro(_NET_WM_WINDOW_TYPE_DROPDOWN_MENU)
 xmacro(_NET_WM_WINDOW_TYPE_TOOLTIP)
 xmacro(_NET_WM_WINDOW_TYPE_NOTIFICATION)
+xmacro(_NET_WM_FULLSCREEN_MONITORS)
 xmacro(_NET_WM_DESKTOP)
 xmacro(_NET_WM_STRUT_PARTIAL)
EOF
}

build() {
  cd "$_gitname"

  autoreconf --force --install

  rm -rf build/
  mkdir -p build && cd build/

  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-sanitizers

  # See https://lists.archlinux.org/pipermail/arch-dev-public/2013-April/024776.html
  make CPPFLAGS+="-U_FORTIFY_SOURCE"
}

package() {
  cd "$_gitname"
  cd build/

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:


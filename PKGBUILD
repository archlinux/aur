# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=xorg-xwayland-hidpi-xprop-git
pkgver=22.1.8.r260.gf490622fc
pkgrel=1
arch=('x86_64')
license=('custom')
url="https://xorg.freedesktop.org"
pkgdesc="run X clients under wayland, with !733 HiDPI patch"
depends=('nettle' 'libepoxy' 'systemd-libs' 'libxfont2' 
         'pixman' 'xorg-server-common' 'libxcvt')
makedepends=('meson' 'xorgproto-git' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util'
             'wayland' 'wayland-protocols'
             'libdrm' 'mesa-libgl'
             'systemd'
             'egl-wayland'
)
source=(git+https://gitlab.freedesktop.org/xorg/xserver.git
        0000_Multi_DPI_support_via_global_factor_rescaling.patch::https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/733.patch
        0001_Remove_scale_atom_access_control.patch
        0002_Add_unscaled_output_mode.patch)
sha512sums=('SKIP'
            'ab927b1e038346f967723a3d45a405a0a8339759e15901d0913a55d1348683831e0d058c76c6f7cb2e264a5cef781a507fb290d139ac0f2806a62bd20d84147d'
            'f16cb5455a1caf26c586cca2d1ec6f4708804721b7d6a8d8bd1e4a7b47b97e8b822d3455fce0da3c74bb14baf6a3980574d85019cf242d6a033a578587f74b14'
            '4c601d3ab5eb97d49a5bd400a6984b93b9f1f684078825a23aacbc857509cc8a11caf700bd4ba0f8320b84e9257a18db1f3d24f17907a4108d555aee02bcb71a')
provides=('xorg-server-xwayland' 'xorg-xwayland')
conflicts=('xorg-server-xwayland' 'xorg-xwayland')
replaces=('xorg-server-xwayland')
options=('debug' 'strip')

pkgver() {
  cd xserver
  local branch=origin/xwayland-22.1
  local head=$(git rev-parse --short HEAD)
  local tag=$(git describe --abbrev=0 "$branch")
  local revisions=$(git rev-list "${tag}..HEAD" --count)
  printf "%s.r%d.g%s" "$(echo "$tag" | sed 's/^xwayland.//')" "$revisions" "$head"
}

prepare() {
  cd xserver
  patch -Np1 -i "${srcdir}/0000_Multi_DPI_support_via_global_factor_rescaling.patch"
  patch -Np1 -i "${srcdir}/0001_Remove_scale_atom_access_control.patch"
  patch -Np1 -i "${srcdir}/0002_Add_unscaled_output_mode.patch"
}

build() {
  arch-meson xserver build \
    -D ipv6=true \
    -D xvfb=false \
    -D xdmcp=false \
    -D xcsecurity=true \
    -D dri3=true \
    -D xwayland_eglstream=true \
    -D glamor=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb

  # Print config
  meson configure build
  ninja -C build
}

package() {
  # bin + manpage + .pc file
  install -m755 -Dt "${pkgdir}"/usr/bin build/hw/xwayland/Xwayland
  install -m644 -Dt "${pkgdir}"/usr/share/man/man1 build/hw/xwayland/Xwayland.1
  install -m644 -Dt "${pkgdir}"/usr/lib/pkgconfig build/meson-private/xwayland.pc

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

# vim:set et sw=2 sts=2:

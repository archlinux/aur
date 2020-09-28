# Maintainer: Callum Parsey <neoninteger@protonmail.com>

pkgname=amethyst
pkgver=3.3
pkgrel=2
pkgdesc='A lightweight source code editor with tree-view navigation'
arch=('x86_64')
url='https://codeberg.org/neoninteger/amethyst'
license=('ISC' 'GPL3')
depends=('gtksourceview3')
optdepends=('xorg-server-xwayland: For running amethyst on Wayland desktops')
source=('amethyst-v3r3.tar.gz::https://codeberg.org/neoninteger/amethyst/archive/v3r3.tar.gz'
        'amethyst-release.patch'
        'amethyst-disable-theme.patch'
        'amethyst-xwayland.patch')
sha256sums=('74a2fc4f3f5419e9aa064a7b29fb4f1f417c975ffaa4a1a590522eddab6aeca9'
            '4c9fd1819f244317d8455dcb16cfa0047ed4815ea6ae6c441ff3b2a9f7a9c3ca'
            'f4e5bddd24392ba6920c90aa56a023d1582bb8b91e3759119c3010dcfec5e55f'
            '2b4b83cc91120646f895d9d66393f5b7a51200c0fc0c360bc083e8d5e71301a6')
backup=('usr/share/amethyst/mimetypes.bml'
        'usr/share/amethyst/settings.bml')
install='amethyst.install'

prepare() {
  # amethyst builds, by default, in the "stable" configuration. This simple
  # patch changes this configuration to "release." This changes which compiler
  # optimisation features are enabled. In addition, amethyst expects its
  # configuration files (mimetypes.bml and settings.bml) to be within the
  # user's configuration directory (~/.config/amethyst). Because amethyst
  # cannot generate these files, and because packages cannot reliably change
  # the user's home directory, the prefix for the configuration files is
  # changed to /usr/share/amethyst. I also added the "relro" linker flag, as
  # per namcap's recommendation.
  patch -Np0 -d "${srcdir}" -i amethyst-release.patch

  # amethyst uses the hiro UI abstraction library also used in higan, bsnes
  # etc. hiro supports GTK+3, but with a significant problem - many (not all,
  # but some) of the theme colours specified in settings.bml are overridden by
  # any CSS theme you have installed on your system (Adwaita, Breeze, etc.).
  # All of the APIs that hiro uses to perform colour adjustment are from GTK+2,
  # and are now deprecated. The proper solution to this is to revamp hiro to
  # use CSS for colour theming rather than the outdated API. But this is
  # something that should be done in a fork of hiro so that the fix can be
  # pulled into higan and bsnes as well. So for now, I just comment out the
  # calls to hiro's setBackgroundColor() and setForegroundColor() functions,
  # so that all UI widgets just use the system CSS theme.
  patch -Np0 -d "${srcdir}" -i amethyst-disable-theme.patch

  # amethyst will refuse to draw anything on non-X11 windows. This
  # means that it cannot be run natively on Wayland desktops. This can be
  # woked around with XWayland, but the environment variable GDK_BACKEND=x11
  # needs to be set to force GTK+3 to use XWayland instead of creating a native
  # Wayland window. This patch changes the desktop entry to enforce this using
  # the env command.
  patch -Np0 -d "${srcdir}" -i amethyst-xwayland.patch

  # The original tarball release came with two empty directories (obj/ and
  # out/) which store the generated assets. These directories have to exist in
  # order for the build to actually succeed (you get weird dependency errors
  # otherwise). What I didn't realise when re-publishing amethyst is that you
  # cannot push empty directories to a Git repository, so these directories
  # are now missing. So we create them.
  mkdir -p amethyst/amethyst/obj
  mkdir -p amethyst/amethyst/out
}

build() {
  # To build with GTK+3 instead of GTK+2, the "hiro=gtk3" flag needs to be
  # passed to make.
  cd amethyst/amethyst
  make hiro=gtk3
}

package() {
  cd amethyst
  install -Dm 644 COPYING.txt -t "${pkgdir}"/usr/share/licenses/amethyst
  install -Dm 644 COPYING.LIB.txt -t "${pkgdir}"/usr/share/licenses/amethyst

  cd amethyst
  install -Dm 755 out/amethyst -t "${pkgdir}"/usr/bin
  install -Dm 644 data/amethyst.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 data/amethyst.svg -t "${pkgdir}"/usr/share/icons
  install -Dm 644 data/mimetypes.bml -t "${pkgdir}"/usr/share/amethyst
  install -Dm 644 data/settings.bml -t "${pkgdir}"/usr/share/amethyst
}

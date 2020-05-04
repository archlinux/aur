# Maintainer: Callum Parsey <neoninteger@protonmail.com>

pkgname=amethyst
pkgver=3.3
pkgrel=1
pkgdesc='A lightweight source code editor with tree-view navigation'
arch=('x86_64')
url='https://byuu.org/projects/amethyst'
license=('ISC' 'GPL3')
depends=('gtksourceview3')
source=('https://byuu.org/files/releases/amethyst_v3r3.tar.xz'
        'amethyst-release.patch'
        'amethyst-disable-theme.patch'
        'LICENSE')
sha256sums=('5445f658d9a0322c180801bbb710ae4e097d9594a2d2f2d5c1ac9e9794e1e833'
            '4c9fd1819f244317d8455dcb16cfa0047ed4815ea6ae6c441ff3b2a9f7a9c3ca'
            'f4e5bddd24392ba6920c90aa56a023d1582bb8b91e3759119c3010dcfec5e55f'
            '9af7b9ec6c5c74a0421acb9e2755fe5b92fcce28a3c3a0300ecbe7002269b7f6')
backup=('usr/share/amethyst/mimetypes.bml'
        'usr/share/amethyst/settings.bml')

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
  patch -Np1 -i amethyst-release.patch

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
  patch -Np1 -i amethyst-disable-theme.patch
}

build() {
  # To build with GTK+3 instead of GTK+2, the "hiro=gtk3" flag needs to be
  # passed to make.
  cd amethyst
  make hiro=gtk3
}

package() {
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/amethyst
  cd amethyst
  install -Dm 755 out/amethyst -t "${pkgdir}"/usr/bin
  install -Dm 644 data/amethyst.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 data/amethyst.svg -t "${pkgdir}"/usr/share/icons
  install -Dm 644 data/mimetypes.bml -t "${pkgdir}"/usr/share/amethyst
  install -Dm 644 data/settings.bml -t "${pkgdir}"/usr/share/amethyst
}

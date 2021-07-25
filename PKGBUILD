# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: timescam <rex.ky.ng at gmail dot com>
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgbase=kitty-git
pkgname=(kitty-git kitty-terminfo-git)
pkgver=0.21.2.r132.gaa339a8a
pkgrel=1
pkgdesc="Modern, hackable, featureful, OpenGL based terminal emulator"
arch=(i686 x86_64)
url="https://github.com/kovidgoyal/kitty"
license=(GPL3)
depends=(python freetype2 fontconfig wayland libx11 libxi libgl libcanberra dbus lcms2)
makedepends=(git python-setuptools libxinerama libxcursor libxrandr libxkbcommon libxkbcommon-x11 wayland-protocols mesa python-sphinx
             python-sphinx-copybutton python-sphinx-inline-tabs python-sphinxext-opengraph python-sphinx-furo)
source=("git+https://github.com/kovidgoyal/kitty.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python3 setup.py linux-package --update-check-interval=0 
}

package_kitty-git() {
  depends+=(kitty-terminfo)
  optdepends=('imagemagick: viewing images with icat')
  provides=(kitty)
  conflicts=(kitty)

  cd "${srcdir}/${pkgname%-git}"

  cp -r linux-package "${pkgdir}"/usr

  # completions
  python __main__.py + complete setup bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/kitty
  python __main__.py + complete setup fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/kitty.fish
  # doesn't know how to http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Autoloaded-files
  # so we write our own header
  {
      echo "#compdef kitty"
      python __main__.py + complete setup zsh
  } | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_kitty

  install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/kitty.png "${pkgdir}"/usr/share/pixmaps/kitty.png

  rm -r "$pkgdir"/usr/share/terminfo

  install -Dm644 docs/generated/conf/kitty.conf "${pkgdir}"/usr/share/doc/${pkgname}/kitty.conf
}

package_kitty-terminfo-git() {
  pkgdesc="Terminfo for kitty, an OpenGL-based terminal emulator"
  depends=(ncurses)
  provides=(kitty-terminfo)
  conflicts=(kitty-terminfo)

  mkdir -p "$pkgdir/usr/share/terminfo"
  tic -x -o "$pkgdir/usr/share/terminfo" ${pkgbase/-git/}/terminfo/kitty.terminfo
}

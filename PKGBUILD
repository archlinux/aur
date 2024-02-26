# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: timescam <rex.ky.ng at gmail dot com>
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgbase=kitty-git
pkgname=(kitty-git kitty-terminfo-git kitty-shell-integration-git)
pkgver=0.32.2.r373.ge9c4e7310
pkgrel=2
epoch=1
pkgdesc="Modern, hackable, featureful, OpenGL based terminal emulator"
arch=(i686 x86_64)
url="https://sw.kovidgoyal.net/kitty/"
license=(GPL3)
depends=(python wayland libx11 dbus lcms2 fontconfig
         libxkbcommon-x11 librsync xxhash) #python-pygments
makedepends=(git python-setuptools libxinerama libxcursor libxrandr libxkbcommon mesa
             wayland-protocols python-sphinx python-sphinx-copybutton
             ttf-roboto freetype2 libxi libgl libcanberra simde
             python-sphinx-inline-tabs python-sphinxext-opengraph python-sphinx-furo go)
source=("git+https://github.com/kovidgoyal/kitty.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  #printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags --exclude nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  python setup.py linux-package --update-check-interval=0
}

package_kitty-git() {
  depends+=(kitty-terminfo-git kitty-shell-integration-git)
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
  rm -r "$pkgdir"/usr/lib/kitty/shell-integration

  install -Dm644 docs/generated/conf/kitty.conf "${pkgdir}"/usr/share/doc/${pkgname}/kitty.conf
}

package_kitty-terminfo-git() {
  pkgdesc="Terminfo for kitty, an OpenGL-based terminal emulator"
  depends=(ncurses)
  arch=(any)
  provides=(kitty-terminfo)
  conflicts=(kitty-terminfo)

  mkdir -p "$pkgdir/usr/share/terminfo"
  tic -x -o "$pkgdir/usr/share/terminfo" ${pkgbase%-git}/terminfo/kitty.terminfo
}

package_kitty-shell-integration-git() {
  pkgdesc='Shell integration scripts for kitty, an OpenGL-based terminal emulator'
  depends=()
  arch=(any)
  provides=(kitty-shell-integration)
  conflicts=(kitty-shell-integration)

  mkdir -p "$pkgdir/usr/lib/kitty/"
  cp -r "$srcdir/${pkgbase%-git}/shell-integration" "$pkgdir/usr/lib/kitty/"
}

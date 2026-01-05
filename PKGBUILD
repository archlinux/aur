# Maintainer: Ekats <your-email@example.com>
# Contributor: Based on kitty-git by Fabio 'Lolix' Loli

pkgname=kitty-meow-git
pkgver=0.45.0.r1.g52e218325
pkgrel=1
pkgdesc="Kitty terminal fork with persistent selection fix - selections survive new output"
arch=(x86_64)
url="https://github.com/Ekats/kitty-meow"
license=('GPL-3.0-only')
depends=(
  dbus
  fontconfig
  freetype2
  harfbuzz
  hicolor-icon-theme
  kitty-shell-integration
  kitty-terminfo
  lcms2
  libcanberra
  libgl
  libpng
  librsync
  libx11
  libxcursor
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxrandr
  openssl
  python
  wayland
  xxhash
)
makedepends=(
  git
  go
  libxcb
  mesa
  python-setuptools
  python-sphinx
  python-sphinx-copybutton
  python-sphinx-furo
  python-sphinx-inline-tabs
  python-sphinxext-opengraph
  simde
  ttf-nerd-fonts-symbols-mono
  wayland-protocols
)
optdepends=('imagemagick: viewing images with icat'
            'python-pygments: syntax highlighting in kitty +kitten diff'
            'libcanberra: playing "bell" sound on terminal bell'
            'kitty-meow-config: custom tab bar, persistent zoom, and theme')
provides=(kitty)
conflicts=(kitty kitty-git)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd kitty-meow
  local ver
  ver=$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  if [[ -z "$ver" ]]; then
    ver="0.40.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi
  echo "$ver"
}

build() {
  cd kitty-meow
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  python setup.py linux-package --update-check-interval=0
}

package() {
  cd kitty-meow

  # Install desktop entries
  install -Dm644 "linux-package/share/applications/kitty.desktop" "${pkgdir}/usr/share/applications/kitty.desktop"
  install -Dm644 "linux-package/share/applications/kitty-open.desktop" "${pkgdir}/usr/share/applications/kitty-open.desktop"

  # Install binaries and libs
  cp -r linux-package/lib "${pkgdir}/usr/lib"
  cp -r linux-package/bin "${pkgdir}/usr/bin"

  # Install icons
  install -Dm644 linux-package/share/icons/hicolor/256x256/apps/kitty.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kitty.png"
  install -Dm644 linux-package/share/icons/hicolor/scalable/apps/kitty.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kitty.svg"

  # Install man pages
  install -Dm644 linux-package/share/man/man1/kitty.1 "${pkgdir}/usr/share/man/man1/kitty.1"
  install -Dm644 linux-package/share/man/man5/kitty.conf.5 "${pkgdir}/usr/share/man/man5/kitty.conf.5"

  # Install shell completions
  install -Dm644 <(linux-package/bin/kitty +complete setup bash) "${pkgdir}/usr/share/bash-completion/completions/kitty"
  install -Dm644 <(linux-package/bin/kitty +complete setup fish) "${pkgdir}/usr/share/fish/vendor_completions.d/kitty.fish"
  install -Dm644 <(linux-package/bin/kitty +complete setup zsh) "${pkgdir}/usr/share/zsh/site-functions/_kitty"

  # Remove terminfo and shell-integration (provided by kitty-terminfo and kitty-shell-integration)
  rm -rf "${pkgdir}/usr/lib/kitty/shell-integration"
  rm -rf "${pkgdir}/usr/share/terminfo"
}

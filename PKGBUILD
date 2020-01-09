# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Tmplt <tmplt@dragons.rocks>

pkgname=katriawm
pkgver=19.11
pkgrel=1
pkgdesc="non-reparenting, dynamic window manager for X11 with decorations"
arch=("i686" "x86_64")
url="https://www.uninformativ.de/git/katriawm/file/README.html"
license=("MIT")
makedepends=("git")
depends=("libx11" "libxft" "libxrandr")
source=("git+https://www.uninformativ.de/git/katriawm.git#tag=v${pkgver}"
        "set_prefix.patch")
sha256sums=('SKIP'
            'a9de73fa43affa7c32d0f678c21eb30aa9173d9e51eb8e170a0389db82f3bf8c')


prepare() {
  cd "${pkgname}/src"

  # Set prefix
  patch -Np2 -i "${srcdir}/set_prefix.patch"

  # Read custom config headers from $XDG_CONFIG_HOME/katria{wm,bi}-config.h

  config=${XDG_CONFIG_HOME:-~/.config/}

  if [[ -f "${config}/katriawm-config.h" ]]; then
      msg "Using custom config.h for katriawm(1)"
      cp -f "${config}/katriawm-config.h" core/config.h
  fi

  if [[ -f "${config}/katriabi-config.h" ]]; then
      msg "Using custom config.h for katriabi(1)"
      cp -f "${config}/katriabi-config.h" barinfo/config.h
  fi
}

build() {
  cd "${pkgname}/src"
  make
}

package() {
  cd "${pkgname}/src"
  make DESTDIR=${pkgdir} install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

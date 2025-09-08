# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: VxlerieUwU
pkgname=toggle-git
_app_id=app.drey.Toggle
pkgver=0.99.0.a.r18.ga7bd078
pkgrel=1
pkgdesc="Toggle extra GNOME settings"
arch=('any')
url="https://gitlab.gnome.org/World/toggle"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'setconf'
  'typescript'
)
optdepends=('gnome-shell-extensions: enable Light Theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/toggle.git'
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git'
        'fix-build.patch')
sha256sums=('SKIP'
            'SKIP'
            'f4724cfe8cc80133af9fbe118682bf8b2259cce1acfdd9caa5533b0f2a9dd52b')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.src/gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  patch -Np1 -i "$srcdir/fix-build.patch"

  # Correct Exec
  setconf "data/${_app_id}.desktop.in.in" Exec "${pkgname%-git}"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

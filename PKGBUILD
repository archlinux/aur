# https://aur.archlinux.org/packages/toggle-git
groups=('modified')

pkgname=toggle-git
_app_id=app.drey.Toggle
pkgver=r126.93f9333
pkgrel=1
pkgdesc="Like Tweaks, but with more Libadwaita!"
arch=('any')
url="https://gitlab.gnome.org/World/toggle"
license=('GPL3')
depends=('gjs' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson' 'setconf' 'typescript')
checkdepends=('appstream-glib')
optdepends=('gnome-shell-extensions: enable Light Theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/toggle.git'
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git'
        'fix-build.patch')
b2sums=('SKIP'
        'SKIP'
        'e8f69a7f9e789251ef7e5060e1c681bbc1806371021f3bc1abf66fadb4dd48535c9e270cf9bf64beb9b6d67d469bc1c92526f9cec81baa2ac50e0862d53c2215')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.src/gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  patch --forward --strip=1 --input="$srcdir/fix-build.patch"

  # Correct Exec
  setconf "data/${_app_id}.desktop.in.in" Exec "${pkgname%-git}"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

_name=toggle
pkgname=toggle-git
pkgver=r101.4eda274
pkgrel=1
pkgdesc="Like Tweaks, but with more libadwaita!"
arch=('any')
url="https://gitlab.com/OroWith2Os/$_name"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gnome-shell')
makedepends=('blueprint-compiler' 'git' 'meson' 'typescript')
checkdepends=('appstream-glib')
source=("git+https://gitlab.com/OroWith2Os/$_name"
        "git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions"
        "fix-build.patch")
b2sums=('SKIP'
            'SKIP'
            'e8f69a7f9e789251ef7e5060e1c681bbc1806371021f3bc1abf66fadb4dd48535c9e270cf9bf64beb9b6d67d469bc1c92526f9cec81baa2ac50e0862d53c2215')

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd $_name
  git submodule init
  git config submodule.src/gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update
  patch --forward --strip=1 --input="${srcdir}/fix-build.patch"
}


build() {
  cd $_name
  arch-meson ../$_name ../build
  meson compile -C ../build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

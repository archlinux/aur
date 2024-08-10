# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="notes"
_pkgname=$_name.lv2
pkgname=$_pkgname-git
pkgver=0.4.0.r60.g6458018
pkgrel=1
pkgdesc='An LV2 plugin to store arbitrary notes and images in your project (git version)'
arch=(x86_64)
url='https://open-music-kontrollers.ch/lv2/notes/'
license=('Artistic2.0')
groups=(lv2-plugins pro-audio)
depends=(fontconfig glew libvterm ttf-fira-code ttf-fira-sans)
makedepends=(git glu lv2 meson)
checkdepends=(lv2lint)
provides=($_pkgname "$_pkgname=${pkgver/\.r.*/}")
conflicts=($_pkgname)
source=("$_pkgname::git+https://git.open-music-kontrollers.ch/~hp/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

build() {
  test -d $_pkgname-build && extra_args="--reconfigure"
  arch-meson $extra_args $_pkgname-build $_pkgname
  meson compile -C $_pkgname-build
}

check() {
  #lv2lint -s 'pugl*' -Mpack -I "build/" \
  #  "http://open-music-kontrollers.ch/lv2/${_pkgname}#${_plugin}"
  lv2lint -Mpack -I $_pkgname-build \
    "http://open-music-kontrollers.ch/lv2/$_name#$_name"
}

package() {
  DESTDIR="${pkgdir}" meson install -C $_pkgname-build
  cd $_pkgname
  install -vDm 644 ChangeLog README.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSES/* \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}

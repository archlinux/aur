# Maintainer: aur.chaotic.cx

_pkgname="grub-shusher"
pkgname="$_pkgname-git"
pkgver=r29.853de57
pkgrel=1
pkgdesc="Utilities to patch grub for silent boot"
url="https://github.com/ccontavalli/grub-shusher"
license=('BSD-2-Clause')
arch=('x86_64')

depends=(
  'glibc'
)
makedepends=(
  'git'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  install -Dm644 /dev/stdin "$_pkgsrc/meson.build" << END
project('grub-shusher', 'c',)

executable(
  'shush-kernel',
  sources: 'grub-kernel.c',
  install: true,
)

executable(
  'shush-mbr',
  sources: 'mbr.c',
  c_args: ['-Wno-error=format-security'],
  install: true,
)
END
}

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

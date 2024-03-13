# Maintainer: Eduard Toloza <https://edu4rdshl.dev>
# PKGBUILD taken and modified from https://aur.archlinux.org/packages/decibels

_pkgname=decibels
pkgname=decibels-git
pkgver=r235.a50297a
pkgrel=1
pkgdesc="Play audio files"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/Incubator/decibels"
license=(GPL-3.0)
depends=(
  'gjs'
  'gst-plugins-bad-libs'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
  'typescript'
  'blueprint-compiler'
)
checkdepends=(
  'appstream-glib'
)
source=("git+https://gitlab.gnome.org/GNOME/Incubator/${_pkgname}.git"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${_pkgname}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}

  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  # Fix build:
  sed -i "s/tsc, '--outDir'/tsc, '--project', files('..\\/tsconfig.json'), '--outDir'/g" src/meson.build

  # Replace service exec with `decibels`
  sed -i "s/Exec=@application_id@/Exec=${_pkgname}/g" data/com.vixalien.decibels.service.in
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd ${_pkgname}

  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${_pkgname}/"

  ln -s "/usr/bin/com.vixalien.decibels" "$pkgdir/usr/bin/${_pkgname}"
}


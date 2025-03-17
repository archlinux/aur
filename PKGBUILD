pkgname=pfsshell-git
pkgver=1.1.1.r118.67f805e
pkgrel=1
pkgdesc="Browse and edit PFS filesystems (Playstation 2 HDD). (GIT version)"
arch=('x86_64')
url='https://github.com/ps2homebrew/pfsshell'
license=('GPL')
makedepends=('meson')
source=(
  'git+https://github.com/ps2homebrew/pfsshell.git'
  'git+https://github.com/ps2dev/ps2sdk.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd pfsshell
  _ver="$(cat meson.build | grep -m1 'version:' | cut -d ':' -f3 | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pfsshell
  git config submodule.external/ps2sdk.url "${srcdir}/ps2sdk"
  git -c protocol.file.allow=always submodule update --init \
    external/ps2sdk
}

build() {
  cd pfsshell
  arch-meson build

  ninja -C build
}

package() {
  cd pfsshell
  install -Dm755 build/pfsshell "$pkgdir/usr/bin/pfsshell"
}

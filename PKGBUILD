# Maintainer: ArjixWasTaken <me@arjix.dev>

VCSCLIENTS+=('git-lfs::git-lfs')

_pkgname=rhythia
pkgname=${_pkgname}-git
pkgver=0.1.1.r296.0116a85
pkgrel=1
pkgdesc="Aim-based rhythm game client, built in Godot 4"
arch=(x86_64)
url="https://github.com/Rhythia/Client"
license=('AGPL-3.0')
makedepends=(
  'git'
  'git-lfs'
  'makepkg-git-lfs-proto'

  'godot-mono'
  'dotnet-sdk'
  'godot-export-templates-linux-bin'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git-lfs+$url.git#branch=indev"
  "export_presets.cfg"
  "rhythia.desktop"
)
sha256sums=(
  'SKIP'
  '250e077a08d7a5c5cdb51ae68d1332b1bd93e5ab5ef0e415c3ce450139a9ae12'
  '810e1413d4499405f63e9c158b9826a3aaba2aacba62000b1a82a57095cc27f1'
)

pkgver() {
    cd "${_pkgname}"

    local rhythia_ver=$(awk -F'"' '/^config\/version=/{print $2}' project.godot)
    local commit_ref="r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"

    echo "${rhythia_ver}.${commit_ref}"
}

prepare() {
    cd "${_pkgname}"

    git lfs fetch --all
    git lfs pull

    cp ../export_presets.cfg .
}

build() {
    cd "${_pkgname}"

    mkdir -p dist
    godot-mono --path . --export-release "Linux" dist/Rhythia
}

package() {
    cd "${_pkgname}"

    install -d "$pkgdir/usr/lib/rhythia"
    cp -a dist/. "$pkgdir/usr/lib/rhythia/"

    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/rhythia/Rhythia "$pkgdir/usr/bin/rhythia"

    install -Dm644 ../rhythia.desktop "$pkgdir/usr/share/applications/rhythia.desktop"
    install -Dm644 ./textures/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rhythia.svg"
}

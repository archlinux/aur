# Maintainer: sunkhan
# Pre-built Electron + napi-rs binary release of Decibell.
# Source build (the previous Tauri-era PKGBUILD) was retired with the
# move to Electron 33: building the Castlabs Widevine fork on user
# machines is heavy and brittle, so we now ship the .pacman that
# electron-builder produces in CI.
pkgname=decibell-bin
_pkgname=decibell
pkgver=0.6.7
pkgrel=1
pkgdesc="Decentralized text, voice chat, and streaming app"
arch=('x86_64')
url="https://github.com/sunkhan/decibell"
license=('MIT')
depends=(
    'gtk3'
    'nss'
    'alsa-lib'
    'libxss'
    'libnotify'
    'libsecret'
    'pipewire'
    'libpipewire'
)
provides=('decibell')
conflicts=('decibell' 'decibell-git')
options=('!strip')

# CI tags releases with the `ev` prefix (`ev0.0.1`) so the Electron
# pipeline doesn't collide with the legacy Tauri `v*` tags.
source=(
    "${_pkgname}-${pkgver}.pacman::https://github.com/sunkhan/decibell/releases/download/ev${pkgver}/Decibell-${pkgver}-x64.pacman"
)
sha256sums=('SKIP')

package() {
    # electron-builder's `pacman` target produces a fully-formed
    # .pkg.tar.zst (renamed to .pacman). It already contains the app
    # under /opt, the .desktop entry, and hicolor icons — we just
    # extract its payload into $pkgdir, dropping the pacman metadata
    # files since makepkg writes its own.
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.pacman" -C "${pkgdir}/" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.BUILDINFO' \
        --exclude='.INSTALL'
}

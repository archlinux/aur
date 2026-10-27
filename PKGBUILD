# Maintainer: gnuruzzi <gnuruzzi@users.noreply.gitlab.com>
pkgname=evolution-quill
pkgver=0.4.1
# Increment for a packaging-only rebuild; pkgver follows the upstream tag.
pkgrel=1
pkgdesc="AI assistant for Evolution mail — summarize messages and draft replies (Gemini, Claude, OpenAI)"
arch=('x86_64')
url="https://gitlab.com/gnuruzzi/evolution-quill"
license=('LGPL-2.1-or-later')
depends=(
    # The module implements Evolution's EExtension/EMailReader/EMsgComposer
    # interfaces. Keep the source/API floor here; package() pins the build
    # host's Evolution major.minor series in .PKGINFO.
    'evolution>=3.58'
    'binutils'
    'libsoup3'
    'json-glib'
    'libsecret'
    'gtk3'
    # Listing the linked .so names causes makepkg to record exact versioned
    # SONAME dependencies (lib*.so=X-64) in .PKGINFO. pacman uses them as
    # transaction guards on ABI-breaking upgrades; AUR helpers (paru/yay)
    # queue automatic rebuilds when pkgrel (or pkgver) is bumped in the AUR.
    'libcamel-1.2.so'
    'libedataserver-1.2.so'
    'libsoup-3.0.so'
    'libjson-glib-1.0.so'
    'libsecret-1.so'
    'libgtk-3.so'
    'libgdk-3.so'
)
optdepends=(
    'rebuild-detector: detect broken library links in installed packages after upgrades (checkrebuild)'
)
makedepends=(
    'cmake'
    'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('ba6a8f39a0b4d3a6ef0869e819f19c3342cebdf60490fdb81f6607e0cd9dd3d3')

build() {
    cmake -B build -S "$pkgname-v$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSTEM_INSTALL=ON \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    local installed_evolution
    installed_evolution=$(pacman -Q evolution) || return 1
    [[ "$installed_evolution" =~ ^evolution\ ([0-9]+)\.([0-9]+)\.[0-9]+- ]] || return 1
    local major="${BASH_REMATCH[1]}" minor="${BASH_REMATCH[2]}"
    depends[${#depends[@]}]="evolution>=${major}.${minor}"
    depends[${#depends[@]}]="evolution<${major}.$((minor + 1))"
    DESTDIR="$pkgdir" cmake --install build
}

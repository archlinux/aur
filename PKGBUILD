# Maintainer: Malik Al-Zawari <zouarimalek1+gh@gmail.com>
# Upstream Author: Thomas Duckworth <tduck@filotimoproject.org>
# Upstream Contributors:
#   Muhammad Usama Anjum <usama.anjum@collabora.com>
#   Sebastian Siedentopf <openmail+sourcecode@siezi.com>
#   Velocity Limitless, LLC

pkgname=dynamic-hibernate-git
pkgver=r1.0.1.0
pkgrel=1
pkgdesc="Dynamically creates a btrfs swapfile before hibernation, circumventing the need for a static swap partition or swapfile"
arch=('any')
url="https://invent.kde.org/tduck/dynamic-hibernate"
license=('GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL')
depends=(
    'btrfs-progs'
    'systemd'
    'dbus'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'rust'
    'ki18n'
    'git'
)

provides=('dynamic-hibernate')
conflicts=('dynamic-hibernate')
install=dynamic-hibernate.install
source=("${pkgname}::git+https://invent.kde.org/tduck/dynamic-hibernate.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    local commits version
    commits="$(git rev-list --count HEAD)"
    version="$(grep '^version' Cargo.toml | head -1 | sed 's/.*= *"\(.*\)"/\1/')"
    printf "r%s.%s" "${commits}" "${version}"
}

prepare() {
    cd "${pkgname}"
    # Use system gettext instead of building it from source
    export GETTEXT_SYSTEM=1
    # Pre-fetch cargo dependencies
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    cd "${pkgname}"
    export GETTEXT_SYSTEM=1
    cmake \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCARGO_BUILD_PROFILE=release
    cmake --build build
}

package() {
    cd "${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build

    # Install all license files as declared in REUSE.toml and LICENSES/
    install -Dm644 LICENSES/GPL-2.0-only.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/GPL-2.0-only.txt"
    install -Dm644 LICENSES/GPL-3.0-only.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/GPL-3.0-only.txt"
    install -Dm644 LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-KDE-Accepted-GPL.txt"
    install -Dm644 LICENSES/CC0-1.0.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/CC0-1.0.txt"
    install -Dm644 LICENSES/BSD-2-Clause.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/BSD-2-Clause.txt"

    # Install documentation
    install -Dm644 README.md   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 REUSE.toml  "${pkgdir}/usr/share/doc/${pkgname}/REUSE.toml"
}
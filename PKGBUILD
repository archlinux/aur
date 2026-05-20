# Maintainer: psi4j <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr-git
_realname=sunsetr
pkgver=0.11.1.r134.g3564204
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland (git version)"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('wayland')
makedepends=('git' 'rust' 'cargo')
provides=('sunsetr')
conflicts=('sunsetr' 'sunsetr-bin')
replaces=('sunsetr-git-debug')
options=('!debug')
source=("${_realname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_realname}"
    export SUNSETR_VERSION="$pkgver"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_realname}"

    # Install the binary
    install -Dm755 "target/release/${_realname}" \
                    "${pkgdir}/usr/bin/${_realname}"

    # Install the license file
    install -Dm644 "LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the systemd user service file
    install -Dm644 "${_realname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${_realname}.service"

    # Install README
    install -Dm644 "README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

post_install() {
    echo ":: Sleep/resume detection is handled automatically via D-Bus"
}

post_upgrade() {
    # Clean up old sleep hook from previous versions (< 0.8.0)
    if [ -f "/usr/lib/systemd/system-sleep/${_realname}-resume" ]; then
        echo ":: Removing deprecated sleep hook (sleep/resume now handled via D-Bus)"
        rm -f "/usr/lib/systemd/system-sleep/${_realname}-resume"
    fi
}

# vim:set ts=4 sw=4 et:

# Maintainer: Claude <noreply@anthropic.com>
# Packaging Repo: https://github.com/orange-guo/aur-packages

pkgname=vibe-kanban-bin
_pkgname=vibe-kanban
pkgver=0.0.143
pkgrel=1
pkgdesc="Vibe Kanban - AI-powered Kanban board (Binary)"
arch=('x86_64')
url="https://vibekanban.com"
license=('Proprietary')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('nodejs')
makedepends=('npm')
options=('!strip')

install=vibe-kanban-bin.install

source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
        "vibe-kanban.service")
sha256sums=('1043fde3daa980cdf4fbb7874c3a187d6e261455e6babf6730d2944bb8bd364b'
            '48b6d94e9693f7098ad7d3786ff08b648ce08ab8fcfe8ff13cff97906a12a33f')

package() {
    cd "${srcdir}/package"

    # Install dependencies
    npm install --production

    # Create destination directory
    install -d "${pkgdir}/usr/lib/${_pkgname}"

    # Copy files
    cp -r . "${pkgdir}/usr/lib/${_pkgname}/"

    # Create symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/bin/cli.js" "${pkgdir}/usr/bin/${_pkgname}"

    # Install systemd service
    if [ -f "${srcdir}/vibe-kanban.service" ]; then
        install -Dm644 "${srcdir}/vibe-kanban.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
    fi

    # Install license if available
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

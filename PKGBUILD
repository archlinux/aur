
pkgname=flat-manager
pkgver=0.4.5
pkgrel=1
pkgdesc="Manager for flatpak repositories "
url="https://github.com/flatpak/flat-manager/"
depends=('glibc' 'gcc-libs' 'postgresql-libs' 'ostree' 'python' 'python-aiohttp' 'python-tenacity' 'python-gobject' 'glib2')
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'Apache-2.0')
source=("git+https://github.com/flatpak/flat-manager#tag=${pkgver}"
        "flat-manager.service"
        "flat-manager.sysusers"
        "flat-manager.tmpfiles")
sha256sums=('a6b6b1a25f6eabfe8661b39e6e06f6f0a488a464204df2988888851c3fd44de3'
            '630c7ccac0fd9db5b30edeea92799ec78c594fffca912cb599f0e6a4915df693'
            'c59636eaa8ae5862b1bd215a8e288bd32ecf141d0eccba097f9ad2105e4612df'
            'bd3133ded534df7f351ae2a5db5dde674499271dc0a720f59d46a5649327c6ce')
backup=("etc/flat-manager/config.json")
options=(!lto)

build() {
    cargo build \
        --release \
        --manifest-path flat-manager/Cargo.toml
}

package() {
    cargo install \
        --frozen \
        --offline \
        --no-track \
        --path flat-manager \
        --root=${pkgdir}/usr
    cd flat-manager
    install -vDm 644 ../flat-manager.service ${pkgdir}/usr/lib/systemd/system/flat-manager.service
    install -vDm 644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm 644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -vDm 644 example-config.json ${pkgdir}/etc/flat-manager/config.json
    install -vDm 755 flat-manager-client ${pkgdir}/usr/bin/flat-manager-client
    install -vDm 644 LICENSE-APACHE ${pkgdir}/usr/share/licenses/flat-manager/LICENSE-APACHE
    install -vDm 644 LICENSE-MIT ${pkgdir}/usr/share/licenses/flat-manager/LICENSE-MIT
}


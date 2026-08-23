# Maintainer: Tim <james@inplico.uk>
pkgname=dinit-interchange
pkgver=0.0.7
pkgrel=1
pkgdesc="A lightweight, fail-secure D-Bus privilege gateway for the Dinit init system"
arch=('x86_64')
url="https://github.com"
license=('GPL3')
# --- CRITICAL DEPENDENCY PAIRS ---
depends=('glib2' 'json-c' 'libdinitctl')
makedepends=('pkg-config')
url="https://github.com/Timh1970/dinit-interchange"
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a6f89bf6327c17816cd0657b569a826704f0669746d08dbbba2c04ebb7de592')



build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make -C src
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install your compiled binary executable file
    #install -Dm755 dinit-taxi "${pkgdir}/usr/bin/dinit-interchage"
    make -C src DESTDIR="${pkgdir}" install

    # Deploy your hardened system D-Bus security policy firewall rules file
    install -Dm644 "uk.inplico.dinit-dbus.conf" "${pkgdir}/usr/share/dbus-1/system.d/uk.inplico.dinit-dbus.conf"


    # Deploy the native service controller file into the primary system init directory
    install -Dm644 "dinit-interchange" "${pkgdir}/etc/dinit.d/dinit-interchange"

    # Create /etc/dinit-taxi.d strictly locked down to root-only (rwx------)
    install -dm700 "${pkgdir}/etc/dinit-interchange/rules.d/"

    # Deploy your explicit layout blueprint straight into the server's workspace
    install -Dm644 "template.policy.example" "${pkgdir}/etc/dinit-interchange/rules.d/template.policy.example"

}

# Maintainer: Patrick Jaja <patrick.jaja@valantic.com>
# Contributor: Nayrosk

pkgname=claude-cowork-service
pkgver=1.0.62
pkgrel=1
pkgdesc="Native Linux backend for Claude Desktop Cowork"
arch=('x86_64' 'aarch64')
url="https://github.com/patrickjaja/claude-cowork-service"
license=('MIT')

# Don't emit a separate -debug package. The shipped binary is stripped by makepkg's
# `strip` option; detached debug symbols aren't useful for this service and pull an
# extra claude-cowork-service-debug package into installs. Overrides makepkg.conf.
options=(!debug)

depends=('util-linux')
optdepends=('claude-desktop-bin: Unofficial Linux frontend for Claude Desktop Cowork'
            'claude-code: An agentic coding tool that lives in your terminal (you can also install via native installer)'
            'systemd: required for the systemd user service unit (provided by base on Arch)'
            'openrc: required to use the OpenRC init script (Artix Linux)')
makedepends=('go')
backup=('etc/conf.d/claude-cowork')

install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e7453d5ee365ef3908ec1b08a4758cd0f236d46ec4106709f87f6b7d22149668')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make VERSION="${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 cowork-svc-linux \
        "${pkgdir}/usr/bin/cowork-svc-linux"

    install -Dm644 claude-cowork.service \
        "${pkgdir}/usr/lib/systemd/user/claude-cowork.service"

    # OpenRC support (harmless on systemd hosts; only used when /sbin/openrc-run exists)
    install -Dm755 claude-cowork.openrc \
        "${pkgdir}/etc/init.d/claude-cowork"
    install -Dm644 claude-cowork.confd \
        "${pkgdir}/etc/conf.d/claude-cowork"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

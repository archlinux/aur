# Maintainer: Patrick Jaja <patrick.jaja@valantic.com>
# Contributor: Nayrosk

pkgname=claude-cowork-service
pkgver=1.2.0
pkgrel=1
pkgdesc="[DEPRECATED - UNMAINTAINED] Native Linux backend for Claude Desktop Cowork; superseded by the official Claude Desktop Linux .deb"
arch=('x86_64' 'aarch64')
url="https://github.com/patrickjaja/claude-cowork-service"
license=('MIT')

# Don't emit a separate -debug package. The shipped binary is stripped by makepkg's
# `strip` option; detached debug symbols aren't useful for this service and pull an
# extra claude-cowork-service-debug package into installs. Overrides makepkg.conf.
options=(!debug)

depends=('util-linux')
# NOTE: intentionally no longer OptDepends on claude-desktop-bin. This package is
# deprecated; Cowork on Linux is now handled by the actively-maintained
# claude-desktop-bin (it patches the official Claude Desktop Linux build and uses
# its built-in Cowork sandbox), which no longer needs this daemon. Dropping the
# cross-link removes the stale "Required by: claude-cowork-service" entry from the
# claude-desktop-bin AUR page. (claude-desktop-bin is the recommended migration
# target -- see the deprecation notice in claude-cowork-service.install.)
optdepends=('claude-code: An agentic coding tool that lives in your terminal (you can also install via native installer)'
            'systemd: required for the systemd user service unit (provided by base on Arch)'
            'openrc: required to use the OpenRC init script (Artix Linux)')
makedepends=('go')
backup=('etc/conf.d/claude-cowork')

install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('318e717caf4459f7a1da6e776c16492191631569075e2b3e8350bdc484c6112f')

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

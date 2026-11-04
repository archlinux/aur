# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=etherpad-lite-bin
pkgver=3.3.14
# Debian revision of the upstream .deb asset for this pkgver.
_debrel=1
pkgrel=1
pkgdesc="Real-time collaborative editor for the web (upstream .deb build)"
arch=('x86_64' 'aarch64')
url="https://etherpad.org"
license=('Apache-2.0')
depends=('nodejs>=24' 'ca-certificates')
optdepends=('libreoffice-fresh: import/export of doc/pdf/odf formats'
            'postgresql: PostgreSQL database backend'
            'mariadb: MySQL-compatible database backend')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=('etc/default/etherpad')
options=('!debug')
source=('etherpad.sysusers'
        'etherpad.tmpfiles')
source_x86_64=("etherpad_${pkgver}-${_debrel}_amd64.deb::https://github.com/ether/etherpad-lite/releases/download/v${pkgver}/etherpad_${pkgver}-${_debrel}_amd64.deb")
source_aarch64=("etherpad_${pkgver}-${_debrel}_arm64.deb::https://github.com/ether/etherpad-lite/releases/download/v${pkgver}/etherpad_${pkgver}-${_debrel}_arm64.deb")
sha256sums=('ecb57e3ac038f09b9f593e920d73e13a9b2dd54659fdc68195e121c9da9fcf97'
            '4f5b24e9b4a1d73309d9b02ef52dd1417b26c2cda16249699280fa93453d5401')
sha256sums_x86_64=('475e6da69bd35e0e80c705c6cf421b8431d7eb80b3ece8a8358a9388b9a5e270')
sha256sums_aarch64=('57a542d0ae772fcff4f9d8f4fc34c2381a86927545b5fe099045e08d92871b39')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --no-same-owner

    # Unit ships at Debian's /lib path; Arch units live in /usr/lib.
    install -dm755 "${pkgdir}/usr/lib"
    mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib/systemd"
    rmdir "${pkgdir}/lib"

    # Debian packaging scraps are useless on Arch.
    rm -rf "${pkgdir}/opt/etherpad/bin/deb-src"

    # Upstream's .deb ships these symlinks without their targets
    # (admin/doc/ui dev UIs and the playwright test dep are excluded
    # from the production build); dangling links resolve to ENOENT
    # exactly like absent ones, so dropping them is behavior-neutral.
    # pnpm records the same links twice, once per node_modules level.
    rm "${pkgdir}/opt/etherpad/node_modules/admin" \
       "${pkgdir}/opt/etherpad/node_modules/docs" \
       "${pkgdir}/opt/etherpad/node_modules/ui" \
       "${pkgdir}/opt/etherpad/node_modules/.pnpm/node_modules/admin" \
       "${pkgdir}/opt/etherpad/node_modules/.pnpm/node_modules/ui" \
       "${pkgdir}/opt/etherpad/node_modules/.pnpm/node_modules/@etherpad/openapi-codegen" \
       "${pkgdir}/opt/etherpad/node_modules/.pnpm/node_modules/@playwright/test" \
       "${pkgdir}/opt/etherpad/src/node_modules/@playwright/test"

    # Runtime state belongs to tmpfiles.d, which recreates these paths with
    # the same 0750 modes; the .deb only ships them as empty directories.
    rm -rf "${pkgdir}/var"

    # Upstream's postinst wiring, done declaratively instead:
    # settings.json lives in /etc, the runtime var tree in /var/lib
    # (ProtectSystem=strict blocks /opt writes); both are reached from
    # the app dir via shipped symlinks.
    ln -s /etc/etherpad/settings.json "${pkgdir}/opt/etherpad/settings.json"
    ln -s /var/lib/etherpad/var "${pkgdir}/opt/etherpad/var"

    # Seeded config the tmpfiles 'C' line copies to /etc on first install:
    # the dist template defaults to the dev-only "dirty" driver; switch it
    # to sqlite with the database under the writable /var/lib tree.
    sed -e 's|"dbType": "dirty"|"dbType": "sqlite"|' \
        -e 's|"filename": "var/dirty.db"|"filename": "/var/lib/etherpad/etherpad.db"|' \
        "${pkgdir}/usr/share/etherpad/settings.json.dist" \
        > "${pkgdir}/usr/share/etherpad/settings.json.arch"
    grep -q '"dbType": "sqlite"' "${pkgdir}/usr/share/etherpad/settings.json.arch"
    grep -q '/var/lib/etherpad/etherpad.db' "${pkgdir}/usr/share/etherpad/settings.json.arch"

    # Seed for installed_plugins.json so first boot does not spawn
    # `pnpm ls` (pnpm is not a dependency; the bundled node_modules
    # already contains every shipped plugin).
    printf '{"plugins":[{"name":"ep_etherpad-lite","version":"%s"}]}\n' "${pkgver}" \
        > "${pkgdir}/usr/share/etherpad/installed_plugins.json"

    install -Dm644 "${srcdir}/etherpad.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/etherpad.conf"
    install -Dm644 "${srcdir}/etherpad.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/etherpad.conf"
}

latestver() {
    gh api repos/ether/etherpad-lite/releases/latest --jq .tag_name | sed 's/^v//'
}

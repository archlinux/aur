# Maintainer: Xue Dong <support@code1one.com>
#
# AUR `-bin` package for the secure-vault Linux FUSE daemon.
#
# Ships the PREBUILT x86_64 binary from a GitHub Release in the PUBLIC releases
# repo — no Rust toolchain, no build of `core`, no `core` .so. This is the
# freeware-distributable package (docs/licensing.md §9): the daemon binary is
# licensed under the LinuxFS freeware EULA (docs/eula-linuxfs.md — gratis,
# redistribute-unmodified), while `core` and the iOS app stay closed.
#
# Hosting (docs/licensing.md §9.3): the closed source lives only in the private
# repo; CI on a self-hosted Arch runner builds the binary and publishes ONLY the
# compiled tarball to the public `secure-vault-linuxfs-releases` repo. `source=`
# below points at that public release — no source ever reaches the public repo.

pkgname=secure-vault-linuxfs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="secure-vault encrypted-vault FUSE daemon (rclone-crypt compatible, Google Drive backend) — prebuilt binary"
arch=('x86_64')
url="https://github.com/GreyWizardPublic/secure-vault"
# Freeware EULA (docs/eula-linuxfs.md), shipped as the package LICENSE.
license=('custom')
# Runtime deps (docs/licensing.md §9.2), depended upon in two different ways:
#   openssl — real dynamic LINK dep: libssl.so.3/libcrypto.so.3, pulled in via
#             core -> reqwest -> native-tls. Shows up in `ldd`.
#   fuse3   — NOT linked. fuser 0.17 speaks the FUSE protocol over /dev/fuse in
#             pure Rust and EXECS the setuid /usr/bin/fusermount3 helper (from
#             this package) to mount. Invisible to `ldd`, but required at run
#             time. Because libfuse3 is exec'd as a separate program rather than
#             linked, the binary carries no LGPL dynamic-linking obligation.
#             `linuxfs-smoke.yml` asserts both facts on every build.
# SQLite & ring are static.
depends=('fuse3' 'openssl')
provides=('secure-vault-linuxfs')
conflicts=('secure-vault-linuxfs')
install="${pkgname}.install"
options=('!strip' '!debug')   # release binary is already stripped by CI

_stage="secure-vault-linuxfs-${pkgver}-x86_64"
_releases="https://github.com/GreyWizardPublic/secure-vault-linuxfs-releases"
source=("${_releases}/releases/download/linuxfs-v${pkgver}/${_stage}.tar.gz")

# Pinned by `linuxfs/packaging/ci/release.sh`, which rewrites this line with the
# digest of the tarball it just published. A published -bin package MUST pin a
# real checksum: 'SKIP' would let a substituted tarball install silently. The
# release script refuses to push a PKGBUILD still carrying the placeholder.
sha256sums=('36c4d6c8759cc2c06adb9fa4d23b7d031268fb338b2c97357ebfcef009b9ef1f')

package() {
    cd "$srcdir/$_stage"

    install -Dm755 secure-vault-linuxfs \
        "$pkgdir/usr/bin/secure-vault-linuxfs"

    install -Dm644 secure-vault@.service \
        "$pkgdir/usr/lib/systemd/system/secure-vault@.service"
    install -Dm644 secure-vault.sysusers \
        "$pkgdir/usr/lib/sysusers.d/secure-vault.conf"
    install -Dm644 secure-vault.tmpfiles \
        "$pkgdir/usr/lib/tmpfiles.d/secure-vault.conf"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 examples/local-vault.toml \
        "$pkgdir/usr/share/doc/$pkgname/examples/local-vault.toml"
    install -Dm644 examples/drive-vault.toml \
        "$pkgdir/usr/share/doc/$pkgname/examples/drive-vault.toml"

    # Licenses (docs/licensing.md §9.3): freeware EULA is the governing LICENSE;
    # COPYRIGHT names the holder; THIRD_PARTY_NOTICES.md carries the full-text
    # permissive-crate attributions required for binary redistribution (§9.2).
    install -Dm644 EULA.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 COPYRIGHT \
        "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 THIRD_PARTY_NOTICES.md \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}

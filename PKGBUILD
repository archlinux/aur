# Maintainer: Lamberson Co <lamberson@lamco.io>
# Contributor: lamco-office <lamberson@yahoo.com>

# Prebuilt-signed channel. This repackages the published -bin release artifact
# (the Secure Boot-signed .efi + host tooling) rather than building from source,
# so it needs neither the nightly *-unknown-uefi toolchain nor the signing keys
# at package-build time. The build-from-source recipe is the sibling `lamboot`
# package; per AUR convention the prebuilt one carries the -bin suffix.
pkgname=lamboot-bin
pkgver=0.16.5
pkgrel=2
pkgdesc="Memory-safe Rust UEFI bootloader with native BLS, multiboot-aware menu, TPM measurements, and JSON-typed installer protocol (prebuilt signed)"
# aarch64 to be added once the aarch64 -bin artifact ships (release.toml arches).
arch=('x86_64')
url="https://lamco.ai/products/lamboot/"
license=('MIT OR Apache-2.0')
# efibootmgr: lamboot-install registers the UEFI boot entry. python: lamboot-inspect
# and lamboot-monitor.py are python3. Both are runtime needs of the staged tools.
depends=('efibootmgr' 'python')
optdepends=(
    'mokutil: enroll the LamBoot signing certificate as a MOK under shim'
    'sbsigntools: re-sign LamBoot binaries with your own Secure Boot DB key'
    'tpm2-tools: read/extend PCR values for measured-boot integration'
    'shim-signed: Microsoft-signed shim for the Secure Boot chain'
)
provides=("lamboot=$pkgver")
conflicts=('lamboot')
# The .efi is a Secure Boot-signed PE: stripping rewrites section headers and
# breaks the signature, so disable strip and debug-package generation.
options=('!strip' '!debug')

# The published artifact plus its checksum and detached signature, and the
# pacman hook shipped alongside this PKGBUILD. The release URL substitutes the
# tag/version/arch from release.toml at publish time.
source=(
    "https://github.com/lamco-admin/lamboot/releases/download/v${pkgver}/lamboot-${pkgver}-${CARCH}.tar.gz"
    "https://github.com/lamco-admin/lamboot/releases/download/v${pkgver}/lamboot-${pkgver}-${CARCH}.tar.gz.sha256"
    "https://github.com/lamco-admin/lamboot/releases/download/v${pkgver}/lamboot-${pkgver}-${CARCH}.tar.gz.asc"
    '95-lamboot.hook'
)
# The publish pipeline regenerates these from the release artifact at publish
# time (render-at-publish); they are SKIP placeholders in the dev tree so a
# packaging-only revision never has to carry a committed hash. The .hook is
# local and version-stable, so it can keep a real sum.
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
b2sums=('59be1503f8c8636b7b81222ef3f5302518e5fc93a5e1b4a2a95a8d2a660b45f77d3d8771ca362c19b4649c399a4ac2751c6ebed639f7b29f5e1c2c6348746424' 'SKIP' 'SKIP' 'SKIP')

# OpenPGP signing key for the detached .asc (Lamco release key). Uncomment and
# fill the fingerprint when the key is published; until then the .asc is fetched
# but not enforced by makepkg.
# validpgpkeys=('0000000000000000000000000000000000000000')

package() {
    local src="$srcdir/lamboot-${pkgver}"
    local stage="$pkgdir/usr/share/lamboot"

    # 1. Stage the whole distribution under /usr/share/lamboot. lamboot-install
    #    treats this as SRC_DIR (it searches /usr/share/lamboot first) and copies
    #    from it into the operator's ESP at runtime. Exclude packaging/build
    #    metadata, the docs/man/completions/licenses that go to their own paths
    #    below, and python bytecode. cp the explicit payload entries (not cp -a .)
    #    so the excludes are exact and nothing extraneous lands in the tree.
    install -d "$stage"
    cp -a "$src/EFI"                  "$stage/"
    cp -a "$src/lib"                  "$stage/"
    cp -a "$src/systemd"             "$stage/"
    cp -a "$src/kernel-install"      "$stage/"
    cp -a "$src/kernel-hooks"        "$stage/"
    cp -a "$src/lamboot_inspect"     "$stage/"
    cp -a "$src/lamboot-install"     "$stage/"
    cp -a "$src/lamboot-inspect"     "$stage/"
    cp -a "$src/sign-lamboot.sh"     "$stage/"
    cp -a "$src/sign-unlock"         "$stage/"
    cp -a "$src/sign-lock"           "$stage/"
    cp -a "$src/lamboot-kernel-hook" "$stage/"
    cp -a "$src/lamboot-monitor.py"  "$stage/"
    cp -a "$src/lamboot-host-sampler" "$stage/"
    cp -a "$src/lamboot-signing.der" "$stage/"
    cp -a "$src/build-ovmf-vars.sh"  "$stage/"
    cp -a "$src/OVMF_VARS_lamboot.fd" "$stage/"

    # Drop any python bytecode that slipped into the staged package.
    find "$stage" -name '__pycache__' -type d -prune -exec rm -rf {} + 2>/dev/null || true
    find "$stage" -name '*.pyc' -delete 2>/dev/null || true

    # 2. Normalise staged perms: dirs 0755, files 0644, but keep +x on the
    #    operator scripts the dev tree shipped executable. u=rwX,go=rX clears the
    #    group/other-write bit a dev umask may leave and sets the directory/data
    #    split; the chmod afterward restores +x on the executables.
    chmod -R u=rwX,go=rX "$stage"
    chmod 0755 \
        "$stage/lamboot-install" \
        "$stage/lamboot-inspect" \
        "$stage/sign-lamboot.sh" \
        "$stage/sign-unlock" \
        "$stage/sign-lock" \
        "$stage/lamboot-kernel-hook" \
        "$stage/lamboot-monitor.py" \
        "$stage/lamboot-host-sampler" \
        "$stage/build-ovmf-vars.sh"
    # esp-deploy.sh is sourced, not executed, so it stays 0644 (matches the deb).

    # 3. Operator CLIs on PATH as relative symlinks into the staged tree. They
    #    must be symlinks (not copies) so each script's realpath-based sibling
    #    lookups resolve: lamboot-inspect imports the adjacent lamboot_inspect
    #    package, and sign-lamboot.sh finds sign-unlock/sign-lock next to it. The
    #    staged systemd units hardcode /usr/bin/lamboot-install, so /usr/bin (not
    #    /usr/sbin) is required.
    install -d "$pkgdir/usr/bin"
    ln -s ../share/lamboot/lamboot-install "$pkgdir/usr/bin/lamboot-install"
    ln -s ../share/lamboot/lamboot-inspect "$pkgdir/usr/bin/lamboot-inspect"
    ln -s ../share/lamboot/sign-lamboot.sh "$pkgdir/usr/bin/lamboot-sign"

    # 4. esp-deploy.sh at the literal canonical path lamboot-install checks first.
    #    Must be /usr/lib/lamboot, NOT $(get_libdir): on x86_64 that is /usr/lib64
    #    and lamboot-install does not look there.
    install -Dm0644 "$src/lib/esp-deploy.sh" "$pkgdir/usr/lib/lamboot/esp-deploy.sh"

    # 5. Pacman-native kernel hook. This is the one idiomatic exception to "the
    #    package wires no system integration": Arch hooks kernel events through
    #    /usr/share/libalpm/hooks, and the hook merely calls lamboot-install
    #    --update after a kernel-image change (GRUB ships 90-grub.hook the same
    #    way). A copy under /usr/share/lamboot/aur lets the archinstall plugin
    #    seed it into a chroot before this package is installed.
    install -Dm0644 "$srcdir/95-lamboot.hook" \
        "$pkgdir/usr/share/libalpm/hooks/95-lamboot.hook"
    install -Dm0644 "$srcdir/95-lamboot.hook" \
        "$stage/aur/95-lamboot.hook"

    # 6. Man page + shell completions to the standard discovery paths.
    install -Dm0644 "$src/man/man1/lamboot-inspect.1" \
        "$pkgdir/usr/share/man/man1/lamboot-inspect.1"
    install -Dm0644 "$src/completions/lamboot-inspect.bash" \
        "$pkgdir/usr/share/bash-completion/completions/lamboot-inspect"
    install -Dm0644 "$src/completions/_lamboot-inspect" \
        "$pkgdir/usr/share/zsh/site-functions/_lamboot-inspect"

    # 7. Documentation (the docs/ tree only; the top-level README/CHANGELOG/
    #    SECURITY are not staged into /usr/share/lamboot per the contract).
    install -d "$pkgdir/usr/share/doc/lamboot"
    # The -bin tarball is THINNED as of v0.16.5's three-track publish model
    # (stub README, no bundled docs/ tree), so copy docs/ only if it is present.
    # Without this guard, `cp -a "$src/docs/."` aborts package() on the thinned
    # tarball — which broke the v0.16.5 AUR build (caught 2026-07-06).
    [ -d "$src/docs" ] && cp -a "$src/docs/." "$pkgdir/usr/share/doc/lamboot/" || true
    install -Dm0644 "$src/README.md"    "$pkgdir/usr/share/doc/lamboot/README.md"
    install -Dm0644 "$src/CHANGELOG.md" "$pkgdir/usr/share/doc/lamboot/CHANGELOG.md"
    install -Dm0644 "$src/SECURITY.md"  "$pkgdir/usr/share/doc/lamboot/SECURITY.md"

    # 8. Licenses to the Arch discovery path. Both files for the dual license.
    install -Dm0644 "$src/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm0644 "$src/LICENSE-APACHE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

# vim: set ts=4 sw=4 et:

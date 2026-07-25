# Maintainer: Keith Raghubar <aur.archlinux.org.buckskin000@passmail.net>

pkgname=sysforge
pkgver=2.6.1
pkgrel=1
pkgdesc="Arch Linux build and maintenance suite for system setup and package management with compiler-optimized builds"
arch=('any')
url="https://github.com/KeithRaghubar/sysforge"
license=('MIT')
depends=(
    'python>=3.11'
    'git'
    'sudo'
    'gnupg'
    'base-devel'
)
makedepends=(
    'uv'
    'python-installer'
)
optdepends=(
    'bash-completion: bash tab completions'
    'ccache: compiler cache support'
    'sccache: Rust compiler cache support'
    'uv: required for bootstrap pipeline (configure stage)'
    'zsh: zsh shell support'
    'glow: in-shell markdown rendering for docs'
    'zsh-completions: additional zsh completions'
    'clang: required for the LLVM build profile and sysforge run toolchain --compiler=llvm'
    'lld: required for the optimized build profile (-fuse-ld=lld)'
    'llvm: required for sysforge run toolchain --compiler=llvm (PGO bootstrap)'
    'compiler-rt: required for sysforge run toolchain --compiler=llvm'
)
conflicts=('sysforge-git')
install=sysforge.install
backup=(
    'etc/sysforge/sysforge.toml'
    'etc/sysforge/profiles.toml'
    'etc/sysforge/packages.toml'
    'etc/sysforge/kernel.toml'
    'etc/sysforge/toolchain.toml'
)
# Maintainer release-signing key. Releases are GPG-signed (signed tag + detached
# signature of the release tarball, uploaded to the GitHub release by
# tools/release.sh); makepkg verifies the .asc below against this fingerprint.
# REPLACE the sentinel with the real 40-hex fingerprint (gpg --fingerprint);
# tools/release.sh refuses to publish while the sentinel is present.
validpgpkeys=('23774499080F9288FEFB49CE7AAE22E6E1B4B22C')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/sysforge-$pkgver.tar.gz.asc")
sha256sums=('026b1538f0efb003c10050bca25a99e0f05a34c8151c1cc8aee2aeccf06ef24c'
            'SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    uv build --wheel
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Man page
    install -Dm644 man/sysforge.1 "$pkgdir/usr/share/man/man1/sysforge.1"

    # Shell completions (bash + zsh; both shells are optdeps)
    install -Dm644 completions/sysforge.bash \
        "$pkgdir/usr/share/bash-completion/completions/sysforge"
    install -Dm644 completions/_sysforge \
        "$pkgdir/usr/share/zsh/site-functions/_sysforge"

    # Default config files
    local _conf="$pkgdir/etc/sysforge"
    install -Dm644 etc/sysforge/sysforge.toml               "$_conf/sysforge.toml"
    install -Dm644 etc/sysforge/profiles.toml               "$_conf/profiles.toml"
    install -Dm644 etc/sysforge/packages.toml               "$_conf/packages.toml"
    install -Dm644 etc/sysforge/kernel.toml                 "$_conf/kernel.toml"
    install -Dm644 etc/sysforge/toolchain.toml              "$_conf/toolchain.toml"

    # bootstrap.toml is per-host (device, hostname, passwords) — ship as an
    # example template under /usr/share so iso-install.sh can detect a true
    # prior run instead of always seeing the package-installed default.
    install -Dm644 etc/sysforge/bootstrap.toml \
        "$pkgdir/usr/share/sysforge/bootstrap.toml.example"

    # The sysforge group owns sysforge's writable runtime dirs so the
    # unprivileged build user (a member) can write state and the PGO cache
    # across runs. systemd-sysusers creates it before systemd-tmpfiles runs.
    install -Dm644 /dev/null "$pkgdir/usr/lib/sysusers.d/sysforge.conf"
    printf 'g sysforge -\n' > "$pkgdir/usr/lib/sysusers.d/sysforge.conf"

    # State directory (pipeline state, build state, logs) + sentinel subdir
    # consumed by `sysforge update` from the libalpm hooks below.
    # /var/cache/sysforge holds the regenerable PGO profdata store, written by
    # the unprivileged toolchain build. All owned root:sysforge with setgid
    # (2775) so group members can write and new subdirs inherit the group —
    # the single ownership model shared with primitives/fs_provision.py.
    install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/sysforge.conf"
    {
        printf 'd /var/lib/sysforge 2775 root sysforge -\n'
        printf 'd /var/lib/sysforge/sentinels 2775 root sysforge -\n'
        printf 'd /var/cache/sysforge 2775 root sysforge -\n'
        printf 'd /var/cache/sysforge/llvm-pgo 2775 root sysforge -\n'
    } > "$pkgdir/usr/lib/tmpfiles.d/sysforge.conf"

    # Pacman PostTransaction hooks: kernel/toolchain reminders +
    # build-state staleness signal consumed by `sysforge update`.
    install -Dm644 etc/pacman.d/hooks/sysforge-kernel.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-kernel.hook"
    install -Dm644 etc/pacman.d/hooks/sysforge-toolchain.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-toolchain.hook"
    install -Dm644 etc/pacman.d/hooks/sysforge-buildstate.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-buildstate.hook"
    install -Dm644 etc/pacman.d/hooks/sysforge-artifacts.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-artifacts.hook"
    install -Dm755 tools/pacman-hook-helper.sh \
        "$pkgdir/usr/lib/sysforge/pacman-hook-helper.sh"
}

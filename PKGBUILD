# Maintainer: Keith Raghubar <aur.archlinux.org.buckskin000@passmail.net>

pkgname=sysforge
pkgver=1.2.0
pkgrel=1
pkgdesc="All-in-one Arch Linux helper for system setup and package management with compiler-optimized builds"
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
backup=(
    'etc/sysforge/sysforge.toml'
    'etc/sysforge/profiles.toml'
    'etc/sysforge/packages.toml'
    'etc/sysforge/kernel.toml'
    'etc/sysforge/toolchain.toml'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c2c6777d9df13d0c5d8fb88ec6ba08887a249c31bc6b197398024a48e8a25a0')

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

    # State directory (pipeline state, build state, logs) + sentinel subdir
    # consumed by `sysforge update` from the libalpm hooks below.
    install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/sysforge.conf"
    {
        printf 'd /var/lib/sysforge 0777 root root -\n'
        printf 'd /var/lib/sysforge/sentinels 0777 root root -\n'
    } > "$pkgdir/usr/lib/tmpfiles.d/sysforge.conf"

    # Pacman PostTransaction hooks: kernel/toolchain reminders +
    # build-state staleness signal consumed by `sysforge update`.
    install -Dm644 etc/pacman.d/hooks/sysforge-kernel.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-kernel.hook"
    install -Dm644 etc/pacman.d/hooks/sysforge-toolchain.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-toolchain.hook"
    install -Dm644 etc/pacman.d/hooks/sysforge-buildstate.hook \
        "$pkgdir/usr/share/libalpm/hooks/sysforge-buildstate.hook"
    install -Dm755 tools/pacman-hook-helper.sh \
        "$pkgdir/usr/lib/sysforge/pacman-hook-helper.sh"
}

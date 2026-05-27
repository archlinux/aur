# Maintainer: prietus <prietus@live.com>
pkgname=aur-guard-bin
_pkgname=aur-guard
pkgver=0.1.7
pkgrel=1
pkgdesc="Security scanner for AUR PKGBUILDs — detects malicious patterns before makepkg runs (precompiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/aur-guard"
license=('MIT')
depends=('gcc-libs' 'pacman')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
install="${_pkgname}.install"

_release="${url}/releases/download/v${pkgver}"

source_x86_64=("${_release}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${_release}/${_pkgname}-${pkgver}-aarch64-linux.tar.gz")

# IMPORTANT: replace these SKIPs with the sha256 of each release tarball.
# The release pipeline ships a `.sha256` file next to each tarball — copy
# from there, or run `updpkgsums` after publishing the GitHub release.
# Leaving them as SKIP defeats the integrity check and would even be flagged
# by aur-guard itself (rule AG080).
sha256sums_x86_64=('8fc51f7f4e65fc8a69f641df071bf5ebbbd7bb87212afd2448a40f1a42a9b108')
sha256sums_aarch64=('98071a4e9d9a2fd41b91dc7f6d18189926249886db8281b30ee706edec3196d6')

package() {
    local stage="${_pkgname}-${pkgver}-${CARCH}-linux"
    cd "$stage"

    install -Dm0755 aur-guard "$pkgdir/usr/bin/aur-guard"

    # System-shipped pacman hook (NOT /etc/pacman.d/hooks/, that path is for admin overrides).
    install -d "$pkgdir/usr/share/libalpm/hooks"
    sed 's|/usr/local/bin/aur-guard|/usr/bin/aur-guard|g' hooks/aur-guard.hook \
        > "$pkgdir/usr/share/libalpm/hooks/aur-guard.hook"
    chmod 0644 "$pkgdir/usr/share/libalpm/hooks/aur-guard.hook"

    # makepkg shim — shipped but NOT activated automatically. /usr/local/bin
    # is the admin's territory; the .install scriptlet tells the user how to
    # enable it manually.
    install -d "$pkgdir/usr/share/aur-guard"
    sed 's|/usr/local/bin/aur-guard|/usr/bin/aur-guard|g' scripts/makepkg \
        > "$pkgdir/usr/share/aur-guard/makepkg-shim"
    chmod 0755 "$pkgdir/usr/share/aur-guard/makepkg-shim"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

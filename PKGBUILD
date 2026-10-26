# Maintainer: AkitaOnRails <boss@akitaonrails.com>

# NOTE: pkgver/pkgrel and the sha256sums below are PLACEHOLDERS.
# `.github/workflows/release.yml` copies this file at publish time and
# rewrites all of them from the release tag before pushing to the AUR:
#
#     sed -i -e "s/^pkgver=.*/pkgver=${version}/" \
#            -e "s/^pkgrel=.*/pkgrel=1/" ...
#
# So the value here never reaches a user, and bumping it by hand fixes
# nothing while going stale again at the next release. Check the published
# package instead:
#
#     curl -s 'https://aur.archlinux.org/rpc/v5/info?arg[]=ai-memory'
#
pkgname=ai-memory-bin
_pkgname=ai-memory
pkgver=3.2.6
pkgrel=1
pkgdesc="Local-first long-term memory MCP server for AI coding agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://aimemory.sh"
_repo="https://github.com/akitaonrails/ai-memory"
license=('MIT')
depends=('ca-certificates' 'gcc-libs' 'glibc')
optdepends=(
    'systemd: run ai-memory as a system or user service'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
backup=('etc/ai-memory/config.toml' 'etc/ai-memory/env')
install=ai-memory.install
options=('!strip' '!debug')

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_repo/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums_x86_64=('3594abfa8e026958299c1887e323f9d0e847aa25c3f12b78f292a6c121256f4c')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_repo/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_aarch64=('39469de3892ddecd57cce3cfc83eee78be5ac1b732df7be78c1c813a110566b9')

package() {
    install -Dm0755 ai-memory "$pkgdir/usr/bin/ai-memory"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm0644 docs/install.md "$pkgdir/usr/share/doc/$_pkgname/install.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -dm0755 "$pkgdir/usr/share/ai-memory"
    cp -a hooks "$pkgdir/usr/share/ai-memory/"

    install -Dm0644 crates/ai-memory-cli/templates/config.default.toml "$pkgdir/etc/ai-memory/config.toml"
    install -Dm0640 packaging/env/ai-memory.env "$pkgdir/etc/ai-memory/env"
    install -Dm0644 packaging/systemd/ai-memory.service "$pkgdir/usr/lib/systemd/system/ai-memory.service"
    install -Dm0644 packaging/systemd/ai-memory-user.service "$pkgdir/usr/lib/systemd/user/ai-memory.service"
    install -Dm0644 packaging/sysusers/ai-memory.conf "$pkgdir/usr/lib/sysusers.d/ai-memory.conf"
    install -Dm0644 packaging/tmpfiles/ai-memory.conf "$pkgdir/usr/lib/tmpfiles.d/ai-memory.conf"
}

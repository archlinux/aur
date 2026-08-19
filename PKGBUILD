# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-memory-bin
_pkgname=ai-memory
pkgver=1.29.0
pkgrel=1
pkgdesc="Local-first long-term memory MCP server for AI coding agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/ai-memory"
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

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums_x86_64=('c666fa4ec778673ae995cd8aa4489b6184c7a3dc220a2c4e1c18792eda1321f1')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_aarch64=('828cb63f697f8b773d4e6c41c38d0d850310afed04f37479bb48e3a11969d689')

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

pkgname=ols-bin
pkgrel=1
pkgdesc="Open Linux Shell: CLI utilities toolkit"
arch=('x86_64')
url="https://github.com/artemkolba321-spec/OLS"
license=('GPL')
depends=('bash' 'wget' 'tree' 'curl' 'lua' 'jq' 'make' 'openssl')

fulltag=$(<.version)           # пример: v0.5.0-lts
pkgver=${fulltag#v}            # убираем 'v' → 0.5.0-lts
pkgver=${pkgver%-lts}           # убираем '-lts' → 0.5.0

source=("https://github.com/artemkolba321-spec/OLS/archive/refs/tags/${fulltag}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir" || exit 1

    tar -xzf "${fulltag}.tar.gz" -C "$srcdir"
    cd "$srcdir/OLS-${fulltag#v}" || exit 1

    make install

    install -d "$pkgdir/etc/profile.d"
    cat > "$pkgdir/etc/profile.d/ols-init.sh" <<EOF
export PATH="\$HOME/.local/share/OLS/bin:\$PATH"
source "\$HOME/.local/share/OLS/lib/env.sh"
EOF
    chmod 755 "$pkgdir/etc/profile.d/ols-init.sh"
}
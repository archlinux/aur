# Maintainer: Yorukai <33402703+yorukai@users.noreply.github.com>

pkgname=essentials-unpackd-git
_pkgname=Essentials-Unpackd
pkgver=3.0.0.r114.ge94475a
pkgrel=1
pkgdesc="Tool for unpacking and repacking Pokémon Essentials data files"
arch=('any')
url="https://github.com/yorukai/Essentials-Unpackd"
license=('MIT')

depends=('ruby' 'ruby-bundler' 'ruby-optimist' 'ruby-scanf')
makedepends=('git')

provides=('essentials-unpackd')
conflicts=('essentials-unpackd')

source=("git+https://github.com/yorukai/Essentials-Unpackd.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf '%s.r%s.g%s\n' \
        "$(ruby -Ilib -e 'require "unpackd/version"; puts Unpackd::VERSION')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    bundle config set --local path vendor/bundle
    bundle config set --local without 'development'
}

build() {
    cd "$_pkgname"

    bundle install --jobs "$(nproc)"
}

package() {
    cd "$_pkgname"

    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -a . "$pkgdir/usr/share/$pkgname/"

    rm -rf "$pkgdir/usr/share/$pkgname/.git"
    rm -f "$pkgdir/usr/share/$pkgname/.bundle/config"

    install -dm755 "$pkgdir/usr/bin"

    cat > "$pkgdir/usr/bin/essentials-unpackd" <<'EOF'
#!/bin/sh
exec ruby -rbundler/setup \
    -I/usr/share/essentials-unpackd-git/lib \
    /usr/share/essentials-unpackd-git/bin/unpackd "$@"
EOF

    chmod 755 "$pkgdir/usr/bin/essentials-unpackd"

    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

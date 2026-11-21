# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=artex-bin
_pkgname=artex
pkgver=0.7.0
pkgrel=1
pkgdesc='AI autonomous penetration testing system with a web UI (server, skills and browser capture extension)'
arch=('x86_64' 'aarch64')
url='https://github.com/BaaRai/ARTEX'
license=('AGPL-3.0-only')
optdepends=('postgresql: local database (a remote PostgreSQL works too)'
            'python: helper scripts used by some skills'
            'nodejs: helper scripts used by some skills')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/artex/config.json')
options=('!strip' '!debug')
# Release zip: static binary (web UI embedded), skills, example config.
# Source tarball: the browser extension, which the zip lacks.
source=("$_pkgname-$pkgver-src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'artex.sh'
        'artex.service'
        'artex.sysusers'
        'artex.tmpfiles')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.zip")
sha256sums=('2f92d0c6ed438c2610d92840084a25c406972cd50215f0069ea9487a3a5f0605'
            '204249b0836b13ce4baf63cb7ccadf5257b47e8c0e6006d199312c168741b81c'
            '53dafc3edd0b0401533372e27ab396db1f487655082c99d47144cc9d9369b6c1'
            '1824cf7e53ae4ca553bf00acb32a6dbd0160dc0cb4714548233135e7d9d8a57c'
            '947f7cb4e0fdf5e66bbcb5630a91bfae7f0f3f0a9226efee255c06398ce7185d')
sha256sums_x86_64=('b2caab73196aa3b63352edc75ae267bc41688b8f5ff8503b6d042f2bbc6f002a')
sha256sums_aarch64=('ab8557e6e41838395a1292fcf136841428080ec43d502daeffa901462be0b68e')

package() {
    local _arch
    case $CARCH in
        x86_64) _arch=amd64 ;;
        aarch64) _arch=arm64 ;;
    esac
    local _rel="$srcdir/$_pkgname-$pkgver-linux-$_arch"
    local _src="$srcdir/ARTEX-$pkgver"

    # The binary finds skills/ next to itself; config, data and keys come from the
    # wrapper (per user) or artex.service (system), never from /usr.
    install -Dm755 "$_rel/artex" "$pkgdir/usr/lib/artex/artex"
    cp -r --no-preserve=ownership "$_rel/skills" "$pkgdir/usr/lib/artex/"
    install -Dm755 artex.sh "$pkgdir/usr/bin/artex"

    # Upstream's example points skill_dir at /opt; empty means the bundled skills.
    sed 's|"skill_dir": "/opt/artex/skills"|"skill_dir": ""|' "$_rel/config.example.json" > config.json
    grep -q '"skill_dir": ""' config.json || { error 'skill_dir not rewritten in config.example.json'; return 1; }
    install -Dm644 config.json "$pkgdir/etc/artex/config.json"

    install -Dm644 artex.service "$pkgdir/usr/lib/systemd/system/artex.service"
    install -Dm644 artex.sysusers "$pkgdir/usr/lib/sysusers.d/artex.conf"
    install -Dm644 artex.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/artex.conf"

    install -Dm644 -t "$pkgdir/usr/share/artex/extension" "$_src"/extension/*
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$_rel/README.md" "$_rel/config.example.json"
}

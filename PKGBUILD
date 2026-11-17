# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=artex-bin
_pkgname=artex
pkgver=0.6.0
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
sha256sums=('cc785f54e0802812c0a47a78eaa88f8f3f7d8b40ebfc7a63bf2ba2dd199d0c83'
            '204249b0836b13ce4baf63cb7ccadf5257b47e8c0e6006d199312c168741b81c'
            '53dafc3edd0b0401533372e27ab396db1f487655082c99d47144cc9d9369b6c1'
            '1824cf7e53ae4ca553bf00acb32a6dbd0160dc0cb4714548233135e7d9d8a57c'
            '947f7cb4e0fdf5e66bbcb5630a91bfae7f0f3f0a9226efee255c06398ce7185d')
sha256sums_x86_64=('4ad3826b2ba2c0315457e35cbac577067048b708f8d1d0669d8d728ea9755fdc')
sha256sums_aarch64=('48778ec3de4e742c117cef57dce5e4067fb2649eeddd49f025d002765f3d1401')

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

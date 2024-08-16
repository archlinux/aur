# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: xerus <27f at pm dot me>
# Contributor: gudzpoz <gudzpoz ant live dot com>

pkgname=akkoma-git
_pkgname=akkoma
pkgver=3.13.2
pkgrel=1
pkgdesc='Akkoma is faster-paced fork of Pleroma (devel version)'
url='https://akkoma.dev/AkkomaGang/akkoma'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(any)
makedepends=(elixir erlang cmake rebar git)
depends=(ncurses file libxcrypt-compat openssl-1.1)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
provides=("$_pkgname")
backup=('etc/akkoma/config.exs')
install=akkoma.install
source=('akkoma.sysusers'
        'akkoma.tmpfiles'
        'akkoma.service'
        "git+${url}.git")
sha256sums=('0247ee5cc24049ebc37a00634aad8ed9a44d0f9a399a1373284375f5c861a089'
            'ae5bd0e7ee501c4535a52650574a69ca0ba9b60315ec3b7c8a1d98a8246cea6b'
            '83a90cf08dbe715a5c28545c85faba6fe9a76e0808ce8aa0aa7b54b718e35beb'
            'SKIP')
pkgver() {
    cd $_pkgname
    printf "$(cat mix.exs | grep 'version:' | sed 's/"/ /g' | awk '{print $3}').%s" "$(TZ=UTC git log --no-walk --pretty='%cd' --decorate=full --date=format-local:%Y.%m.%d | head -n 1)"
}
build() {
    cd $_pkgname
    mix local.hex --force
    mix local.rebar --force
    mix deps.get
    mix deps.get --only prod
}
package() { 
    cd "$srcdir"
    install -Dm 755 akkoma.sysusers "${pkgdir}/usr/lib/sysusers.d/akkoma.conf"
    install -Dm 755 akkoma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/akkoma.conf"
    install -Dm 755 akkoma.service "${pkgdir}/usr/lib/systemd/system/akkoma.service"
    install -Dm 644 $srcdir/$_pkgname/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


    mkdir -p $pkgdir/opt/akkoma
    cd ${_pkgname}
    mix release --path $pkgdir/opt/akkoma
}



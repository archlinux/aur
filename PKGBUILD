# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: xerus <27f at pm dot me>
# Contributor: gudzpoz <gudzpoz ant live dot com>

pkgname=akkoma-git
_pkgname=akkoma
pkgver=3.10.4
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
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b6e6ad0f2c3caea38a30dddb303728271d6b56c13a2f4d82959b871844811f4c'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
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



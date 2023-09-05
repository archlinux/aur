# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: xerus <27f at pm dot me>
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=akkoma
pkgver=3.10.4
pkgrel=1
pkgdesc='Akkoma is a faster-paced fork of Pleroma'
url='https://akkoma.dev/AkkomaGang/akkoma/'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(any)
makedepends=(elixir erlang cmake rebar git)
depends=(ncurses file libxcrypt-compat)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
backup=('etc/akkoma/config.exs')
install=akkoma.install
source=('akkoma.sysusers'
        'akkoma.tmpfiles'
        'akkoma.service'
        "git+${url}.git#tag=v$pkgver")
sha256sums=('0247ee5cc24049ebc37a00634aad8ed9a44d0f9a399a1373284375f5c861a089'
            'ae5bd0e7ee501c4535a52650574a69ca0ba9b60315ec3b7c8a1d98a8246cea6b'
            '54f940b0b59c046f2b8892dcd7156ad9314f7ce2b1d9cce9dfab4cc1baa001f0'
            'SKIP')
build() {
    cd "${pkgname}"
    mix local.hex --force
    mix local.rebar --force
    mix deps.get
    mix deps.get --only prod
    mix deps.update ssl_verify_fun ecto
}
package() { 
    cd "$srcdir"
    install -Dm 755 akkoma.sysusers "${pkgdir}/usr/lib/sysusers.d/akkoma.conf"
    install -Dm 755 akkoma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/akkoma.conf"
    install -Dm 755 akkoma.service "${pkgdir}/usr/lib/systemd/system/akkoma.service"
    install -Dm 644 $srcdir/$pkgname/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p $pkgdir/opt/akkoma
    cd $pkgname
    mix release --path $pkgdir/opt/akkoma 
}



# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: xerus <27f at pm dot me>
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=pleroma
pkgver=2.5.0
pkgrel=1
pkgdesc='A microblogging server software that can federate other servers that support ActivityPub'
url='https://git.pleroma.social/pleroma/pleroma'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(any)
makedepends=(elixir erlang cmake rebar git)
depends=(ncurses file libxcrypt-compat openssl-1.1)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
backup=('etc/pleroma/config.exs')
install=pleroma.install
source=('pleroma.sysusers'
        'pleroma.tmpfiles'
        'pleroma.service'
        'COPYING'
        "git+${url}.git#tag=v$pkgver")
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b6e6ad0f2c3caea38a30dddb303728271d6b56c13a2f4d82959b871844811f4c'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
            'e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104'
            'SKIP')
build() {
    cd "${pkgname}"
    mix local.hex --force
    mix local.rebar --force
    mix deps.get
    mix deps.get --only prod
}
package() { 
    cd "$srcdir"
    install -Dm 755 pleroma.sysusers "${pkgdir}/usr/lib/sysusers.d/pleroma.conf"
    install -Dm 755 pleroma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pleroma.conf"
    install -Dm 755 pleroma.service "${pkgdir}/usr/lib/systemd/system/pleroma.service"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    mkdir -p $pkgdir/opt/pleroma
    cd $pkgname
    mix release --path $pkgdir/opt/pleroma 
}



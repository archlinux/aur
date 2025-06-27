# Maintainer:  shtrophic <aur at shtrophic dot net>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: xerus <27f at pm dot me>
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=akkoma
pkgver=3.15.2
pkgrel=1
pkgdesc='faster-paced fork of Pleroma'
url='https://akkoma.dev/AkkomaGang/akkoma'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(any)
makedepends=(base-devel asdf-vm cmake git unzip unixodbc)
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
            '790df34a2c2fe838696f15bf190221758b5cad74da7f528e5698614fcb332d52'
            'f5c31b0448e4a057660f28fcb87f5e7937893cee5911431d0558fba92cda143e')

# c.f. https://akkoma.dev/AkkomaGang/akkoma/src/commit/16d7d612ffe21d3c83606dadb6ccfdf0217184ee/.woodpecker/build-amd64.yml#L41

prepare() {
    export ASDF_DATA_DIR=$srcdir/asdf
    export PATH=$ASDF_DATA_DIR/shims:$PATH
    export MIX_ENV=prod
    mkdir -p $ASDF_DATA_DIR

    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
    asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

    export KERL_CONFIGURE_OPTIONS="--enable-threads --enable-shared-zlib --enable-ssl=dynamic-ssl-lib --with-odbc=/var/lib/pacman/local/unixodbc-$(pacman -Q unixodbc | cut -d' ' -f2)"
    asdf install erlang 26.0.2
    asdf install elixir 1.15.4

    asdf set erlang 26.0.2
    asdf set elixir 1.15.4

    cd $pkgname
    mix deps.get --only prod
}

build() {
    cd $pkgname
    mix release --path release
}

package() { 
    install -Dm 755 akkoma.sysusers "${pkgdir}/usr/lib/sysusers.d/akkoma.conf"
    install -Dm 755 akkoma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/akkoma.conf"
    install -Dm 755 akkoma.service "${pkgdir}/usr/lib/systemd/system/akkoma.service"
    install -Dm 644 "$pkgname/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "$pkgdir/opt/akkoma"
    cp -r "$pkgname/release"/* "$pkgdir/opt/akkoma"
}



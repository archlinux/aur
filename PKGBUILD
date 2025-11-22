# Maintainer:  shtrophic <aur at shtrophic dot net>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Guoyi Zhang <myname at malacology dot net>
# Contributor: xerus <27f at pm dot me>
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=akkoma
pkgver=3.16.0
pkgrel=1
_erlangver=28.0.1
_elixirver=1.19.3
pkgdesc='faster-paced fork of Pleroma'
url='https://akkoma.dev/AkkomaGang/akkoma'
license=('AGPL-3.0-or-later' 'CC-BY-4.0' 'CC-BY-SA-4.0')
arch=(x86_64)
makedepends=(base-devel asdf-vm java-environment mesa glu wxwidgets-gtk3 cmake git unzip unixodbc)
depends=(glibc gcc-libs zlib openssl bash ncurses file)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
install=akkoma.install
source=('akkoma.sysusers'
        'akkoma.tmpfiles'
        'akkoma.service'
	'pleroma_ctl.patch'
        "git+${url}.git#tag=v$pkgver")
sha256sums=('712bc7d7bb1c1a719e57ceb55a82f33479de5db9a2d5a128b13ec646cb85ddd4'
            'c3eb1099f605f84640fbc95d86594030d5b7886b90cf3408cfd38dd42bb0b82a'
            '4905a5b08a317366693a6b9e6580977e48dcc4932eef6b181de644fd3db62ef2'
            '16966b8c405892a36e00acf9ecdec6710362fa3659c02e90e844a09403ac6869'
            'SKIP')

# c.f. https://akkoma.dev/AkkomaGang/akkoma/src/commit/16d7d612ffe21d3c83606dadb6ccfdf0217184ee/.woodpecker/build-amd64.yml#L41

_setenv() {
    export ASDF_DATA_DIR=$srcdir/asdf
    export PATH=$ASDF_DATA_DIR/shims:$PATH
    export MIX_ENV=prod
    export MIX_HOME=$srcdir/mix
    export HEX_HOME=$srcdir/hex
}

prepare() {
    _setenv
    mkdir -p $ASDF_DATA_DIR $MIX_HOME $HEX_HOME

    git -C akkoma apply < pleroma_ctl.patch

    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
    asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

    export KERL_CONFIGURE_OPTIONS="--enable-threads --enable-shared-zlib --enable-ssl=dynamic-ssl-lib --with-odbc=/var/lib/pacman/local/unixodbc-$(pacman -Q unixodbc | cut -d' ' -f2)"
    asdf install erlang $_erlangver
    asdf install elixir $_elixirver

    asdf set erlang $_erlangver
    asdf set elixir $_elixirver

    cd $pkgname
    mix deps.get --only prod
}

build() {
    _setenv

    # Remove broken example file in the SMTP dependency
    rm -f $srcdir/akkoma/deps/gen_smtp/src/smtp_server_example.erl

    cd $pkgname
    mix release --overwrite --path release
}

package() { 
    install -Dm 755 akkoma.sysusers "$pkgdir/usr/lib/sysusers.d/akkoma.conf"
    install -Dm 755 akkoma.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/akkoma.conf"
    install -Dm 755 akkoma.service "$pkgdir/usr/lib/systemd/system/akkoma.service"
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/"{COPYING,AGPL-3,CC-BY-4.0,CC-BY-SA-4.0}

    mkdir -p "$pkgdir/opt/akkoma" "$pkgdir/usr/bin"
    cp -r "$pkgname/release"/* "$pkgdir/opt/akkoma"
    chmod 0750 "$pkgdir/opt/akkoma"
    cat << EOF > "$pkgdir/usr/bin/akkoma-ctl"
#!/usr/bin/bash

if [ \$USER != akkoma ]; then
    echo "must be run as akkoma user" 1>&2
    exit 1
fi

cd /opt/akkoma && exec bin/pleroma_ctl \$@
EOF
    chmod +x "$pkgdir/usr/bin/akkoma-ctl"
}



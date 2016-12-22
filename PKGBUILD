# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname='vector-web'
_upstream_version='0.9.4'
pkgver="${_upstream_version//-/_}" # sometimes upstream uses hyphens; we can't
pkgrel=1
pkgdesc='A glossy Matrix collaboration client for the web'
arch=('any')
url="https://github.com/vector-im/$pkgname"
license=('Apache')
makedepends=('git' 'npm')
checkdepends=('phantomjs' 'fontconfig')
optdepends=('caddy: web server'
            'matrix-synapse: matrix homeserver')
install="$pkgname.install"
changelog="CHANGELOG.md"
source=("riot-web-v$_upstream_version.tar.gz::https://github.com/vector-im/$pkgname/archive/v$_upstream_version.tar.gz"
        'Caddyfile.example')
sha256sums=('0067eb87cfdc6d065cb499b42106e49da36e4d167f54ccf920cbf9987ff600af'
            '73b20f2c48eec6a800cce1364db80b4298f0df89df8faa339a1a76b6f1615add')
_unpacked_dirname="riot-web-$_upstream_version"

build() {
    cd "$srcdir/$_unpacked_dirname"

    msg2 "Installing dependencies with npm"
    npm install

    msg2 "Cleaning build directory"
    npm run clean

    msg2 "Building $pkgname"
    npm run build

    msg2 "Populating version file"
    echo "v$_upstream_version" > "$srcdir/$_unpacked_dirname/webapp/version"
}

check() {
    cd "$srcdir/$_unpacked_dirname"

    unset QT_QPA_PLATFORM # https://github.com/ariya/phantomjs/issues/14061

    msg2 "Running test suite"
    npm run test
}

package() {
    msg2 "Creating directory structure"
    mkdir -p "$pkgdir"/{usr/share,etc}/webapps/"$pkgname"

    msg2 "Installing public assets"
    cp -RL "$srcdir/$_unpacked_dirname"/webapp/* "$pkgdir/usr/share/webapps/$pkgname"

    msg2 "Copying sample config"
    cp "$srcdir/$_unpacked_dirname/config.sample.json" "$pkgdir/etc/webapps/$pkgname/config.sample.json"

    msg2 "Creating symlink from public dir to /etc/webapps/$pkgname/config.json"
    ln -s "/etc/webapps/$pkgname/config.json" "$pkgdir/usr/share/webapps/$pkgname/config.json"

    msg2 "Copying sample Caddyfile"
    cp "$srcdir/Caddyfile.example" "$pkgdir/etc/webapps/$pkgname"
}

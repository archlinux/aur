# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=mattermost
pkgver=4.3.0
pkgrel=1
pkgdesc='Open source Slack-alternative in Golang and React'
arch=('i686' 'x86_64')

url='http://mattermost.org'
# The official releases are under MIT, while the ones compiled from the source
# code in /platform must be under AGPL v3.
# src.: https://pre-release.mattermost.com/core/pl/cj61agrh5jgmukxxahgdwfx5ww
# src.: https://www.mattermost.org/licensing
license=('MIT')

makedepends=('git' 'go' 'libpng12' 'npm' 'yarn')
backup=('etc/webapps/mattermost/config.json')
optdepends=(
    'mariadb: SQL server storage'
    'percona-server: SQL server storage'
    'postgresql: SQL server storage'
)

source=(
    "mattermost-server-${pkgver}.tar.gz::https://github.com/mattermost/mattermost-server/archive/v${pkgver}.tar.gz"
    "mattermost-webapp-${pkgver}.tar.gz::https://github.com/mattermost/mattermost-webapp/archive/v${pkgver}.tar.gz"
    'mattermost.service'
    'mattermost.sh'
    'tmpfile.conf'
    'user.conf'
)
sha512sums=(
    'e74bbe40106faf82074a3a333c52046cb62e6890f51e37061423f89924cdac4bb2885590b303047b6f873c3e25d2cfa90e41c78e345a87add08a5d4ebf0105ad'
    '1ea624bae2c4e451b55cf258d6dcba16b8b0bf494537fc061b6f497c61a950f0facdb884903c8818d85e1330c8a27f48b6ea56aa376ca099fe21b5b88f9cb172'
    '3e3d46dc7778be256da9a366ec96cde684fcb07732d0adfd40ea00d6ec61a161a9d7e784f7773d34e4f058e6919b13053ac228255a05f175e7ce20538f07ec93'
    '5fe6c343e9739b12f8ea9390dafd729fa9f980978bbc0fa7eb6a2eb2d437929078d3efede23c28a6b399c407b8b5e92755169a468462088de0eb148b360acc4b'
    'e3ffcf4b86e2ecc7166c1abf92cd4de23d81bad405db0121e513a8d81fea05eec9dd508141b14b208c4c13fbc347c56f01ed91326faa01e872ecdedcc18718f9'
    'b95bf2c0d840d0e85baebc1051c872056fa4990d263334fecc7b11d96085cb65a69dd866f18889e209336028f17c02152c13a92d2be1c21848939f22203439f0'
)

prepare() {
    # cp cannot copy from a symbolic link to the destination link itself
    # a symbolic link located outside the first symbolic link folder location.
    # e.g.
    # mattermost-server is a symlink
    # mattermost-webapp is a symlink
    # we are in the folder matttermost-server and we want to execute 
    # cp -RL ../mattermost-webapp/dist/* dist/mattermost/client/
    # this command will fail with
    # cp: cannot stat '../mattermost-webapp/dist/*': No such file or directory
    mv mattermost-server-${pkgver} mattermost-server
    mv mattermost-webapp-${pkgver} mattermost-webapp

    mkdir -p src/github.com/mattermost
    cd src/github.com/mattermost
    # Remove previous platform folder if any previous clone was effective
    rm -f mattermost-server
    rm -f mattermost-webapp
    # Even if we do not have a repository called platform any more, creating
    # this directory structure is needed as the Mattermost Go namespaces are
    # still named this way.
    ln -s "$srcdir"/mattermost-server mattermost-server
    ln -s "$srcdir"/mattermost-webapp mattermost-webapp
    cd mattermost-server

    # We are not using docker, no need to stop it.
    sed -r -i Makefile \
        -e 's/^clean: stop-docker/clean:/'

    # Enforce build hash to Arch Linux (Enterprise hash is already set to
    # none), instead of the official git hash value.
    sed -r -i Makefile \
        -e 's/^(\s*)BUILD_HASH(_ENTERPRISE)? =.*/\1BUILD_HASH\2 = Arch Linux/' \
        -e 's/-X (.*)(\$\(BUILD_HASH(_ENTERPRISE)?\))(.*)/-X '\''\1\2'\''\4/'

    # The configuration isn't available at this time yet, modify the default.
    sed -r -i build/release.mk \
        -e 's/\$\(DIST_PATH\)\/config\/config.json/\$\(DIST_PATH\)\/config\/default.json/'

    # Remove platform specific lines from the Makefile from the line beginning
    # with that statement to the end of file (we do not care of the additional
    # file copy, nor the tar compression defined below the file).
    sed '/# ----- PLATFORM SPECIFIC -----/,//d' -i ./build/release.mk
}

build() {
    # No need to build mattermost-webapp as the server is taking care of this
    # step via its build-client make instruction.

    cd "$srcdir"/src/github.com/mattermost/mattermost-server
    # Prevent the build to crash when some dependencies are not met or
    # outdated. This clean the webapp as well (cf. mattermost-server/Makefile,
    # clean target).
    make clean
    GOPATH="$srcdir" BUILD_NUMBER=$pkgver-$pkgrel make build-linux
    GOPATH="$srcdir" BUILD_NUMBER=$pkgver-$pkgrel make build-client
    GOPATH="$srcdir" BUILD_NUMBER=$pkgver-$pkgrel make package
}

package() {
    cd "$srcdir"/src/github.com/mattermost/mattermost-server

    install -dm755 \
        "$pkgdir"/usr/share/webapps \
        "$pkgdir"/var/log/$pkgname \
        "$pkgdir"/etc/webapps \
        "$pkgdir"/usr/share/{licenses,doc}/$pkgname

    cp -a dist/mattermost "$pkgdir"/usr/share/webapps/$pkgname

    cd "$pkgdir"/usr/share/webapps/$pkgname

    rm -rf logs
    ln -s /var/log/$pkgname logs

    cp config/default.json config/config.json
    mv config "$pkgdir"/etc/webapps/$pkgname
    ln -s /etc/webapps/$pkgname config

    sed -e 's@"Directory": ".*"@"Directory": "/var/lib/mattermost/"@g' \
        -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
        -i "$pkgdir"/etc/webapps/$pkgname/config.json

    # When MIT license, the one bundled with the package must always be copied
    # on the system.
    # src.: https://wiki.archlinux.org/index.php/PKGBUILD#license
    mv NOTICE.txt README.md MIT-COMPILED-LICENSE.md "$pkgdir"/usr/share/doc/$pkgname

    cd "$srcdir"
    install -Dm755 bin/platform "$pkgdir"/usr/share/webapps/$pkgname/bin/platform
    install -Dm755 mattermost.sh "$pkgdir"/usr/bin/mattermost
    install -Dm644 mattermost.service "$pkgdir"/usr/lib/systemd/system/mattermost.service
    install -Dm644 user.conf "$pkgdir"/usr/lib/sysusers.d/mattermost.conf
    install -Dm644 tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/mattermost.conf
}

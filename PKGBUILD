# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=mattermost-git
_pkgname="${pkgname%-git}"
pkgver=3.9.0.rc1.r0.g52b5c74a0
pkgrel=1
pkgdesc="Open source Slack-alternative in Golang and React"
arch=('i686' 'x86_64')

url="http://mattermost.org"
# The official releases are under MIT, while the ones compiled from the source
# code in /platform must be under AGPL v3.
# src.: https://pre-release.mattermost.com/core/pl/cj61agrh5jgmukxxahgdwfx5ww
# src.: https://www.mattermost.org/licensing
license=('AGPL3')

makedepends=('go' 'npm' 'git' 'libpng12' 'pngquant' 'yarn')
provides=('mattermost')
conflicts=('mattermost')
backup=('etc/webapps/mattermost/config.json')
optdepends=(
    'mariadb: SQL server storage'
    'percona-server: SQL server storage'
    'postgresql: SQL server storage')

source=(
    # The mattermost repo is quite huge. Consider manually cloning the
    # repository first, either a full clone or with the --dept argument. You
    # can also specify the --depth git argument in your in makepkg.conf file.
    'git+https://github.com/mattermost/platform'
    'mattermost.service'
    'mattermost.sh'
    'tmpfile.conf'
    'user.conf')
sha512sums=(
    'SKIP'
    '3e3d46dc7778be256da9a366ec96cde684fcb07732d0adfd40ea00d6ec61a161a9d7e784f7773d34e4f058e6919b13053ac228255a05f175e7ce20538f07ec93'
    '5fe6c343e9739b12f8ea9390dafd729fa9f980978bbc0fa7eb6a2eb2d437929078d3efede23c28a6b399c407b8b5e92755169a468462088de0eb148b360acc4b'
    'e3ffcf4b86e2ecc7166c1abf92cd4de23d81bad405db0121e513a8d81fea05eec9dd508141b14b208c4c13fbc347c56f01ed91326faa01e872ecdedcc18718f9'
    'b95bf2c0d840d0e85baebc1051c872056fa4990d263334fecc7b11d96085cb65a69dd866f18889e209336028f17c02152c13a92d2be1c21848939f22203439f0')

# Take the latest tag available even if that tag is not reachable from the
# branch we are currently in. Indeed, tags are only made available in master as
# soon the branch containing this tag is removed. The code from the latest
# branch is anyway always made available in master. For this use case, this is
# actually better to take the lastest version available instead of the latest
# from master.
# src.: https://github.com/jquery/jquery/issues/1854#issuecomment-62739082
# Not documented in:
# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
# Remove the v prefix:
# src.: http://stackoverflow.com/a/7979255/3514658
pkgver() {
    cd "$srcdir"/src/github.com/mattermost/platform
    git describe --long \
        $(git for-each-ref --format="%(refname)" --sort=-authordate --count=1 refs/tags) \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

    # If you want to test languages and pull requests, simply clone this
    # repositiory and init the submodule with the following command:
    # git submodule update --init --recursive
    # then, use the command mattermost_prepare_pkgbuild.sh. See its help
    # available here: https://github.com/wget/mattermost-prepare-pkgbuild

    mkdir -p src/github.com/mattermost
    cd src/github.com/mattermost
    # Remove previous platform folder if any previous clone was effective
    rm -f platform
    ln -s "$srcdir"/platform platform
    cd platform

    # Remove platform specific lines from the Makefile from the line beginning
    # with "cp README.md" to the line beginning with run-server
    sed -n '1,/cp README.md/p;/^run-server:/,$p' -i Makefile

    sed -E -i Makefile \
        -e 's/^package: build build-client/package: build-linux build-client/' \
        -e 's/GOARCH=amd64//'

    # Use system pngquant instead of the one bundled with the app. Add rm and
    # ln instruction after the line 'npm install'.
    sed -i webapp/Makefile \
        -e '/npm install/a \	rm node_modules/pngquant-bin/vendor/pngquant\n	ln -s /usr/bin/pngquant node_modules/pngquant-bin/vendor/pngquant'
}

build() {
    cd "$srcdir"/src/github.com/mattermost/platform
    GOPATH="$srcdir" BUILD_NUMBER=$pkgver-$pkgrel make package
}

package() {
    cd "$srcdir"/src/github.com/mattermost/platform

    install -dm755 \
        "$pkgdir"/usr/share/webapps \
        "$pkgdir"/var/log/$_pkgname \
        "$pkgdir"/etc/webapps \
        "$pkgdir"/usr/share/{licenses,doc}/$_pkgname

    cp -a dist/mattermost "$pkgdir"/usr/share/webapps/$_pkgname

    cd "$pkgdir"/usr/share/webapps/$_pkgname
    rm -rf logs
    ln -s /var/log/$_pkgname logs

    mv config "$pkgdir"/etc/webapps/$_pkgname
    ln -s /etc/webapps/$_pkgname config

    sed -e 's@"Directory": ".*"@"Directory": "/var/lib/mattermost/"@g' \
        -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
        -i "$pkgdir"/etc/webapps/$_pkgname/config.json

    mv NOTICE.txt README.md "$pkgdir"/usr/share/doc/$_pkgname

    cd "$srcdir"
    install -Dm755 bin/platform "$pkgdir"/usr/share/webapps/$_pkgname/bin/platform
    install -Dm755 mattermost.sh "$pkgdir"/usr/bin/mattermost
    install -Dm644 mattermost.service "$pkgdir"/usr/lib/systemd/system/mattermost.service
    install -Dm644 tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/mattermost.conf
    install -Dm644 user.conf "$pkgdir"/usr/lib/sysusers.d/mattermost.conf
}

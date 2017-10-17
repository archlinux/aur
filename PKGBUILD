# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=mattermost
pkgver=4.3.0
pkgrel=1
pkgdesc='Open source Slack-alternative in Golang and React'
arch=('i686' 'x86_64')
url="https://mattermost.com"
# The official releases are under MIT, while the ones compiled from the source
# code in /platform must be under AGPL v3.
# src.: https://pre-release.mattermost.com/core/pl/cj61agrh5jgmukxxahgdwfx5ww
# src.: https://www.mattermost.org/licensing
license=('MIT')

makedepends=('git' 'go' 'libpng12' 'npm' 'yarn')
optdepends=(
    'mariadb: SQL server storage'
    'percona-server: SQL server storage'
    'postgresql: SQL server storage'
)
backup=("etc/webapps/${pkgname}/config.json")
source=(
    ${pkgname}-server-${pkgver}.tar.gz::"https://github.com/${pkgname}/${pkgname}-server/archive/v${pkgver}.tar.gz"
    ${pkgname}-webapp-${pkgver}.tar.gz::"https://github.com/${pkgname}/${pkgname}-webapp/archive/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sh"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
)
sha512sums=(
    'e74bbe40106faf82074a3a333c52046cb62e6890f51e37061423f89924cdac4bb2885590b303047b6f873c3e25d2cfa90e41c78e345a87add08a5d4ebf0105ad'
    '1ea624bae2c4e451b55cf258d6dcba16b8b0bf494537fc061b6f497c61a950f0facdb884903c8818d85e1330c8a27f48b6ea56aa376ca099fe21b5b88f9cb172'
    '3e3d46dc7778be256da9a366ec96cde684fcb07732d0adfd40ea00d6ec61a161a9d7e784f7773d34e4f058e6919b13053ac228255a05f175e7ce20538f07ec93'
    '5fe6c343e9739b12f8ea9390dafd729fa9f980978bbc0fa7eb6a2eb2d437929078d3efede23c28a6b399c407b8b5e92755169a468462088de0eb148b360acc4b'
    'f08d88fd91e91c8b9996cf33699f4a70d69c8c01783cf7add4781ee3c9c6596839e44c5c39f0ff39a836c6d87544eef179f51de0b037ec7f91f86bac8e24d7cc'
    'e3ffcf4b86e2ecc7166c1abf92cd4de23d81bad405db0121e513a8d81fea05eec9dd508141b14b208c4c13fbc347c56f01ed91326faa01e872ecdedcc18718f9'
)

prepare() {
    # cp cannot copy from a symbolic link to the destination link itself
    # a symbolic link located outside the first symbolic link folder location.
    # e.g.
    # mattermost-server is a symlink
    # mattermost-webapp is a symlink
    # we are in the folder mattermost-server and we want to execute
    # cp -RL ../mattermost-webapp/dist/* dist/mattermost/client/
    # this command will fail with
    # cp: cannot stat '../mattermost-webapp/dist/*': No such file or directory
    mv ${pkgname}-server-${pkgver} ${pkgname}-server
    mv ${pkgname}-webapp-${pkgver} ${pkgname}-webapp

    mkdir -p src/github.com/${pkgname}
    cd src/github.com/${pkgname}

    # Remove previous platform folders if any previous clone was effective
    rm -f ${pkgname}-server
    rm -f ${pkgname}-webapp

    # Create the directory structure to match Go namespaces
    ln -s "${srcdir}"/${pkgname}-server ${pkgname}-server
    ln -s "${srcdir}"/${pkgname}-webapp ${pkgname}-webapp
    cd ${pkgname}-server

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

    cd "${srcdir}"/src/github.com/${pkgname}/${pkgname}-server
    # Prevent the build to crash when some dependencies are not met or
    # outdated. This clean the webapp as well (cf. mattermost-server/Makefile,
    # clean target).
    make clean
    GOPATH="${srcdir}" BUILD_NUMBER=${pkgver}-${pkgrel} make build-linux
    GOPATH="${srcdir}" BUILD_NUMBER=${pkgver}-${pkgrel} make build-client
    GOPATH="${srcdir}" BUILD_NUMBER=${pkgver}-${pkgrel} make package
}

package() {
    cd "${srcdir}"/src/github.com/${pkgname}/${pkgname}-server

    install -dm755 \
        "${pkgdir}"/usr/share/webapps \
        "${pkgdir}"/var/log/${pkgname} \
        "${pkgdir}"/etc/webapps \
        "${pkgdir}"/usr/share/{licenses,doc}/${pkgname}

    cp -a dist/${pkgname} "${pkgdir}"/usr/share/webapps/

    cd "${pkgdir}"/usr/share/webapps/${pkgname}

    rm -rf logs
    ln -s /var/log/${pkgname} logs

    cp config/default.json config/config.json
    mv config "${pkgdir}"/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname} config

    sed -e 's@"Directory": ".*"@"Directory": "/var/lib/mattermost/"@g' \
        -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
        -i "${pkgdir}"/etc/webapps/${pkgname}/config.json

    # When MIT license, the one bundled with the package must always be copied
    # on the system.
    # src.: https://wiki.archlinux.org/index.php/PKGBUILD#license
    mv NOTICE.txt README.md "${pkgdir}"/usr/share/doc/${pkgname}
    mv MIT-COMPILED-LICENSE.md "${pkgdir}"/usr/share/license/${pkgname}/LICENSE

    cd "${srcdir}"
    install -Dm755 bin/platform -t "${pkgdir}"/usr/share/webapps/${pkgname}/bin/
    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}

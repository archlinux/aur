# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>

pkgname=mattermost
pkgver=5.3.1
pkgrel=1
pkgdesc='Open source Slack-alternative in Golang and React'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://mattermost.com'
license=('AGPL' 'Apache')

makedepends=('git' 'go' 'libpng' 'npm' 'python2')
# Experiencing issues with gifsicle and mozjpeg on non x64 architectures.
if [ "$CARCH" != 'x86_64' ]; then
    makedepends+=('gifsicle' 'mozjpeg')
fi
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
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
)
sha512sums=(
    '8db50c59de4cdf1804f11d345023d76c50e8e208e08cdaf13cc45a81d3e59e32558b55bb2ac811c3fa3c68210415ba19de0a40b471a4f3942a1c0f32a9716965'
    '6fa6d4c84144c383552fce5b36c634a5302038a765dd793bd1814f297344f15da9d30686773ab142ad40bdf8e00e3182515e89b172dede9514b6d6af57a5bc3b'
    'cd02b3da86869117554c3c53a657a4b46989ea533b7b47c24fb642ffbd182ce6ecfb16a8ddde3af4d5e8cff0ab41a932753129662e126994e1ad5912545e6eb4'
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
    cd ${srcdir}
    rm -rf ${pkgname}-server ${pkgname}-webapp
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

    # The configuration isn't available at this time yet, modify the default.
    sed -r -i build/release.mk \
        -e 's/\$\(DIST_PATH\)\/config\/config.json/\$\(DIST_PATH\)\/config\/default.json/'

    # The Go programming language only supports 8 instruction sets, therefore
    # we cannot rely on ${CARCH} and need to cast manually.
    # src.: https://golang.org/doc/install/source#introduction
    case "${CARCH}" in
        i686)
            sed -r -i build/release.mk \
                -e "5,7s/amd64/386/"
            ;;
        arm*64*|*arch*64*)
            sed -r -i build/release.mk \
                -e "5,7s/amd64/arm64/"
            ;;
        arm*)
            sed -r -i build/release.mk \
                -e "5,7s/amd64/arm/"
            ;;
    esac

    # Remove platform specific lines from the Makefile from the line beginning
    # with that statement to the end of file (we do not care of the additional
    # file copy, nor the tar compression defined below the file).
    sed '/# ----- PLATFORM SPECIFIC -----/,//d' -i ./build/release.mk

    # Enforce build hash to Arch Linux (Enterprise hash is already set to
    # none), instead of the official git hash value.
    sed -r -i Makefile \
        -e "s/^(\s*)BUILD_HASH(_ENTERPRISE)? =.*/\1BUILD_HASH\2 = ${pkgver}-${pkgrel} Arch Linux \(${CARCH}\)/" \
        -e 's/-X (.*)(\$\(BUILD_HASH(_ENTERPRISE)?\))(.*)/-X '\''\1\2'\''\4/'
    cd "${srcdir}/${pkgname}-webapp"
    sed -r -i webpack.config.js \
        -e "s/^(\s*)COMMIT_HASH:(.*),$/\1COMMIT_HASH: JSON.stringify\(\"${pkgver}-${pkgrel} Arch Linux \(${CARCH}\)\"\),/"

    # Link against system gifsicle
    if [ "$CARCH" != 'x86_64' ]; then
        gifsicleNpm="${srcdir}/${pkgname}-webapp/node_modules/gifsicle/vendor/gifsicle"
        gifsicleNpm="${gifsicleNpm//\//\\/}"
        gifsicleSystem="$(which gifsicle)"
        gifsicleSystem="${gifsicleSystem//\//\\/}"
        sed -r -i Makefile \
            -e "s/(\t*)npm install(.*)/\0\n\1rm \"$gifsicleNpm\"\n\tln -s \"$gifsicleSystem\" \"$gifsicleNpm\"/"
    fi
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
        "${pkgdir}"/usr/bin \
        "${pkgdir}"/usr/share/webapps \
        "${pkgdir}"/var/log/${pkgname} \
        "${pkgdir}"/etc/webapps \
        "${pkgdir}"/usr/share/doc/${pkgname}

    cp -a dist/${pkgname} "${pkgdir}"/usr/share/webapps/

    cd "${pkgdir}"/usr/share/webapps/${pkgname}
    install -dm755 client/plugins

    rm -rf logs
    ln -s /var/log/${pkgname} logs

    cp config/default.json config/config.json
    mv config "${pkgdir}"/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname} config

    sed -e 's@"Directory": ".*"@"Directory": "/var/lib/mattermost/"@g' \
        -e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
        -i "${pkgdir}"/etc/webapps/${pkgname}/config.json

    mv NOTICE.txt README.md "${pkgdir}"/usr/share/doc/${pkgname}

    cd "${srcdir}"
    install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/bin/${pkgname}"
    ln -s "/usr/share/webapps/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

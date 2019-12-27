# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Bruno Pagani <archange at archlinux dot org>

pkgname=mattermost
pkgver=5.18.0
pkgrel=1
pkgdesc='Open source Slack-alternative in Golang and React'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://mattermost.com'
license=('AGPL' 'Apache')

makedepends=('git' 'go-pie' 'jq' 'npm' 'nodejs')
# Experiencing issues with gifsicle and mozjpeg on non x64 architectures.
if [ "${CARCH}" != 'x86_64' ]; then
    makedepends+=('gifsicle' 'mozjpeg')
fi
optdepends=(
    'mariadb: SQL server storage'
    'percona-server: SQL server storage'
    'postgresql: SQL server storage'
)
backup=("etc/webapps/${pkgname}/config.json")
source=(
    "${pkgname}-server-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}-server/archive/v${pkgver}.tar.gz"
    "${pkgname}-webapp-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}-webapp/archive/v${pkgver}.tar.gz"
    "mattermost-ldflags.patch"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
)
sha512sums=(
    '842c326dad16d2a625b372b4c8c8a39e036dd02b714b25b73be0b511eeba55f844f1f7784bcaec37a45a24fe870a00d9b87ba51891e544389483bfcae1bdd04c'
    '667df6943d4e870eba2f0e5826a8aab0e6f3ea79d1ce7b81ac31f7ccbcc21ace45a0f2b56b3d229079daf83d13ef28abb000b605ad1adfc091002a8939bd33ba'
    '48181d4c06d5e2486c5445ae56f56bb766283954f0a480e59440a98138487d291df59bd366c16ea58ecc5cdf758bad09c1db5b4523709f3aa4f356c7bc9e5e00'
    '6fc1b41f1ddcc44dab3e1f6bc15b7566e7c33132346b7eb0bc91d9709b4cec89ae969a57a57b6097c75868af21f438c2affda5ba1507f485c8689ab8004efd70'
    'f08d88fd91e91c8b9996cf33699f4a70d69c8c01783cf7add4781ee3c9c6596839e44c5c39f0ff39a836c6d87544eef179f51de0b037ec7f91f86bac8e24d7cc'
    'fcde946cddf973b75a906edf8301ccbc2ecbca4adf1df73d13c5343491db5f511b9eb0e1f237087cb508398f2bcdbd46fa03e5b2ac88729cdaed4610512dd3e2'
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
    cd "${srcdir}"
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

    # Pass Arch Linux's Go compilation flags to Mattermost in order to take
    # into account advanced features like PIE.
    patch < "${srcdir}"/mattermost-ldflags.patch

    # We are not using docker, no need to stop it.
    sed -r -i Makefile \
        -e 's/^clean: stop-docker/clean:/'

    # The configuration isn't available at this time yet, modify the default.
    sed -r -i build/release.mk \
        -e  's!config/config.json!config/default.json!' \
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

    # Patch go dependencies
    sed -r -i go.mod \
        -e "/replace/,//d"

    # Remove platform specific lines from the Makefile from the line beginning
    # with that statement to the end of file (we do not care of the additional
    # file copy, nor the tar compression defined below the file).
    sed '/# Download prepackaged plugins/,//d' -i ./build/release.mk

    # Enforce build hash to Arch Linux (Enterprise hash is already set to
    # none), instead of the official git hash value and use an ISO 8601
    # inspired compilation date format without any letter format (only use
    # numbers).
    sed -r -i Makefile \
        -e "s/^(\s*)BUILD_HASH =.*/\1BUILD_HASH = ${pkgver}-${pkgrel} Arch Linux \(${CARCH}\)/" \
        -e 's/BUILD_DATE = \$\(shell date -u\)/BUILD_DATE = \$(shell date -u +'"'"'%Y-%m-%d %H:%M:%S'"'"')/'

    # Enforce build hash to Arch Linux as well for the field corresponding to
    # the webapp.
    cd "${srcdir}"/${pkgname}-webapp
    sed -r -i webpack.config.js \
        -e "s/^(\s*)COMMIT_HASH:(.*),$/\1COMMIT_HASH: JSON.stringify\(\"${pkgver}-${pkgrel} Arch Linux \(${CARCH}\)\"\),/"

    # Link against system gifsicle
    if [ "${CARCH}" != 'x86_64' ]; then
        gifsicleNpm="${srcdir}"/${pkgname}-webapp/node_modules/gifsicle/vendor/gifsicle
        gifsicleNpm="${gifsicleNpm//\//\\/}"
        gifsicleSystem="$(which gifsicle)"
        gifsicleSystem="${gifsicleSystem//\//\\/}"
        sed -r -i Makefile \
            -e "s/(\t*)npm install(.*)/\0\n\trm \"${gifsicleNpm}\"\n\tln -s \"${gifsicleSystem}\" \"${gifsicleNpm}\"/"
    fi
}

build() {
    # No need to build mattermost-webapp as the server is taking care of this
    # step via its build-client make instruction.

    cd "${srcdir}"/src/github.com/${pkgname}/${pkgname}-server
    # Prevent the build to crash when some dependencies are not met or
    # outdated. This cleans the webapp as well (cf. mattermost-server/Makefile,
    # clean target).
    make clean
    GOPATH="${srcdir}" BUILD_NUMBER=${pkgver}-${pkgrel} make build-linux
    GOPATH="${srcdir}" BUILD_NUMBER=${pkgver}-${pkgrel} make build-client
    GOPATH="${srcdir}" BUILD_NUMBER=${pkgver}-${pkgrel} make package
}

package() {
    # Init directory hierarchy
    install -dm755 \
        "${pkgdir}"/usr/bin \
        "${pkgdir}"/usr/share/webapps \
        "${pkgdir}"/etc/webapps \
        "${pkgdir}"/usr/share/doc/${pkgname}

    # Copy mattermost build to destination
    cd "${srcdir}"/src/github.com/${pkgname}/${pkgname}-server
    cp -a dist/${pkgname} "${pkgdir}"/usr/share/webapps/

    cd "${pkgdir}"/usr/share/webapps/${pkgname}

    # Move logs to right location
    rm -rf logs
    ln -s /var/log/${pkgname} logs

    # Readme and docs
    mv NOTICE.txt README.md "${pkgdir}"/usr/share/doc/${pkgname}

    # Config file management
    cp config/default.json config/config.json
    # Hashtags are needed to escape the Bash escape sequence. jq will consider
    # it as a comment and won't interpret it.
    jq '.FileSettings.Directory |= $mmVarLib + "/files/" | # \
        .ComplianceSettings.Directory |= $mmVarLib + "/compliance/" | # \
        .PluginSettings.Directory |= $mmVarLib + "/plugins/" | # \
        .PluginSettings.ClientDirectory |= $mmVarLib + "/client/plugins/"' \
       --arg mmVarLib '/var/lib/mattermost' \
       config/config.json > config/config-new.json
    mv config/config-new.json config/config.json
    mv config "${pkgdir}"/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname} config

    # Avoid access denied when Mattermost tries to rewrite its asset data
    # (root.html, manifest.json and *.css) during runtime. Reuse var tmpfile
    # directory SELinux security context.
    # cf. https://github.com/mattermost/mattermost-server/blob/f8d31def8eb463fcd866ebd08f3e6ef7a24e2109/utils/subpath.go#L48
    # cf. https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    install -dm700 "${pkgdir}"/var/lib/mattermost/client
    # We want recursivity as Mattermost wants to modify files in
    # client/files/code_themes/ as well.
    # Not recursive: for file in root.html manifest.json *.css; do
    find client -type f -iname 'root.html' -o -iname 'manifest.json' -o -iname '*.css' | while IFS= read -r fileAndPath; do
        install -dm700 "${pkgdir}"/var/lib/mattermost/"${fileAndPath%/*}"
        install -m700 "${fileAndPath}" "${pkgdir}"/var/lib/mattermost/"${fileAndPath%/*}"
        rm "${fileAndPath}"
        ln -s /var/lib/mattermost/"${fileAndPath}" "${fileAndPath}"
    done
    # As we are using install, only the leaves have their permissions
    # redefined. Some folders in the hierarchy might not have the right
    # permissions. Fix this.
    chmod -R 700 "${pkgdir}"/var/lib/mattermost/

    # Install package config
    cd "${srcdir}"
    install -Dm755 bin/${pkgname} "${pkgdir}"/usr/share/webapps/${pkgname}/bin/${pkgname}
    ln -s /usr/share/webapps/${pkgname}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}

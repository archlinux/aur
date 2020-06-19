# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Bruno Pagani <archange at archlinux dot org>

pkgname=mattermost
pkgver=5.24.1
pkgrel=1
pkgdesc='Open source Slack-alternative in Golang and React'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://mattermost.com'
license=('AGPL' 'Apache')
makedepends=('go'
             'jq'
             'nodejs'
             'npm')
# Experiencing issues with gifsicle and mozjpeg on non x64 architectures.
if [ "$CARCH" != 'x86_64' ]; then
    makedepends+=('gifsicle' 'mozjpeg')
fi
optdepends=('mariadb: SQL server storage'
            'percona-server: SQL server storage'
            'postgresql: SQL server storage')
backup=("etc/webapps/$pkgname/config.json")
source=("$pkgname-server-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname-server/archive/v$pkgver.tar.gz"
        "$pkgname-webapp-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname-webapp/archive/v$pkgver.tar.gz"
        "$pkgname-ldflags.patch"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('fba4ac2242c3645ee1452f5472be49bbd068717f108bacc0ed3f2ce7cde924c6'
            '49040acdb7e86b58380b3f3512d15b38b0d9349e49661717057debe57982a256'
            '08685fa8aad0097cb97bba3484c0a0f8908a4e5123928351b7e7732aecc914f2'
            '522f44f3a68f73e43d854421f40e18055f3256453bc00a2162956902d1e577f8'
            'f7bd36f6d7874f1345d205c6dcb79af1804362fc977a658db88951a172d1dfa0'
            '15220909751b960b811fc3eb3d1b8e2c0c5855d726d834461f667b5458d3bdad')

prepare() {
    # The build scripts dereference symlinks and sometimes end up in the root
    # source dir when they were launched from the Go domain path structure.
    ln -sf "$pkgname-server-$pkgver" "$pkgname-server"
    ln -sf "$pkgname-webapp-$pkgver" "$pkgname-webapp"

    # Create the directory structure to match Go namespaces
    mkdir -p "src/github.com/$pkgname"
    cd "src/github.com/$pkgname"

    ln -sf "$srcdir/$pkgname-server-$pkgver" "$pkgname-server"
    ln -sf "$srcdir/$pkgname-webapp-$pkgver" "$pkgname-webapp"
    cd "$pkgname-server"

    # Pass Arch Linux's Go compilation flags to Mattermost in order to take
    # into account advanced features like PIE.
    patch -p1 < "$srcdir/$pkgname-ldflags.patch"

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
    case "$CARCH" in
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
        -e "s/^(\s*)BUILD_HASH =.*/\1BUILD_HASH = $pkgver-$pkgrel Arch Linux \($CARCH\)/" \
        -e 's/BUILD_DATE = \$\(shell date -u\)/BUILD_DATE = \$(shell date -u +'"'"'%Y-%m-%d %H:%M:%S'"'"')/'

    # Enforce build hash to Arch Linux as well for the field corresponding to
    # the webapp.
    cd "$srcdir/$pkgname-webapp-$pkgver"
    sed -r -i webpack.config.js \
        -e "s/^(\s*)COMMIT_HASH:(.*),$/\1COMMIT_HASH: JSON.stringify\(\"$pkgver-$pkgrel Arch Linux \($CARCH\)\"\),/"

    # Link against system gifsicle
    if [ "$CARCH" != 'x86_64' ]; then
        gifsicleNpm="$srcdir/$pkgname-webapp/node_modules/gifsicle/vendor/gifsicle"
        gifsicleNpm="${gifsicleNpm//\//\\/}"
        gifsicleSystem="$(which gifsicle)"
        gifsicleSystem="${gifsicleSystem//\//\\/}"
        sed -r -i Makefile \
            -e "s/(\t*)npm install(.*)/\0\n\trm \"$gifsicleNpm\"\n\tln -s \"$gifsicleSystem\" \"$gifsicleNpm\"/"
    fi
}

build() {
    cd "$srcdir/src/github.com/$pkgname/$pkgname-server"
    export GOPATH="$srcdir" BUILD_NUMBER=$pkgver-$pkgrel
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make build-linux
    make build-client
    make package
}

package() {
    cd "src/github.com/$pkgname/$pkgname-server"

    install -dm755 "$pkgdir/usr/share/webapps"
    cp -a "dist/$pkgname" "$pkgdir/usr/share/webapps/"

    install -Dm755 -t "$pkgdir/usr/share/webapps/$pkgname/bin/" "bin/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/usr/share/webapps/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

    pushd "$srcdir"
    install -Dm644  -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
    install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

    pushd "$pkgdir/usr/share/webapps/$pkgname"

    # Move logs to right location
    rm -rf logs
    ln -s "/var/log/$pkgname" logs

    # Readme and docs
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    mv NOTICE.txt README.md "$pkgdir/usr/share/doc/$pkgname"

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
    install -dm755 "$pkgdir/etc/webapps"
    mv config "$pkgdir/etc/webapps/$pkgname"
    ln -sf "/etc/webapps/$pkgname" config

    # Avoid access denied when Mattermost tries to rewrite its asset data
    # (root.html, manifest.json and *.css) during runtime. Reuse var tmpfile
    # directory SELinux security context.
    # cf. https://github.com/mattermost/mattermost-server/blob/f8d31def8eb463fcd866ebd08f3e6ef7a24e2109/utils/subpath.go#L48
    # cf. https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    install -dm700 "$pkgdir"/var/lib/mattermost/client

    # We want recursivity as Mattermost wants to modify files in
    # client/files/code_themes/ as well.
    # Not recursive: for file in root.html manifest.json *.css; do
    find client -type f -iname 'root.html' -o -iname 'manifest.json' -o -iname '*.css' |
        while IFS= read -r fileAndPath; do
            install -dm700 "$pkgdir"/var/lib/mattermost/"${fileAndPath%/*}"
            install -m700 "$fileAndPath" "$pkgdir"/var/lib/mattermost/"${fileAndPath%/*}"
            rm "$fileAndPath"
            ln -s /var/lib/mattermost/"$fileAndPath" "$fileAndPath"
        done

    # As we are using install, only the leaves have their permissions
    # redefined. Some folders in the hierarchy might not have the right
    # permissions. Fix this.
    chmod -R 700 "$pkgdir"/var/lib/mattermost/
}

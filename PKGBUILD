# Maintainer: Pol Rivero <aur AT polrivero DOT com>
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Ian MacKay <immackay0 AT gmail DOT com>
# Contributor: Mikel Pintado <mikelaitornube2010 AT gmail DOT com>
# Contributor: Igor Petrov
# Contributor: Jiawen Geng

pkgname=github-desktop-plus
pkgver=3.5.13.0
pkgrel=1
pkgdesc="Fork of GitHub Desktop with extra features and improvements."
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
depends=(curl
         libcurl-gnutls
         git
         gtk3
         libsecret
         libxss
         nspr
         nss
         org.freedesktop.secrets
         unzip)
optdepends=('github-cli: CLI interface for GitHub'
            'hub: CLI interface for GitHub')
makedepends=(python-setuptools
             'nodejs-lts-krypton'
             npm
             util-linux
             xorg-server-xvfb
             yarn)
source=("$pkgname::git+https://github.com/pol-rivero/github-desktop-plus.git#tag=v$pkgver"
        'git+https://github.com/github/gemoji.git'
        'git+https://github.com/github/gitignore.git'
        'git+https://github.com/github/choosealicense.com.git'
        'launch-app.sh'
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2fb026db6ac25ade0535ec1fffec415fd1d023fbfd28b452f29523e51921083a'
            '93847b4cc1e967eae041284e9c7ed3d1a48df38482ff89b681ede79de03e342e')

_deobfuscate() {
    echo "$1" | rev | tr -d '@'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule."gemoji".url "$srcdir/gemoji"
    git config submodule."app/static/common/gitignore".url "$srcdir/gitignore"
    git config submodule."app/static/common/choosealicense.com".url "$srcdir/choosealicense.com"
    git -c protocol.file.allow=always submodule update
    # https://github.com/shiftkey/desktop/issues/809#issuecomment-1348815685
    sed -e '/compile:prod/s/4096/4096 --openssl-legacy-provider/' -i package.json
}

build() {
    export APP_VERSION="$pkgver"
    cd "$pkgname"
    # https://github.com/nodejs/node/issues/48444
    export UV_USE_IO_URING=0
    xvfb-run yarn install

    # These can be extracted trivially from the app, so there is no point in trying to hide them.
    # Obfuscate them slightly in the PKGBUILD to prevent bots from easily scraping them.    
    export "$(_deobfuscate "D@I@_@T@N@E@I@L@C@_@H@T@U@A@O@_@P@O@T@K@S@E@D@")"="$(_deobfuscate "7@7@d@d@4@c@1@e@3@7@9@9@e@7@c@3@e@0@e@d@")"
    export "$(_deobfuscate "T@E@R@C@E@S@_@T@N@E@I@L@C@_@H@T@U@A@O@_@P@O@T@K@S@E@D@")"="$(_deobfuscate "3@a@2@e@1@6@9@d@9@a@4@2@a@b@8@4@9@1@1@9@2@a@c@2@c@7@3@7@2@c@f@5@a@5@0@3@3@7@2@1@")"
    export "$(_deobfuscate "T@E@K@C@U@B@T@I@B@_@D@I@_@T@N@E@I@L@C@_@H@T@U@A@O@_@P@O@T@K@S@E@D@")"="$(_deobfuscate "3@3@y@P@z@p@Y@f@M@R@p@J@R@3@P@c@X@v@")"
    export "$(_deobfuscate "T@E@K@C@U@B@T@I@B@_@T@E@R@C@E@S@_@T@N@E@I@L@C@_@H@T@U@A@O@_@P@O@T@K@S@E@D@")"="$(_deobfuscate "v@B@n@D@g@L@7@m@g@q@w@D@L@j@N@K@f@2@M@z@g@Q@F@u@E@x@H@w@Z@N@t@Y@")"
    export "$(_deobfuscate "B@A@L@T@I@G@_@D@I@_@T@N@E@I@L@C@_@H@T@U@A@O@_@P@O@T@K@S@E@D@")"="$(_deobfuscate "a@7@4@a@6@e@e@1@e@e@7@d@c@6@1@f@c@c@f@0@a@f@8@8@c@b@f@2@8@8@f@2@6@c@0@0@2@f@f@7@c@9@c@5@d@9@2@8@d@b@9@f@c@0@3@8@b@9@d@c@5@9@8@5@")"
    export "$(_deobfuscate "B@A@L@T@I@G@_@T@E@R@C@E@S@_@T@N@E@I@L@C@_@H@T@U@A@O@_@P@O@T@K@S@E@D@")"="$(_deobfuscate "2@d@1@0@8@c@d@a@4@4@1@c@6@9@8@a@1@b@2@9@b@5@b@a@0@c@6@a@1@c@c@8@1@c@6@c@0@2@6@c@4@8@c@6@7@7@b@3@2@f@6@e@e@6@6@6@a@b@a@8@b@f@2@3@-@s@a@o@l@g@")"
    xvfb-run yarn build:prod
}

package() {
    INSTALL_DIR="$pkgdir/opt/$pkgname"

    cd "$pkgname"
    install -d "$INSTALL_DIR"
    case "$CARCH" in
        x86_64) suffix="x64" ;;
        aarch64) suffix="arm64" ;;
        *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
    esac
    cp -r --preserve=mode "dist/github-desktop-plus-linux-$suffix/"* "$INSTALL_DIR/"

    cd "$INSTALL_DIR/resources/app/static/logos"
    install -Dm0644 "1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm0644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm0644 "256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/$pkgname"

    chmod +x "$INSTALL_DIR/resources/app/static/github"
    ln -s "/opt/$pkgname/resources/app/static/github" "$pkgdir/usr/bin/github-desktop-plus-cli"

    install -Dm0644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# Maintainer: Pol Rivero <aur AT polrivero DOT com>
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Ian MacKay <immackay0 AT gmail DOT com>
# Contributor: Mikel Pintado <mikelaitornube2010 AT gmail DOT com>
# Contributor: Igor Petrov
# Contributor: Jiawen Geng

pkgname=github-desktop-plus
pkgver=3.5.3
pkgrel=1
pkgdesc="Fork of GitHub Desktop with extra features and improvements."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
depends=(curl
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
             'nodejs>=22'
             npm
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
            'ef93d32f46b31818ffea85959f5ac67353df2c4da351b273108765b80c7f080d')

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
    cd "$pkgname"
    # https://github.com/nodejs/node/issues/48444
    export UV_USE_IO_URING=0
    xvfb-run yarn install
    xvfb-run yarn build:prod
}

package() {
    cd "$pkgname"
    install -d "$pkgdir/opt/$pkgname"
    case "$CARCH" in
        x86_64) suffix="x64" ;;
        aarch64) suffix="arm64" ;;
        armv7h) suffix="armv7l" ;;
        *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
    esac
    cp -r --preserve=mode "dist/github-desktop-plus-linux-$suffix/"* "$pkgdir/opt/$pkgname/"

    install -Dm0644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    pushd "$pkgdir/opt/$pkgname/resources/app/static/logos"
    install -Dm0644 "1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm0644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm0644 "256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/$pkgname"
}

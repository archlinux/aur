# Maintainer: Pol Rivero <aur AT polrivero DOT com>
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Ian MacKay <immackay0 AT gmail DOT com>
# Contributor: Mikel Pintado <mikelaitornube2010 AT gmail DOT com>
# Contributor: Igor Petrov
# Contributor: Jiawen Geng

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-git"
pkgver=0
pkgrel=1
pkgdesc="Fork of GitHub Desktop with extra features and improvements (git version)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
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
             'nodejs>=22'
             npm
             xorg-server-xvfb
             yarn)
source=("$pkgname::git+https://github.com/pol-rivero/github-desktop-plus.git"
        'git+https://github.com/github/gemoji.git'
        'git+https://github.com/github/gitignore.git'
        'git+https://github.com/github/choosealicense.com.git'
        'launch-app.sh'
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2fb026db6ac25ade0535ec1fffec415fd1d023fbfd28b452f29523e51921083a'
            '480742d5e68d1e64e3732b521ebfdd40944573a8f43c187eb24c6109c21a37fe')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "$(date +%Y%m%d).$(git rev-parse --short HEAD)"
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
    cd "$pkgname"
    # https://github.com/nodejs/node/issues/48444
    export UV_USE_IO_URING=0
    xvfb-run yarn install
    xvfb-run yarn build:prod
}

package() {
    INSTALL_DIR="$pkgdir/opt/${_pkgname}"

    cd "$pkgname"
    install -d "$INSTALL_DIR"
    case "$CARCH" in
        x86_64) suffix="x64" ;;
        aarch64) suffix="arm64" ;;
        armv7h) suffix="armv7l" ;;
        *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
    esac
    cp -r --preserve=mode "dist/github-desktop-plus-linux-$suffix/"* "$INSTALL_DIR/"

    cd "$INSTALL_DIR/resources/app/static/logos"
    install -Dm0644 "1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    install -Dm0644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm0644 "256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/${_pkgname}"

    chmod +x "$INSTALL_DIR/resources/app/static/github"
    ln -s "/opt/${_pkgname}/resources/app/static/github" "$pkgdir/usr/bin/github-desktop-plus-cli"

    install -Dm0644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}

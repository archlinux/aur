# Maintainer: detiam <dehe_tian [at] outlook dot com>
# Contributor: zhullyb <zhullyb [at] outlook dot com>
# Contributor: weearc <q19981121 [at] 163 dot com>
# Contributor: JimMoen <LnJimMoen [at] outlook dot com>

pkgname=motrix-electron
_pkgname=Motrix
pkgver=1.8.19
pkgrel=1
pkgdesc="A full-featured download manager (use extra/electron)"
arch=("x86_64")
url="https://github.com/detiam/Motrix"
license=('MIT')
depends=('electron') # tested work with electron 30
makedepends=('volta' 'jq' 'gendesk')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
commit=630419471e2ce48759743ed2390e8b19e453eeb4
source=("$_pkgname-$commit.tar.gz::${url}/archive/${commit}.tar.gz")
sha1sums=('7b9c27baaae0f7e5a0b5e04acd6219392d39b7b8')

_install_dir="/usr/lib/${pkgname}"

_use_srcdir() {
    # for not influence user home
    HOME="$srcdir"
    VOLTA_HOME="$HOME/.volta"
    PATH="$VOLTA_HOME/bin:$PATH"
}

prepare() {
    cd "$_pkgname-$commit"
    _use_srcdir
    volta run yarn
}

build() {
    cd "$_pkgname-$commit"
    _use_srcdir
    yarn run build:github
    mkdir app
    cp -a dist app
    jq '{
            name,
            version,
            description,
            homepage,
            author,
            copyright,
            license,
            main,
            dependencies,
            volta
         }' package.json > app/package.json
    yarn install \
        --cwd=app \
        --prod \
        --no-lockfile \
        --non-interactive
}

package() {
    cd "$_pkgname-$commit"

    # copy file
    install -dm755 "$pkgdir/$_install_dir"
    cp -a extra/linux/x64/engine/ "$pkgdir/$_install_dir"
    cp -a app "$pkgdir/$_install_dir"

    # binary wrapper
    install -Dm755 <(cat <<- SCRIPT
	#!/usr/bin/env sh
	export ELECTRON_IS_DEV=true
	export ELECTRON_FORCE_IS_PACKAGED=true
	exec electron $_install_dir/app "\$@"
	
	SCRIPT
    ) "${pkgdir}/usr/bin/${pkgname}"

    # icons
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -dm755 "${pkgdir}"/usr/share/hicolor/{256x256,512x512}/apps
    ln -sf \
        "$_install_dir/app/dist/electron/static/512x512.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    ln -sf \
        "$_install_dir/app/dist/electron/static/512x512.png" \
        "${pkgdir}/usr/share/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 \
        build/256x256.png \
        "${pkgdir}/usr/share/hicolor/256x256/apps/${pkgname}.png"
    
    # desktop enrty
    _pkgdesc="$(jq -r '.description' package.json)"
    install -dm755 "${pkgdir}/usr/share/applications"
    cd "${pkgdir}/usr/share/applications"
    gendesk --pkgname="$pkgname" \
            --pkgdesc="$_pkgdesc" \
            --icon="$pkgname" \
            --exec="$pkgname %U" \
            --categories="Network;FileTransfer" \
            --mimetypes="application/x-bittorrent" \
            --startupnotify=true -n --name="$_pkgname"
}

# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Contributor: sukanka <su975853527 [AT] gmail dot com>
# Contributor: weearc <q19981121 [at] 163 dot com>
pkgname=motrix
_pkgname=Motrix
pkgver=1.6.11
pkgrel=4
epoch=
pkgdesc="A full-featured download manager (release version)"
arch=("x86_64")
url="https://github.com/agalwood/Motrix"
license=('MIT')
groups=()
depends=('gtk3' 'libxcb' 'electron')
makedepends=('aria2-fast' 'npm' 'yarn' "nodejs<17")
checkdepends=()
optdepends=()
provides=()
conflicts=('motrix-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("motrix.desktop"
    "motrix"
    "Motrix.tar.gz"::"https://github.com/agalwood/Motrix/archive/v${pkgver}.tar.gz"
    )
noextract=()
sha256sums=('af5092a2a599bd23c13303ad1e7b745992a7af141278d13abe4297ca50a77bd8'
            '52a8f1ae5916a91aa1c9f1749e06777b4457bd9f5a03749c9fcd97e7d0801a71'
            '9a1558063d32dd100aa289db601f01497d518c070f0ba570efd446830697089e')
validpgpkeys=()

prepare() {
    cd $srcdir/${_pkgname}-${pkgver}
    # Fix pack error
    sed -i "s|--colors||g" package.json
}

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    export YARN_CACHE_FOLDER="${srcdir}/yarn_cache"
    yarn install
    install -Dm 644 package.json apps/package.json
    
    # start pack 
    yarn run pack
    cp -r dist apps
    cd apps

    # remove post install & install deps
    sed -i "s|\"postinstall\".\+|\"postinstall\":\"\"|g" package.json
    yarn install --production

    # remove useless file
    rm -rf node_modules/{.bin,.yarn-integrity}
    rm -rf yarn.lock

    # pack asar
    cd ../
    asar p apps app.asar
    rm -rf apps/
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    install -Dm 644 app.asar ${pkgdir}/usr/lib/${pkgname}/app.asar
    install -Dm 644 extra/linux/engine/aria2.conf ${pkgdir}/usr/lib/${pkgname}/engine/aria2.conf

    # Copy aria2-fast from system. Motrix set 64 download threads as default, so if use original aria2c will get error.
    install -Dm 775 /usr/bin/aria2c ${pkgdir}/usr/lib/${pkgname}/engine/aria2c

    # binary wrapper
    install -Dm 775 ${srcdir}/motrix ${pkgdir}/usr/bin/${pkgname}

    # desktop enrty
    install -Dm 644 ${srcdir}/motrix.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

    # icons
    install -Dm 644 build/256x256.png ${pkgdir}/usr/share/icons/${pkgname}.png
}

# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=gaia-hub
pkgver=2.5.3
pkgrel=1
pkgdesc="A decentralized high-performance storage system"
url="https://github.com/blockstack/gaia"
license=("MIT" "custom")
arch=("any")

depends=(
    "nodejs"
)

makedepends=(
    "npm"
    "node-gyp"
    "make"
)
optdepends=(
    "nginx: utilize provided example configs"
)

source=(
    "${pkgname}::git+https://github.com/blockstack/gaia.git#tag=v${pkgver}"
    "gaia-hub.service"
    "config.json"
)
sha512sums=('SKIP'
            '26297bc8e85b7577922442dc904597d7087e52e1204580a7c1ede516de9b9947e6e1640f28aa4bc03851c466bc9953dd256c39ac7f429db62ea9ba662eb14a0f'
            '19a037b067cd254cf7c06b517b6a696804f9a559fa6689ca65478f963d3dfc28a03598ecc9c3cede60699dd29b691cefeea2b98e283fcca443cc8eb4dc17aad7')

prepare() {
    cd "$srcdir/$pkgname/hub"
    npm --cache "${srcdir}/npm-cache" install
}

build() {
    cd "$srcdir/$pkgname/hub"
    npm run build
}

package() {
    cd "$srcdir/$pkgname/hub"
    
    export NODE_ENV="production"
    
    install -d "${pkgdir}/etc/gaia/hub" "${pkgdir}/usr/lib/node_modules/gaia-hub" "${pkgdir}/usr/bin" "${pkgdir}/srv/gaia/hub"
    
    cp -r "lib" "node_modules" "${pkgdir}/usr/lib/node_modules/gaia-hub/"
    chmod 755 "${pkgdir}/usr/lib/node_modules/gaia-hub/lib/index.js"
    ln -s "/usr/lib/node_modules/gaia-hub/lib/index.js" "${pkgdir}/usr/bin/gaia-hub"
    
    install -Dm 644 "${srcdir}/config.json" "${pkgdir}/usr/lib/node_modules/gaia-hub/config.json"
    ln -s "/usr/lib/node_modules/gaia-hub/config.json" "${pkgdir}/etc/gaia/hub/config.json"
    
    install -Dm 644 "nginx.conf" "${pkgdir}/usr/share/doc/gaia/hub/nginx.conf.example"
    for file in etc/*.json; do
        install -m 644 "$file" "${pkgdir}/usr/share/doc/gaia/hub/"
    done
    
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/gaia/hub/README.md"
    install -Dm 644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/gaia/hub/CHANGELOG.md"
    install -Dm 644 "../LICENSE" "${pkgdir}/usr/share/licenses/gaia/LICENSE"
    
    install -Dm 644 "${srcdir}/gaia-hub.service" "${pkgdir}/usr/lib/systemd/system/gaia-hub.service"
}

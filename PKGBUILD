# Maintainer: ml <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.4.16_beta.r0.g45e17f7
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('any')
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron6')
makedepends=('git' 'jq' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("${pkgname}::git+${url}.git"
        ubports-installer
        ubports-installer.desktop
        use-system-tools.patch)
sha256sums=('SKIP'
            'bacb11b37b4ecc5ecac78aad8b2950cf17ced03ca11dfb512c34fad18e894261'
            '7f59cb66ab7e59caeff93f697e47f26f43a9a221258f4d89dee580e41dd7a39a'
            '5b31be9612632f1a3beee3d38e97a23ee346ec814b580bfa41dad6e4f7ac4fb9')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    cd "$pkgname"
    patch -Np1 <../use-system-tools.patch
    npm install --no-audit --no-progress --no-fund --ignore-scripts electron@"$(</usr/lib/electron6/version)"

    # Removing local references
    for module in he sshpk; do
        local target="node_modules/${module}/package.json"
        jq 'del(.man)' "$target" >tmp.json
        mv tmp.json "$target"
    done
}

build() {
    cd "$pkgname"
    npx electron-builder --linux --dir \
      -c buildconfig-generic.json \
      -c.electronDist=/usr/lib/electron6 \
      -c.electronVersion="$(</usr/lib/electron6/version)"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications" ubports-installer.desktop
    install -Dm755 -t "${pkgdir}/usr/bin" ubports-installer 

    cd "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/ubports-installer" dist/linux-unpacked/resources/app.asar 

    cd build/icons
    for i in *x*.png; do
        install -Dm644 "$i" "${pkgdir}/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
    done
}

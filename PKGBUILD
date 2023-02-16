pkgname=('learnx-companion-git' 'learnx-companion-electron-git')
pkgver=1.2.0.r3.g969fe62
pkgrel=1
pkgdesc='清华大学网络学堂 App 助手，为 learnX 提供个性化的推送通知支持。'
depends=()
makedepends=('nodejs' 'git')
arch=('x86_64')
url='https://github.com/robertying/learnX-companion'
provides=('learnX-companion')
conflicts=('learnX-companion')
source=("learnX-companion::git+${url}#branch=main"
        '_learnX-companion' 'learnX-companion.desktop' 'icon_256.png' 'wrapper.js')
sha256sums=('SKIP'
            'd6f270d68c23a13c4c172ce6c748ae7882f21991dfa684f6b99e64d16522c5aa'
            '7eb285ce156cbbe7521beb29d04646f41e228c33b4284146dfa6aef53ec2a858'
            '70c21e11ef3eb0ebc4eaf86aed83875b6d4792b57656133c64f9cf90e6dd7a5a'
            '09988b40d54beebfd27f975c9862e7962461b7e15e7b1d66dca39acd4b48f03d')
_electron=electron23

pkgver(){
    cd ${srcdir}/learnX-companion
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build(){
    cd ${srcdir}/learnX-companion
    node /usr/lib/node_modules/corepack/dist/pnpm.js install
    node /usr/lib/node_modules/corepack/dist/pnpm.js run build
    node /usr/lib/node_modules/corepack/dist/pnpm.js electron-builder --dir
}

package_learnx-companion-git(){
    mkdir -p ${pkgdir}/opt/learnX-companion
    mkdir -p ${pkgdir}/usr/bin
    cd ${srcdir}/learnX-companion/dist/linux-unpacked
    cp -a * ${pkgdir}/opt/learnX-companion
    cd ${srcdir}
    install -Dm644 icon_256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/learnX-companion.png
    install -Dm644 learnX-companion.desktop ${pkgdir}/usr/share/applications/learnX-companion.desktop
    ln -s /opt/learnX-companion/learnx-companion ${pkgdir}/usr/bin/learnX-companion
}
package_learnx-companion-electron-git(){
    depends+=("${_electron}")
    pkgdesc+='(using system electron)'

    mkdir -p ${pkgdir}/usr/lib/learnX-companion
    cd ${srcdir}/learnX-companion/dist/linux-unpacked/resources
    cp -a * ${pkgdir}/usr/lib/learnX-companion
    cd ${srcdir}
    install -Dm644 icon_256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/learnX-companion.png
    install -Dm644 learnX-companion.desktop ${pkgdir}/usr/share/applications/learnX-companion.desktop
    install -Dm644 wrapper.js ${pkgdir}/usr/lib/learnX-companion
    install -Dm755 _learnX-companion ${pkgdir}/usr/bin/learnX-companion
    sed -i "s/^electron[0-9]*/${_electron}/" ${pkgdir}/usr/bin/learnX-companion
}

# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=soundnode-git
pkgver=r909.04ddd01
pkgrel=1
pkgdesc="An opensource SoundCloud app for desktop"
arch=('x86_64' 'i686')
url="https://soundnode.github.io/soundnode-website/"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
_name=soundnode-app
source=("soundnode-app::git+https://github.com/Soundnode/soundnode-app"
        'soundnode.desktop')
sha256sums=('SKIP'
            'b5534a261b91881fe173052c9ede70dc385f105b5d7586af16edab079a115270')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_name}
    npm i
    npm run package:linux
}

package() {
    cd ${_name}/dist/Soundnode/Soundnode-linux-x64
    install -d ${pkgdir}/usr/{bin,share/{applications,pixmaps,licenses/${_name}}}
    install -d ${pkgdir}/opt/soundnode
    install -D ${srcdir}/../soundnode.desktop ${pkgdir}/usr/share/applications/
    install -D ${srcdir}/${_name}/app/soundnode.png ${pkgdir}/usr/share/pixmaps/

    ln -s /opt/soundnode/Soundnode ${pkgdir}/usr/bin/soundnode
    cp -r * ${pkgdir}/opt/soundnode
    cp -r ${pkgdir}/opt/soundnode/resources/app/LICENSE.md ${pkgdir}/usr/share/licenses/${_name}/
    mv ${pkgdir}/opt/soundnode/LICENS{E,ES.chromium.html} ${pkgdir}/usr/share/licenses/${_name}/
}

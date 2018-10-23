# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=atom-editor-git
pkgver=1.6.0.beta0.r8187.gec945d03c
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century - git channel.'
url="https://atom.io/"
arch=('x86_64' 'i686')
license=('MIT', 'custom')
depends=('gconf' 'nodejs' 'npm' 'libsecret' 'python2' 'libx11' 'libxkbfile' 'electron' 'apm')
optdepends=('gvfs: file deletion support'
            'ctags: symbol indexing support')
source=("${pkgname}::git+https://github.com/atom/atom.git"
        'dugite-use-system-git.patch'
        'fix-atom-sh.patch'
        'fix-license-path.patch'
        'fix-restart.patch'
        'symbols-view-use-system-ctags.patch'
        'use-system-apm.patch'
        'use-system-electron.patch'
        'atom.js'
        'atom.desktop')
sha256sums=('SKIP'
            '530b46d31df0f5e8f5881e1608a66fe75d549092a6db2e72ba3ad69c48714153'
            'ab9eed3d4c8bfefea256953428379ab1e636b9c7d4c4af30ddc3f485330183c2'
            'c8a931f36af3722c57c4d1b70c1e58aa1a18372e8e26c28a4e01253e05295205'
            '1f48c84f30ffefaef7235d8231af7357b801d66de9f09921d0ee0dd5849595ca'
            '3c68e6b3751313e1d386e721f8f819fb051351fb2cf8e753b1d773a0f475fef8'
            '32e27c6245237a794b15eaf7dbfb81196455865af8ed9157aca763ed21a2fef3'
            '8427b38936c4f01ceed4d171528ee375ce211fac01fb220b1596d3a074b31663'
            'cdf87ab82cfcf69e8904684c59b08c35a68540ea16ab173fce06037ac341efcd'
            'bce0b6ac4a3d083db3b953d89489947867df5832deea876cc8c4725399b1de9d')
pkgver() {
    cd ${pkgname}
    # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname}

    patch -Np1 -i "${srcdir}"/fix-atom-sh.patch
    patch -Np1 -i "${srcdir}"/use-system-electron.patch
    patch -Np1 -i "${srcdir}"/use-system-apm.patch
    patch -Np1 -i "${srcdir}"/fix-license-path.patch
    patch -Np1 -i "${srcdir}"/fix-restart.patch
}

build() {
    cd ${pkgname}

    ATOM_RESOURCE_PATH="${PWD}" npm_config_target=$(tail -c +2 /usr/lib/electron/version) apm install

    # Use system ctags
    cd "${srcdir}/${pkgname}/node_modules/symbols-view"
    patch -Np1 -i "${srcdir}"/symbols-view-use-system-ctags.patch
    rm -r vendor

    # Use system git
    cd "${srcdir}/${pkgname}/node_modules/dugite"
    patch -Np1 -i "${srcdir}"/dugite-use-system-git.patch
    rm -r git

    cd "${srcdir}/${pkgname}/script"
    npm install
    ./build
}

package() {
    cd ${pkgname}

    install -d -m 755 "${pkgdir}"/usr/lib
    cp -r out/app "${pkgdir}"/usr/lib/atom
    install -m 644 out/startup.js "${pkgdir}"/usr/lib/atom
    install -m 755 "${srcdir}/atom.js" "${pkgdir}"/usr/lib/atom/atom  
    install -d -m 755 "${pkgdir}/usr/share/applications"
    install -m 644 "${srcdir}/atom.desktop" "${pkgdir}/usr/share/applications/atom.desktop"

    for size in 16 24 32 48 64 128 256 512 1024; do
      install -D -m 644 resources/app-icons/stable/png/${size}.png \
              "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/atom.png
    done
    ln -sf ../../../share/icons/hicolor/1024x1024/apps/atom.png \
        "${pkgdir}"/usr/lib/atom/resources/atom.png
  
    install -D -m 755 atom.sh "${pkgdir}/usr/bin/atom"
  
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    node -e "require('./script/lib/get-license-text')().then((licenseText) => require('fs').writeFileSync('${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md', licenseText))"
  
    # Remove useless stuff
    find "${pkgdir}"/usr/lib/atom/node_modules \
        -name "*.a" -exec rm '{}' \; \
        -or -name "*.bat" -exec rm '{}' \; \
        -or -name "*.node" -exec chmod a-x '{}' \; \
        -or -name "benchmark" -prune -exec rm -r '{}' \; \
        -or -name "doc" -prune -exec rm -r '{}' \; \
        -or -name "html" -prune -exec rm -r '{}' \; \
        -or -name "man" -prune -exec rm -r '{}' \; \
        -or -name "scripts" -prune -exec rm -r '{}' \; \
        -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
        -or -path "*/task-lists/src" -prune -exec rm -r '{}' \;
}

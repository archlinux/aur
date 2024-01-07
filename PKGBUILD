# Maintainer: Infernio <infernio at icloud dot com>

pkgname=wrye-bash
pkgver=312.1
pkgrel=1
pkgdesc="A swiss army knife for modding Bethesda games"
arch=('any')
license=('GPL3')
url="https://github.com/wrye-bash/wrye-bash"
depends=('binutils' 'hicolor-icon-theme' 'p7zip' 'python' 'python-chardet' 'python-lz4' 'python-reflink' 'python-vdf' 'python-wxpython' 'python-yaml' 'xdg-utils')
optdepends=('python-lxml: FOMOD schema validation'
            'python-pymupdf: PDF support in the doc browser'
            'python-requests: Various Internet-based functionality'
            'python-send2trash: Recycle instead of delete files'
            'python-websocket-client: NexusMods integration (currently unused)')
makedepends=('python-pygit2')
backup=('opt/wrye-bash/bash.ini')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wrye-bash/wrye-bash/archive/v${pkgver}.tar.gz"
        "wrye-bash"
        "wrye-bash.desktop"
        "0001-Make-BashBugDump-work-globally.patch"
        "0002-Add-support-for-global-docs-to-readme_url.patch")
sha256sums=('8c61e30cc79142ddd20c32ae6f83d1d10ad6ea9125d32e26bf0de3a0367b9a57'
            'ae3dedbd0dfba70bf159e7420e98e9ccd906b9e7c5a602588869d39849302a93'
            'dd2c34488c4d8f3f43311bdcf9c32d6e7645933eb32eb03f0456adfbed35594f'
            '67a283615cb8f6eea643b0cdce874cc563a4b50edca00af0bd6351e2dbdfe3b5'
            '24831df3a9fbbbb4347eed3cc0ddce6222d8b1b4051cc7c56f28400de974ec24')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Apply the patchset to make WB (mostly) work as a global installation on Linux
    patch -Np1 -i ../0001-Make-BashBugDump-work-globally.patch
    patch -Np1 -i ../0002-Add-support-for-global-docs-to-readme_url.patch

    # Update checking is pointless with pacman available
    sed -i "s/'bash.update_check.enabled': True/'bash.update_check.enabled': False/" Mopy/bash/basher/constants.py

    # Useless binary bloat on Linux
    rm -rf Mopy/bash/compiled

    # Download the taglists if they're missing
    python scripts/update_taglist.py
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Compile all WB source files
    /usr/bin/python -O -m compileall Mopy/bash
}

package() {
    # Install a small script to launch WB
    install -Dm755 wrye-bash "${pkgdir}/usr/bin/wrye-bash"

    # Install a desktop entry, we'll install the logo from the downloaded source
    install -Dm644 wrye-bash.desktop "${pkgdir}/usr/share/applications/wrye-bash.desktop"

    cd "${srcdir}/${pkgname}-${pkgver}"

    # The aforementioned logo
    install -Dm644 Mopy/bash/images/bash.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wrye-bash.svg"

    # Install the data and code to /opt
    mkdir -p "${pkgdir}"/opt/$pkgname
    cp -a "Mopy/Bash Patches" "${pkgdir}"/opt/$pkgname
    cp -a "Mopy/bash" "${pkgdir}"/opt/$pkgname
    cp -a "Mopy/taglists" "${pkgdir}"/opt/$pkgname
    cp -a "Mopy/templates" "${pkgdir}"/opt/$pkgname
    install -Dm644 "Mopy/Wrye Bash Launcher.pyw" "${pkgdir}"/opt/$pkgname

    # There's no need to package the tests
    rm -r "${pkgdir}"/opt/$pkgname/bash/tests

    # pacman handles changing config files fine, so skip the _default.ini
    install -Dm644 "Mopy/bash_default.ini" "${pkgdir}"/opt/$pkgname/bash.ini

    # Install the license to /usr
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
    install -Dm644 Mopy/LICENSE-THIRD-PARTY "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-THIRD-PARTY

    # Install the docs to /usr, edited to make them work with the local fs layout
    mkdir -p "${pkgdir}"/usr/share/doc
    find Mopy/Docs -type f -iname "*.html" -exec sed -i "s|../bash/|/opt/wrye-bash/bash/|" {} \;
    find Mopy/Docs -type f -iname "*.css" -exec sed -i "s|../../bash/|/opt/wrye-bash/bash/|" {} \;
    cp -a Mopy/Docs "${pkgdir}"/usr/share/doc/$pkgname
}

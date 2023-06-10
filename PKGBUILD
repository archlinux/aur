# Maintainer: Infernio <infernio at icloud dot com>

# Some notes:
#  - Most of the stuff in package() below should be moved to a WB script,
#    e.g. scripts/configure.py, so that we can maintain it upstream
#    in-tree. This would also make it possible to have a wrye-bash-git package
#    in the AUR, in addition to this stable package.
#  - Good news is that Python deployment is painless on Linux. An absolute
#    *dream* compared to the nightmare it is on Windows. Just stick the files
#    in the appropriate subfolders of /usr, make a small shell script in
#    /usr/bin that calls python, and tell the package manager which
#    dependencies you have.
#  - I have not added testing here yet, to add it:
#    - Change from GH archive to clone
#    - Init submodules
#    - Set the right checkdepends
#    - Add a check() calling pytest
#  - WB is not at all prepared to handle idiomatic Linux. Some quick notes:
#    - BashBugDump would need to be moved to e.g.
#      ~/.local/share/wrye-bash/BashBugDump.log - ref #352
#    - bash_default.ini is not necessary (package managers and users are used
#      to dealing with changing config files and have backup/diff/merge tools
#      for handling this, see backup= line below), but the config should go to
#      e.g. /etc/wrye-bash.d/bash.ini, with a layered config in
#      ~/.config/wrye-bash/bash.ini (this is a great idea no matter what, we
#      should add it to Windows as well - plus we'll probably need another INI
#      layer once we get around to profiles anyway - ref #250)
#    - The docs should move to /usr/share/doc/wrye-bash (this is an issue since
#      we have several buttons in WB for opening the docs)
#    - The license should move to /usr/share/licenses/wrye-bash (not an issue,
#      can be done in the script)
#    - Bonus points for moving *out* of /opt and sticking our shared stuff into
#      /usr/share
pkgname=wrye-bash
pkgver=311
pkgrel=2
pkgdesc="A swiss army knife for modding Bethesda games"
arch=('x86_64')
license=('GPL3')
url="https://github.com/wrye-bash/wrye-bash"
depends=('p7zip' 'python' 'python-chardet' 'python-lz4' 'python-wxpython' 'python-yaml' 'xdg-utils')
optdepends=('python-lxml: FOMOD schema validation'
            'python-packaging: Download conditions during update check'
            'python-pymupdf: PDF support in the doc browser'
            'python-requests: Various Internet-based functionality'
            'python-send2trash: Recycle instead of delete files'
            'python-websocket-client: NexusMods integration (currently unused)')
makedepends=('python-pygit2')
backup=('opt/wrye-bash/Mopy/bash.ini')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wrye-bash/wrye-bash/archive/v${pkgver}.tar.gz"
        "wrye-bash"
        "wrye-bash.desktop"
        "0001-Make-BashBugDump-work-globally.patch"
        "0002-Add-support-for-global-docs-to-readme_url.patch")
sha256sums=('303a9b86023a8ee1ab00105ac982531e298c58e8da27e325c322a2723c6032a8'
            'a401d8f3aea3117585330037c23d0c7c1573c84c8affe1a2cfd08fe9341cb562'
            'dd2c34488c4d8f3f43311bdcf9c32d6e7645933eb32eb03f0456adfbed35594f'
            'f4bfc10dc5303e32fb2ee61c16474f1703b47281b68172d7919e90a686e0fbbe'
            'd7777835c35fb8919d07f80d971b72ff604c7cf40ae13ba50b3c8259ae85d837')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Apply the patchset to make WB (mostly) work as a global installation on Linux
    patch -Np1 -i ../0001-Make-BashBugDump-work-globally.patch
    patch -Np1 -i ../0002-Add-support-for-global-docs-to-readme_url.patch

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
    mkdir -p "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/Bash Patches" "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/bash" "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/taglists" "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/templates" "${pkgdir}"/opt/$pkgname/Mopy
    install -Dm644 "Mopy/Wrye Bash Launcher.pyw" "${pkgdir}"/opt/$pkgname/Mopy

    # pacman handles changing config files fine, so skip the _default.ini
    install -Dm644 "Mopy/bash_default.ini" "${pkgdir}"/opt/$pkgname/Mopy/bash.ini

    # Install the license to /usr
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
    install -Dm644 Mopy/LICENSE-THIRD-PARTY "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-THIRD-PARTY

    # Install the docs to /usr, edited to make them work with the local fs layout
    mkdir -p "${pkgdir}"/usr/share/doc
    find Mopy/Docs -type f -iname "*.html" -exec sed -i "s|../bash/|/opt/wrye-bash/Mopy/bash/|" {} \;
    find Mopy/Docs -type f -iname "*.css" -exec sed -i "s|../../bash/|/opt/wrye-bash/Mopy/bash/|" {} \;
    cp -a Mopy/Docs "${pkgdir}"/usr/share/doc/$pkgname
}

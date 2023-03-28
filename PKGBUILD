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
pkgver=310
pkgrel=1
pkgdesc="A swiss army knife for modding Bethesda games"
arch=('x86_64')
license=('GPL3')
url="https://github.com/wrye-bash/wrye-bash"
depends=('p7zip' 'python' 'python-chardet' 'python-lz4' 'python-wxpython' 'python-yaml' 'xdg-utils')
optdepends=('python-lxml: FOMOD schema validation'
            'python-pymupdf: PDF support in the doc browser')
backup=('opt/wrye-bash/Mopy/bash.ini')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wrye-bash/wrye-bash/archive/v${pkgver}.tar.gz"
        "wrye-bash"
        "wrye-bash.desktop"
        "0001-Some-minor-fixups-for-Linux.patch"
        "0002-Check-for-missing-bash-dir-instead.patch"
        "0003-Add-support-for-global-docs-to-readme_url.patch"
        "0004-Fix-wxGTK-status-bar-icons.patch")
sha256sums=('1f789324745e3fb7d15f67cc59254ab3d5232f7e4851483b56077f29a45e3dbb'
            'a401d8f3aea3117585330037c23d0c7c1573c84c8affe1a2cfd08fe9341cb562'
            'dd2c34488c4d8f3f43311bdcf9c32d6e7645933eb32eb03f0456adfbed35594f'
            '645147449c9612927011a5b6e491ac67b978752e94b07d19d18c5d1aacb1e90b'
            '1dee0e88b86dedf9874625a8acc98522b46e12cad7f87aacd84a85223911007d'
            '64fd53a7a20865759fc2378ecbfb64b6cf8ee048747d8e4128d84cf764c0b245'
            'a5a599cf478f6282025b2cbaa9767a09fdd9eb046c4bdffac02ec16a391e73ae')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Apply the patchset to make WB (mostly) work as a global installation on Linux
    patch -Np1 -i ../0001-Some-minor-fixups-for-Linux.patch
    patch -Np1 -i ../0002-Check-for-missing-bash-dir-instead.patch
    patch -Np1 -i ../0003-Add-support-for-global-docs-to-readme_url.patch
    patch -Np1 -i ../0004-Fix-wxGTK-status-bar-icons.patch

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
    # Uncomment in 311
    #install -Dm644 Mopy/LICENSE-THIRD-PARTY "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-THIRD-PARTY

    # Install the docs to /usr, edited to make them work with the local fs layout
    mkdir -p "${pkgdir}"/usr/share/doc
    find Mopy/Docs -type f -iname "*.html" -exec sed -i "s|../bash/|/opt/wrye-bash/Mopy/bash/|" {} \;
    cp -a Mopy/Docs "${pkgdir}"/usr/share/doc/$pkgname
}

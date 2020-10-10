# Maintainer: Infernio <infernio at icloud dot com>

# Some notes:
#  - Python 2, duh
#  - env.py blows up on import, duh
#  - Most of the stuff in package() below should be moved to a WB script,
#    e.g. scripts/configure.py, so that we can maintain it upstream
#    in-tree. This would also make it possible to have a wrye-bash-git package
#    in the AUR, in addition to this stable package.
#  - Good news is that Python deployment is painless on Linux. An absolute
#    *dream* compared to the nightmare it is on Windows. Just stick the files
#    in the appropriate subfolders of /usr, make a small shell script in
#    /usr/bin that calls python, and tell the package manager which
#    dependencies you have.
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
#    - pngcrush should probably be optional (not really a problem, it's
#      available on most distros)
#    - Should 7zip be required?
pkgname=wrye-bash
pkgver=307
pkgrel=1
pkgdesc="A swiss army knife for modding Bethesda games"
arch=('x86_64')
license=('GPL3')
url="https://github.com/wrye-bash/wrye-bash"
depends=('p7zip' 'pngcrush' 'python2' 'python2-chardet' 'python2-lz4' 'python2-scandir' 'python2-wxpython')
optdepends=('python2-scandir')
checkdepends=('python2-pytest' 'python2-toml')
backup=('opt/wrye-bash/Mopy/bash.ini')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wrye-bash/wrye-bash/archive/v${pkgver}.tar.gz"
        "wrye-bash"
        "wrye-bash.desktop"
        "wrye-bash.png"
        "0001-XXX-Run-on-Linux.patch"
        "0002-Check-for-missing-bash-dir-instead.patch"
        "0003-Centralize-readme-URL-handling.patch"
        "0004-Some-minor-fixups-for-Linux.patch"
        "0005-Special-case-more-wxGTK-fixes.patch")
sha256sums=('1534f55ba44e55830adbf208b1ad891399ab58ce4306515a5c3690ce31c1bd39'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Apply the patchset to make WB kinda work on Linux
    patch -Np1 -i ../0001-XXX-Run-on-Linux.patch
    patch -Np1 -i ../0002-Check-for-missing-bash-dir-instead.patch
    patch -Np1 -i ../0003-Centralize-readme-URL-handling.patch
    patch -Np1 -i ../0004-Some-minor-fixups-for-Linux.patch
    patch -Np1 -i ../0005-Special-case-more-wxGTK-fixes.patch

    # Useless binary bloat on Linux
    rm -rf Mopy/bash/compiled
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Compile all WB source files
    /usr/bin/python2 -OO -m compileall Mopy/bash
}

# Currently broken due to missing submodule, would probably have to git clone
# and then submodule init instead
#check() {
#    cd "${srcdir}/${pkgname}-${pkgver}"
#
#    python2 -m pytest
#}

package() {
    # Install a small script to launch WB
    install -Dm755 wrye-bash "${pkgdir}/usr/bin/wrye-bash"

    # Install a desktop entry and logo
    install -Dm644 wrye-bash.desktop "${pkgdir}/usr/share/applications/wrye-bash.desktop"
    install -Dm644 wrye-bash.png "${pkgdir}/usr/share/pixmaps/wrye-bash.png"

    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the data and code to /opt
    mkdir -p "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/Bash Patches" "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/bash" "${pkgdir}"/opt/$pkgname/Mopy
    cp -a "Mopy/templates" "${pkgdir}"/opt/$pkgname/Mopy
    install -Dm644 "Mopy/Wrye Bash Launcher.pyw" "${pkgdir}"/opt/$pkgname/Mopy

    # pacman handles changing config files fine, so skip the _default.ini
    install -Dm644 "Mopy/bash_default.ini" "${pkgdir}"/opt/$pkgname/Mopy/bash.ini

    # Install the license to /usr
    mkdir -p "${pkgdir}"/usr/share/licenses/$pkgname
    install -Dm644 Mopy/license.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

    # Install the docs to /usr, edited to make them work with the local fs layout
    mkdir -p "${pkgdir}"/usr/share/doc
    find Mopy/Docs -type f -iname "*.html" -exec sed -i "s|../bash/|/opt/wrye-bash/Mopy/bash/|" {} \;
    cp -a Mopy/Docs "${pkgdir}"/usr/share/doc/$pkgname
}

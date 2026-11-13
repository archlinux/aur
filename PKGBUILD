# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=custom-toolbox
pkgver=26.11
# Must stay >= the AUR package's pkgrel (currently 26.09.5-2). A repo package
# blocks AUR helpers from updating it, so a lower pkgrel here would pin users
# to a downgrade. Do not "tidy" this back to 1.
pkgrel=1
pkgdesc="A customizable toolbox application built with Qt"
arch=('x86_64')
url="https://github.com/MX-Linux/custom-toolbox"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-declarative' 'qt6-tools')
source=("https://github.com/MX-Linux/custom-toolbox/archive/refs/tags/26.11.tar.gz")
sha256sums=('a3440acb099d560b16fcbb5e501d53ce952f3d3e35aeac8a9bb273e0325efd05')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="custom-toolbox-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

    # Get version from pkgver (strip any extra pkgver info for CMake)
    _version="${pkgver}"

    # Configure with CMake, passing version override
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="$_version"

    # Build
    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    # Install binary
    install -Dm755 build/custom-toolbox "${pkgdir}/usr/bin/custom-toolbox"

    # Install translations
    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/custom-toolbox/locale/" build/*.qm

    # Install config files
    install -dm755 "${pkgdir}/etc/custom-toolbox"
    install -Dm644 custom-toolbox.conf "${pkgdir}/etc/custom-toolbox/custom-toolbox.conf"
    install -Dm644 example.list "${pkgdir}/etc/custom-toolbox/example.list"

    # Install desktop file
    install -Dm644 custom-toolbox.desktop "${pkgdir}/usr/share/applications/custom-toolbox.desktop"

    # Install icons
    install -Dm644 icons/custom-toolbox.svg "${pkgdir}/usr/share/pixmaps/custom-toolbox.svg"
    install -Dm644 icons/custom-toolbox.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/custom-toolbox.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/custom-toolbox"

    install -Dm644 help/custom-toolbox.1 "${pkgdir}/usr/share/man/man1/custom-toolbox.1"
    if [ -d help ]; then
        for help_file in help/*.html help/*.jpg help/*.png help/*.css; do
            [ -f "$help_file" ] && install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/custom-toolbox/$(basename "$help_file")"
        done
    fi

    # Install changelog
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/custom-toolbox/changelog.gz"
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

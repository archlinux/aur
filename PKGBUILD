# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=mx-datetime
pkgver=26.11
pkgrel=1
pkgdesc="Date and time configuration tool for MX Linux"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-datetime"
license=('Apache')
depends=('chrony' 'util-linux' 'qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-datetime/archive/refs/tags/26.11.tar.gz")
sha256sums=('5b909266a13cd4d96e5af9e20a43e2868d96f65d6c191285123d42e1ca822226')

# Unlike the other MX repos, dpkg-source packed this tarball from a directory
# called "mx-datetime" rather than "src", so that - not "src" and not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-datetime-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-datetime \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/mx-datetime "${pkgdir}/usr/bin/mx-datetime"

    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/mx-datetime/locale/" build/*.qm

    install -dm755 "${pkgdir}/usr/lib/mx-datetime"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-datetime/helper"

    install -Dm644 build/org.mxlinux.pkexec.mx-datetime-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-datetime-helper.policy"

    install -Dm644 mx-datetime.desktop "${pkgdir}/usr/share/applications/mx-datetime.desktop"

    install -Dm644 images/mx-datetime.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mx-datetime.png"
    install -Dm644 images/mx-datetime.png "${pkgdir}/usr/share/pixmaps/mx-datetime.png"
    install -Dm644 images/mx-datetime.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-datetime.svg"

    install -dm755 "${pkgdir}/usr/share/doc/mx-datetime"

    # -t is required: "install -D" treats its last argument as a file
    # path even with one source, so this failed with "cannot create regular
    # file '.../man1/': Not a directory" and the suppression hid it.
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "help"/*.1
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-datetime/changelog.gz"
    fi
    if [ -d "help" ]; then
        for help_file in "help"/*.html "help"/*.jpg "help"/*.png "help"/*.css; do
            # "|| continue", not "&& install": this loop is the last statement in
            # package(), and a glob that matches nothing makes the final
            # iteration's test fail, so the loop - and the function - return 1
            # and makepkg aborts. help/*.jpg already matches nothing here.
            [ -f "$help_file" ] || continue
            install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/mx-datetime/$(basename "$help_file")"
        done
    fi
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=formatusb
pkgver=26.11
pkgrel=1
pkgdesc="USB Device Formatting Utility"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/formatusb"
license=('GPL3')
depends=(
    'qt6-base'
    'parted'
    'dosfstools'
    'e2fsprogs'
    'exfatprogs'
    'ntfs-3g'
    'coreutils'
    'util-linux'
)
makedepends=('qt6-tools' 'cmake' 'ninja')
source=("https://github.com/MX-Linux/formatusb/archive/refs/tags/26.11.tar.gz")
sha256sums=('efa354b6dfee34aa52982c1015fa360785e24cf220ac9f8b273cd6466ecbcf70')

# Unlike the other MX repositories, whose tarballs unpack to "src", dpkg-source
# packed this one from a directory called "formatusb", so that - and not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="formatusb-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

    rm -rf build

    mkdir -p build
    cd build

    cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build . -j$(nproc)
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/formatusb "${pkgdir}/usr/bin/formatusb"

    install -Dm755 lib/formatusb_lib "${pkgdir}/usr/lib/formatusb/formatusb_lib"

    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/formatusb/locale/" build/*.qm

    install -Dm644 polkit-actions/org.mxlinux.pkexec.formatusb.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.formatusb.policy"

    install -Dm644 formatusb.desktop "${pkgdir}/usr/share/applications/formatusb.desktop"

    install -Dm644 formatusb.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/formatusb.png"
    install -Dm644 formatusb.png "${pkgdir}/usr/share/pixmaps/formatusb.png"
    install -Dm644 formatusb.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/formatusb.svg"

    install -dm755 "${pkgdir}/usr/share/doc/formatusb"

    # -t is required: "install -D" treats its last argument as a file
    # path even with one source, so this failed with "cannot create regular
    # file '.../man1/': Not a directory" and the suppression hid it.
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" help/*.1
    install -Dm644 authors.txt "${pkgdir}/usr/share/doc/formatusb/authors.txt"
    install -Dm644 license.html "${pkgdir}/usr/share/doc/formatusb/license.html"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/formatusb/changelog.gz"
    if [ -d "help" ]; then
        for help_file in help/*.html help/*.jpg help/*.png help/*.css; do
            [ -f "$help_file" ] && install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/formatusb/help/$(basename "$help_file")"
        done
    fi

    install -Dm644 scripts/cli-shell-utils.bash "${pkgdir}/usr/lib/cli-shell-utils/cli-shell-utils.bash"

    install -Dm755 scripts/vmlinuz-version "${pkgdir}/usr/lib/cli-shell-utils/bin/vmlinuz-version"
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

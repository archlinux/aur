# Maintainer: Adrian <adrian@mxlinux.org>
# Contributor: dolphinoracle <dolphinoracle@gmail.com>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. Unlike the MX repositories this
# one does not commit its source tarball - debs/ exists on disk but nothing
# under it is tracked - so the OBS tar_scm service packs the git checkout into a
# tarball under a constant name, which is what source= below refers to.
#
# pkgver() below reads the newest tag reachable from the packed checkout, so a
# tag-push-triggered rebuild (see .obs/workflows.yml) picks up the new version
# on its own instead of needing a manual bump here. git tag --sort=-v:refname
# was tried first, but its lexical version sort ranks 26.5mx5 above 26.09.1, so
# it uses git describe, which walks history from HEAD instead.

pkgname=gazelle-installer
pkgver=26.10mx25
pkgrel=1
pkgdesc="Customizable GUI installer ported from MX Linux and antiX"
arch=('x86_64' 'i686')
url="https://github.com/gazelle-installer"
license=('Apache')
options=('!emptydirs')
depends=(
    'qt6-base'
    'qt6-svg'
    'dosfstools'
    'gptfdisk'
    'grub'
    'ncurses'
    'os-prober'
    'parted'
)
makedepends=(
    'cmake>=3.31'
    'ninja>=1.12'
    'ncurses'
    'qt6-tools'
)
optdepends=(
    'gparted: graphical partition manager'
    'partitionmanager: KDE partition manager'
    'cryptsetup: LUKS encryption support'
)
source=("https://github.com/gazelle-installer/gazelle-installer/archive/refs/tags/26.10mx25.tar.gz")
sha256sums=('6656c1db33a6fdfa4d1643be6b86b0cbc538a1a68cde1acd3951a82371628499')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="gazelle-installer-26.10mx25"

build() {
    cd "${srcdir}/${_srcdir}"
    local version_tag
    version_tag="$(pkgver)"

    # GAZELLE_VERSION_SOURCE=tag with an explicit tag: the default source reads
    # debian/changelog through dpkg-parsechangelog, which does not exist on
    # Arch, and the fallback would stamp the binary with the CMake project
    # version (6.0) instead of the real one.
    cmake --preset arch \
        -DUSE_ZXCVBN=OFF \
        -DGAZELLE_VERSION_SOURCE=tag \
        -DGAZELLE_VERSION_TAG="${version_tag}"
    cmake --build --preset arch
}

package() {
    cd "${srcdir}/${_srcdir}"

    # Install binaries - install -D creates parent dirs but pacman handles shared dirs correctly
    install -Dm755 "_build_/arch/Release/minstall" "${pkgdir}/usr/bin/minstall"
    install -Dm755 "_build_/arch/qtui/Release/libqtui.so" "${pkgdir}/usr/lib/libqtui.so"
    install -Dm755 "scripts/minstall-launcher" "${pkgdir}/usr/bin/minstall-launcher"
    install -Dm755 "scripts/oobe.sh" "${pkgdir}/usr/bin/oobe.sh"
    install -Dm755 "scripts/guess-hwclock" "${pkgdir}/usr/bin/guess-hwclock"
    install -Dm755 "scripts/oobe" "${pkgdir}/etc/init.d/oobe"

    # Install desktop and data files
    install -Dm644 "minstall.desktop" "${pkgdir}/usr/share/applications/minstall.desktop"
    install -Dm644 "locales.template" "${pkgdir}/usr/share/antiX/locales.template"

    # Create desktop shortcut for new users
    install -dm755 "${pkgdir}/etc/skel/Desktop"
    ln -s /usr/share/applications/minstall.desktop "${pkgdir}/etc/skel/Desktop/Installer.desktop"

    # Install polkit rules
    for policy in polkit/*.policy; do
        install -Dm644 "$policy" "${pkgdir}/usr/share/polkit-1/actions/$(basename $policy)"
    done

    # Avoid shipping /usr/sbin (conflicts with base filesystem symlink on Arch)
    if [ -d "${pkgdir}/usr/sbin" ]; then
        rmdir --ignore-fail-on-non-empty "${pkgdir}/usr/sbin" 2>/dev/null || true
    fi

    # Install translation files
    for qm in _build_/arch/*.qm; do
        [ -f "$qm" ] && install -Dm644 "$qm" "${pkgdir}/usr/share/gazelle-installer/locale/$(basename $qm)"
    done

    # Install documentation
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/gazelle-installer/LICENSE"
    install -Dm644 "NOTICE" "${pkgdir}/usr/share/doc/gazelle-installer/NOTICE"

    # Install man page
    install -Dm644 "man/minstall.1" "${pkgdir}/usr/share/man/man1/minstall.1"
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

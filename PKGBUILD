# Maintainer: dolphinoracle <dolphinoracle@gmail.com>
pkgname=gazelle-installer
pkgver=26.5.3arch
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
    'os-prober'
    'parted'
)
makedepends=(
    'cmake>=3.31'
    'ninja>=1.12'
    'qt6-tools'
)
optdepends=(
    'gparted: graphical partition manager'
    'partitionmanager: KDE partition manager'
    'cryptsetup: LUKS encryption support'
)
source=("https://github.com/gazelle-installer/gazelle-installer/archive/refs/tags/26.5.3arch.tar.gz")
sha256sums=('e029c2db97098da88b4ed228e95db2906d6528504d1e36a2ba43db37aceebdaa')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake --preset arch \
        -DUSE_ZXCVBN=OFF \
        -DGAZELLE_VERSION_SOURCE=tag \
        -DGAZELLE_VERSION_TAG="${pkgver}"
    cmake --build --preset arch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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

}

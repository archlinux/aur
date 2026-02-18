# Maintainer: dolphinoracle <dolphinoracle@gmail.com>
pkgname=gazelle-installer
pkgver=26.02
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
source=("https://github.com/gazelle-installer/gazelle-installer/archive/refs/tags/26.02.tar.gz")
sha256sums=('2f36b146b68dd5c80e1e1cba05faf7ed8a75fbc4f65e5a59fa82301290cd1493')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake --preset arch -DUSE_ZXCVBN=OFF
    cmake --build --preset arch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install binaries - install -D creates parent dirs but pacman handles shared dirs correctly
    install -Dm755 "_build_/arch/Release/minstall" "${pkgdir}/usr/bin/minstall"
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
    install -Dm644 "debian/copyright" "${pkgdir}/usr/share/doc/gazelle-installer/copyright"
}

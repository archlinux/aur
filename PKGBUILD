# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: Simon Kronberg <Simon.Kronberg at gmail dot com>

pkgname=waterfox-classic-bin
pkgver=2020.02.1
pkgrel=1
pkgdesc="Customizable privacy conscious web browser with primary support for legacy extensions"
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL')
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
    'hunspell' 'ttf-font' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
    'libnotify: Notification integration'
    'pulseaudio: Audio support'
    'alsa-lib: Audio support'
    'speech-dispatcher: Text-to-Speech')
provides=("waterfox-classic=${pkgver}")
conflicts=('waterfox-classic')
replaces=('waterfox-bin')

source=(
    'waterfox-classic.desktop'
    'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2'
)

package() {
    # Create the directories.
    install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

    # Install the desktop and the icon files.
    install -m644 "${srcdir}"/waterfox-classic.desktop "${pkgdir}"/usr/share/applications/

    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Tsf "${srcdir}"/waterfox-classic/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-classic.png"
    done

    # Copy the directory to /opt
    cp -r waterfox-classic "${pkgdir}"/opt/waterfox-classic

    # Install a wrapper to avoid confusion about binary path
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-classic" <<END
#!/bin/sh
exec /opt/waterfox-classic/waterfox "\$@"
END

    # Replace duplicate binary with wrapper
    # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
    ln -srf "$pkgdir/usr/bin/waterfox-classic" \
        "$pkgdir/opt/waterfox-classic/waterfox-bin"

    # Use system-provided dictionaries
    rm -r "$pkgdir"/opt/waterfox-classic/dictionaries
    ln -Ts /usr/share/hunspell "$pkgdir/opt/waterfox-classic/dictionaries"
    ln -Ts /usr/share/hyphen "$pkgdir/opt/waterfox-classic/hyphenation"
}

sha256sums=('a364e830e980417095a5a45fb2c9c635fa8d248884816c26e3f31ce993130537'
            'fdb29a5504f378165a8c126772f419472ff3e4e058abe901f29068ff12ff521e')

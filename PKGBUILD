# Maintainer: Ron Brand <ronb1964@gmail.com>
pkgname=tuxtalk-appimage
pkgver=0.17.0
pkgrel=1
pkgdesc="Voice dictation for Linux: hold a key, talk, and your words are typed for you"
arch=('x86_64')
url="https://tuxtalk.app/"
license=('MIT')
# The AppImage itself bundles libayatana-appindicator3 with its dbusmenu
# libraries, and ydotool, ydotoold and wl-clipboard, so those depends are
# belt and braces. They stay until a clean Arch install has been tested
# without them. The AppImage needs fusermount to mount itself, which fuse2
# provides (fuse3's fusermount3 works too).
depends=('fuse2' 'ydotool' 'wl-clipboard' 'libayatana-appindicator')
optdepends=(
    'pipewire-pulse: PipeWire audio support'
    'pulseaudio: PulseAudio support'
)
# Called TalkType (talktype-appimage) until 0.15.0. replaces= lets pacman and
# AUR helpers swap the old package for this one; the AUR merge request moves
# the old package's votes and watchers here.
provides=('tuxtalk' 'talktype')
conflicts=('talktype' 'talktype-appimage')
replaces=('talktype-appimage')
options=('!strip')
# Removes the hotkey helper TuxTalk set up when the package goes.
install=tuxtalk-appimage.install
source=("TuxTalk-v${pkgver}-x86_64.AppImage::https://github.com/ronb1964/TuxTalk/releases/download/v${pkgver}/TuxTalk-v${pkgver}-x86_64.AppImage"
        "tuxtalk.desktop")
sha256sums=('635f8bb5021f05f67136e8f1b510787de71214c26a4b142816d3caa89c7c133c'
            'SKIP')
noextract=("TuxTalk-v${pkgver}-x86_64.AppImage")

package() {
    # Install AppImage
    install -Dm755 "TuxTalk-v${pkgver}-x86_64.AppImage" "${pkgdir}/opt/tuxtalk/TuxTalk.AppImage"
    # The path before the 0.15.0 rename: a TalkType launch-at-login entry
    # still starts it at the first login after this update (TuxTalk rewrites
    # the entry once it runs).
    install -dm755 "${pkgdir}/opt/talktype"
    ln -s /opt/tuxtalk/TuxTalk.AppImage "${pkgdir}/opt/talktype/TalkType.AppImage"

    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/tuxtalk" << 'EOF'
#!/bin/bash
exec /opt/tuxtalk/TuxTalk.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/tuxtalk"
    # The command before the 0.15.0 rename, for old shortcuts and scripts.
    ln -s tuxtalk "${pkgdir}/usr/bin/talktype"

    # Install desktop file
    install -Dm644 tuxtalk.desktop "${pkgdir}/usr/share/applications/tuxtalk.desktop"

    # Extract and install icon from AppImage.
    #
    # The icon inside the AppImage is io.github.ronb1964.TuxTalk.png. It used
    # to be talktype.png, and this step hardcoded that old name behind
    # `2>/dev/null || true`, so after the rename it failed silently and the
    # package shipped with no icon at all for several releases. Glob for any
    # top-level PNG so a future rename cannot repeat that, and fail loudly if
    # none is found rather than quietly producing a package without an icon.
    cd "${srcdir}"
    chmod +x "TuxTalk-v${pkgver}-x86_64.AppImage"
    ./"TuxTalk-v${pkgver}-x86_64.AppImage" --appimage-extract 'io.github.ronb1964.TuxTalk.png' >/dev/null 2>&1 || true
    if [[ ! -f squashfs-root/io.github.ronb1964.TuxTalk.png ]]; then
        # Fall back to a full extract in case the icon was renamed again.
        ./"TuxTalk-v${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null 2>&1 || true
    fi

    _icon=$(find squashfs-root -maxdepth 1 -name '*.png' -print -quit 2>/dev/null)
    if [[ -z "${_icon}" ]]; then
        echo "ERROR: no icon found at the root of the AppImage." >&2
        echo "       Refusing to build a package with a missing icon." >&2
        return 1
    fi

    # Installed as tuxtalk.png to match Icon=tuxtalk in tuxtalk.desktop.
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/tuxtalk.png"

    rm -rf squashfs-root
}

# Maintainer: Lucas <lucasion@hotmail.com>

pkgname=brightbulb-git
_pkgname=brightbulb
_electron=electron43
# Placeholder: aur-publish.sh patches this to the real r<count>.<hash> before
# generating .SRCINFO. Keep it in the r-scheme; a bare 2.0.0 would sort *newer*
# than every r-version if it ever reached the AUR unpatched.
pkgver=r12.c21ee2a
pkgrel=1
pkgdesc="Open source Philips Hue control center with screen mirroring (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/LucasionGS/brightbulb"
license=('GPL-3.0-or-later')
depends=("$_electron")
makedepends=('git' 'nodejs' 'npm')
optdepends=(
    'wf-recorder: prompt-free screen capture on Hyprland, Sway and other wlroots compositors'
    'gpu-screen-recorder: prompt-free screen capture on GNOME, KDE and any other desktop'
    'ffmpeg: used by the gpu-screen-recorder and X11 capture methods'
    'grim: faster screen thumbnails on wlroots compositors'
    'xorg-xrandr: screen selection on X11'
    'gnome-keyring: encrypts the bridge keys (any Secret Service provider works)'
    'libsecret: imports bridge keys saved by BrightBulb 1.x'
    'xdg-desktop-portal: last-resort screen capture that asks which screen to share'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# v2 lives on its own branch until it is merged; drop "#branch=v2" after that.
source=("$_pkgname::git+https://github.com/LucasionGS/brightbulb.git#branch=v2")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/brightbulb"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    # The bundled Electron is only used to produce app.asar; the package runs
    # it on the system $_electron instead.
    make build
}

package() {
    make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr ELECTRON="$_electron" install
}

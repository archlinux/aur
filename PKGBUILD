# Maintainer: Lucas <lucasion@hotmail.com>
#
# The AUR copy of the Ionix system packages, built from the system/ directory
# of the public ionix-iso repository. aur-publish.sh patches pkgver to the real
# r<count>.<hash> before publishing, so a plain `yay -Syu` sees each publish as
# an upgrade; `yay -Syu --devel` also catches commits nobody published.
#
# The ISO builds the same packages from the working tree with ../../PKGBUILD.
# The two differ only in where the sources come from: keep everything else in
# sync between them.

pkgbase=ionix-system-git
pkgname=(ionix-base-git ionix-desktop-git ionix-server-git)
# Placeholder: aur-publish.sh patches this to the real r<count>.<hash> before
# generating .SRCINFO. Keep it in the r-scheme: a bare 0.1.0 would sort *newer*
# than every r-version if it ever reached the AUR unpatched.
pkgver=r7.b569b6e
pkgrel=1
pkgdesc="Ionix system files"
arch=('any')
url="https://github.com/LucasionGS/ionix-iso"
license=('GPL-3.0-or-later')
makedepends=('librsvg' 'make' 'git')
source=("ionix-iso::git+https://github.com/LucasionGS/ionix-iso.git")
sha256sums=('SKIP')

# Commits that touched system/ only, so an ISO-only change is not an upgrade.
# Must match aur-publish.sh and aur/build-aur.sh exactly.
pkgver() {
    cd "$srcdir/ionix-iso/system"
    printf "r%s.%s" "$(git rev-list --count HEAD -- .)" "$(git log -1 --format=%h -- .)"
}

build() {
    make -C "$srcdir/ionix-iso/system" BUILDDIR="$srcdir/build" build
}

# Every regular file under /etc is a config file: pacman keeps a local edit and
# writes the new version beside it as .pacnew.
_etc_backup() {
    mapfile -t backup < <(cd "$pkgdir" && find etc -type f 2>/dev/null | LC_ALL=C sort)
}

package_ionix-base-git() {
    pkgdesc="Ionix system files shared by the desktop and the server: styler and themes, shell config, GRUB theme (git)"
    depends=('bash' 'util-linux')
    optdepends=(
        'fish: the shell the Ionix config is written for'
        'oh-my-posh: the themed prompt'
        'btop: themed by the styler'
        'kmscon: the themed console (ionix-console-theme)'
        'grub: the Ionix boot menu theme'
    )
    provides=('ionix-base')
    conflicts=('ionix-base')

    make -C "$srcdir/ionix-iso/system" DESTDIR="$pkgdir" BUILDDIR="$srcdir/build" install-base
    _etc_backup
}

package_ionix-desktop-git() {
    pkgdesc="Ionix desktop: Hyprland defaults, session scripts, login modes, wallpaper (git)"
    depends=('ionix-base' 'hyprland' 'python')
    optdepends=(
        'ionix-quickshell-git: the Ionix bar, lock screen and greeter'
        'greetd: the graphical login (ionix-login-mode greeter)'
        'fprintd: fingerprint login (ionix-fingerprint)'
        'yay: optional software bundles from the AUR (ionix-extras)'
        'matugen: wallpaper-adaptive themes'
    )
    provides=('ionix-desktop')
    conflicts=('ionix-desktop' 'ionix-server')

    make -C "$srcdir/ionix-iso/system" DESTDIR="$pkgdir" BUILDDIR="$srcdir/build" install-desktop
    _etc_backup
}

package_ionix-server-git() {
    pkgdesc="Ionix server: first-boot firewall and snapshot setup (git)"
    depends=('ionix-base')
    optdepends=(
        'ufw: the firewall ionix-server-firstboot sets up'
        'snapper: the "Fresh install" snapshot ionix-server-firstboot takes'
    )
    provides=('ionix-server')
    conflicts=('ionix-server' 'ionix-desktop')

    make -C "$srcdir/ionix-iso/system" DESTDIR="$pkgdir" BUILDDIR="$srcdir/build" install-server
    _etc_backup
}

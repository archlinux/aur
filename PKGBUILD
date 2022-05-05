# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor in comments: Misc <https://aur.archlinux.org/account/misc/>
# Contributor in comments: SajeOne <https://aur.archlinux.org/account/SajeOne/>
# Contributor in email: tpenguinltg <https://aur.archlinux.org/account/tpenguinltg/>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=opsu-git
_pkgname=${pkgname%-git}
pkgver=0.16.1.r6.g28003bfb
pkgrel=2
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/itdelatrisu/opsu.git"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('SKIP'
            '4b065052fef55e1860a51dfa5af080930b1001e4c82cd8b3b0383bd68b239d382d788408235a7cb4fb4a1d04123a6049188a2e2c2d0e5fd08a3deb69da25fc2d'
            '94f6f2f2a7f5f104e1002869099daf2bc033764373c8f51b204152d6821070e4be25a0001bfdb8b5b2ef25046b0be214f640de5ff994eda9126a48495104e745')

pkgdesc="An open source osu!-client written in Java."
arch=('any')
url="https://itdelatrisu.github.io/opsu/"
license=('GPL3')
depends=('java-runtime<17' 'bash' 'hicolor-icon-theme'
         'xorg-xrandr'  # "[…] is a dependency for LWJGL. Had to search around for the fix after the
                        # application was throwing an unhandled exception because it couldn't
                        # detect monitors. Any chance this could be added to the dep list?"
                        # https://aur.archlinux.org/account/SajeOne
         )
optdepends=('ffmpeg: Background video playback')
makedepends=('java-environment<17' 'java-web-start' 'gradle6' 'git')

pkgver() {
    cd "$pkgname" || exit
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname" || exit

    # keep dependencies outside users home by setting GRADLE_USER_HOME
    GRADLE_USER_HOME="GRADLE_USER_HOME" gradle6 jar -PXDG=true -PexcludeFFmpeg
}

package() {
    # cut pkgver
    _pkgver=$(git -C "$pkgname" describe --tags | sed 's/-.*//')

    install -Dm644  "$pkgname/build/libs/$_pkgname-$_pkgver.jar" \
                    "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"

    install -Dm644  "$pkgname/res/logo.png" \
                    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.png"

    install -Dm644  "$pkgname.desktop" \
                    "$pkgdir/usr/share/applications/$_pkgname.desktop"

    install -Dm755  "$pkgname.sh" \
                    "$pkgdir/usr/bin/$_pkgname"
}

# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor in comments: Misc <https://aur.archlinux.org/account/misc/>
# Contributor in comments: SajeOne <https://aur.archlinux.org/account/SajeOne/>
# Contributor in email: tpenguinltg <https://aur.archlinux.org/account/tpenguinltg/>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=opsu
pkgver=0.16.1
pkgrel=2
changelog=.CHANGELOG
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/itdelatrisu/opsu/archive/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('5d3906c1e7bb97d9b4f44c3f99dab4db891dbfc219c97d170ecccf6050f045749386ddfcd3a6821bea7be2e02e5fc2d8128fa78a9289a8e690a578e9141f3d01'
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

build() {
    cd "$pkgname-$pkgver" || exit

    # keep dependencies outside users home by setting GRADLE_USER_HOME
    GRADLE_USER_HOME="GRADLE_USER_HOME" gradle6 jar -PXDG=true -PexcludeFFmpeg
}

package() {
    install -Dm644  "$pkgname-$pkgver/build/libs/$pkgname-$pkgver.jar" \
                    "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

    install -Dm644  "$pkgname-$pkgver/res/logo.png" \
                    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.png"

    install -Dm644  "$pkgname.desktop" \
                    "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm755  "$pkgname.sh" \
                    "$pkgdir/usr/bin/$pkgname"
}

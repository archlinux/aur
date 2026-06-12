# Maintainer: Juraci de Lima Vieira Neto <juraci.vieira@gmail.com>
pkgname=flowstate-bin
_appname=flowstate
pkgver=0.4.2
pkgrel=1
pkgdesc="Desktop focus and note-taking app (Electron + Vue)"
arch=('x86_64')
# Public binary releases (the FlowState source repo itself is private).
url="https://github.com/Juraci/flowstate-releases"
license=('LicenseRef-proprietary')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt'
         'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify'
         'libappindicator-gtk3')
provides=("$_appname=$pkgver")
conflicts=("$_appname")
options=('!strip' '!debug')
install="$pkgname.install"
source=("$_appname-$pkgver.pacman::$url/releases/download/v$pkgver/$_appname-$pkgver.pacman")
noextract=("$_appname-$pkgver.pacman")
sha256sums=('cdc86bcb53986ca9a97050c6c727ae97c1d02e7077861c1732f3489f92eb8b69')

package() {
    # The upstream release artifact is itself a pacman package; unpack its
    # payload (the filesystem tree) straight into $pkgdir.
    bsdtar -xpf "$srcdir/$_appname-$pkgver.pacman" -C "$pkgdir" opt usr

    # CLI launcher.
    install -d "$pkgdir/usr/bin"
    ln -s /opt/FlowState/flowstate "$pkgdir/usr/bin/flowstate"

    # Proprietary EULA bundled inside the app resources.
    install -Dm644 "$pkgdir/opt/FlowState/resources/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgdir/opt/FlowState/resources/THIRD-PARTY-NOTICES.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}

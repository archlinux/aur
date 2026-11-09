# Maintainer: raafat.turki <raafat.turki@protonmail.com>

pkgname=coredeck-bin
_name=CoreDeck
pkgver=0.16.0
pkgrel=2
pkgdesc='Native desktop command center for the Android SDK (AVDs, system images, APK inspection)'

arch=('x86_64' 'aarch64')
url='https://coredeck.dev'
license=('MIT')

depends=('curl' 'libglvnd' 'gcc-libs' 'glibc')
optdepends=('jdk-openjdk: JDK 17+ required by avdmanager and sdkmanager'
            'zenity: native file dialogs on GTK desktops'
            'kdialog: native file dialogs on KDE'
            'xdg-utils: open links and folders from the app')
provides=('coredeck')
conflicts=('coredeck')

options=('!strip' '!debug')
source=("$_name-$pkgver-LICENSE::https://raw.githubusercontent.com/devmuaz/$_name/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/devmuaz/$_name/releases/download/v$pkgver/coredeck-linux-x86-64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/devmuaz/$_name/releases/download/v$pkgver/coredeck-linux-arm64.tar.gz")

sha256sums=('d38b5905e96871c4c21563212bdb13d856663b2b94a57efcf8068ff537919706')
sha256sums_x86_64=('37d017b24d526977fa13ec052833027478b683ceda431177c17f515142f254ef')
sha256sums_aarch64=('eb6e88023c476bec7290d8b47ab8ba757ba4022026950d45f67cc285cb046f84')

package() {
  case "$CARCH" in
    x86_64)  _dir=coredeck-linux-x86-64 ;;
    aarch64) _dir=coredeck-linux-arm64 ;;
  esac

  install -dm755 "$pkgdir/opt/coredeck"
  cp -r "$srcdir/$_dir/." "$pkgdir/opt/coredeck/"
  chmod 755 "$pkgdir/opt/coredeck/$_name"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/coredeck/$_name" "$pkgdir/usr/bin/coredeck"

  install -dm755 "$pkgdir/usr/share"
  mv "$pkgdir/opt/coredeck/share/"* "$pkgdir/usr/share/"
  rmdir "$pkgdir/opt/coredeck/share"
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

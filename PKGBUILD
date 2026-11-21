# Maintainer: raafat.turki <raafat.turki@protonmail.com>

pkgname=coredeck-bin
_name=CoreDeck
pkgver=0.16.1
pkgrel=1
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
sha256sums_x86_64=('fca37fa333eb4b26424bcc3db5f622560b385fc67c333ebacc98d0dd86f05093')
sha256sums_aarch64=('97e8bb856e79ae5a24604e5e934b58afdb07d0284fe64dfc5abbec4d4acdf3f5')

package() {
  case "$CARCH" in
    x86_64)  _dir=coredeck-linux-x86-64 ;;
    aarch64) _dir=coredeck-linux-arm64 ;;
  esac

  install -Dm755 "$srcdir/$_dir/$_name" "$pkgdir/usr/lib/coredeck/$_name"
  install -dm755 "$pkgdir/usr/share/coredeck"

  cp -r "$srcdir/$_dir/assets" "$pkgdir/usr/share/coredeck/assets"
  cp -r "$srcdir/$_dir/share/." "$pkgdir/usr/share/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/coredeck" <<EOF
#!/bin/sh
export COREDECK_ASSETS_DIR=/usr/share/coredeck/assets
exec /usr/lib/coredeck/$_name "\$@"
EOF

  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

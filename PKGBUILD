# Maintainer: itonia149 <283548443+itonia149@users.noreply.github.com>
pkgname=silverbullet-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc='Local SilverBullet Markdown reader with desktop file integration and Obsidian vault support'
arch=('x86_64')
url='https://github.com/itonia149/silverbullet-desktop'
license=('MIT')
depends=('python>=3.10' 'systemd' 'xdg-utils' 'microsoft-edge-stable-bin')
makedepends=('unzip')
checkdepends=('desktop-file-utils')
optdepends=('kdialog: graphical error messages')
options=('!strip' '!debug')
_sbver=2.11.0
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "silverbullet-$_sbver.zip::https://github.com/silverbulletmd/silverbullet/releases/download/$_sbver/silverbullet-server-linux-x86_64.zip"
        "silverbullet-LICENSE-$_sbver.md::https://raw.githubusercontent.com/silverbulletmd/silverbullet/$_sbver/LICENSE.md")
sha256sums=('4794f29034d5c6dff8b1b45340f80caa6c26152f23f863305f80d1a45ece354d'
            '16ab986215ee28ebb53300de72e8a05554611355874b9592f1c4d8dca29f7288'
            'ccf525a3b5c9ac8d843e118932036e6517d4d603f9ff3e474522b632c3996c65')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest -v
  desktop-file-validate packaging/silverbullet-local.desktop
  python packaging/silverbullet-desktop-setup --help >/dev/null
}

package() {
  install -Dm755 "$srcdir/silverbullet" "$pkgdir/usr/lib/$pkgname/silverbullet"
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 open-silverbullet "$pkgdir/usr/bin/silverbullet-desktop"
  install -Dm755 packaging/silverbullet-desktop-setup "$pkgdir/usr/bin/silverbullet-desktop-setup"
  install -Dm644 packaging/silverbullet-local.desktop "$pkgdir/usr/share/applications/silverbullet-local.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/silverbullet-LICENSE-$_sbver.md" "$pkgdir/usr/share/licenses/$pkgname/SILVERBULLET-LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Maksymilian Jopek <maks.aur@jopek.eu>
pkgname=portablemc
pkgver=4.2.1
pkgrel=1
pkgdesc='An easy-to-use Python CLI Minecraft launcher'
arch=('any')
url='https://github.com/mindstorm38/portablemc'
license=('GPL3-only')
depends=('python')
provides=('portablemc')

source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/8d/63/d60d2b80e5a0e8499b8db1ba8301bec956dfb3602a639df115e12eb4422f/portablemc-4.2.1.tar.gz"
  'portablemc'
)

sha256sums=(
  '914b83a388712ab0f9118ccb41085d7594ead93bc421fec1cb599ff13369d02c'
  '65df24d73666d5a7f5eaac5beb48132b4f5cf0022878c3468afe7711cd275f45'
)

prepare() {
  sed -Ei 's/(LAUNCHER_VERSION.*".*)"/\1 (AUR)"/' "$pkgname-$pkgver/portablemc/__init__.py"
}         

package() {
  mkdir -p "$pkgdir/usr/lib/portablemc"
  cp -r "$pkgname-$pkgver/portablemc" "$pkgdir/usr/lib/portablemc"
  install -m 755 -DT portablemc "$pkgdir/usr/bin/portablemc"

  # BashCompletionDirectory
  bcpd='usr/share/bash-completion/completions'
  # ZshCompletionDirectory
  zcpd='usr/share/zsh/site-functions'
  cd "$pkgdir/usr/lib/portablemc"
  [ -d "/$bcpd" ] && { mkdir -p "$pkgdir/$bcpd" && python -m portablemc show completion bash > "$pkgdir/$bcpd/portablemc"; }
  [ -d "/$zcpd" ] && { mkdir -p "$pkgdir/$zcpd" && python -m portablemc show completion zsh > "$pkgdir/$zcpd/_portablemc"; }
}

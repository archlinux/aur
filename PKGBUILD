# Maintainer: Maksymilian Jopek <maks.aur@jopek.eu>
pkgname=portablemc
pkgver=4.4.1
pkgrel=1
pkgdesc='An easy-to-use Python CLI Minecraft launcher'
arch=('any')
url='https://github.com/mindstorm38/portablemc'
license=('GPL3-only')
depends=('python')
provides=('portablemc')

source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/20/a1/10817cf435787f2e6d20c71e9fa578304bf9b66ee283334e5255f47a09ca/portablemc-4.4.1.tar.gz"
  'portablemc'
)

sha256sums=(
  'f142173b8777dab2e78ad92df110d919bedc4a009b648d5351c4b7be5e8fc1e4'
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

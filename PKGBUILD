# Maintainer: Maksymilian Jopek <maks.aur@jopek.eu>
pkgname=portablemc
pkgver=4.3.0
pkgrel=1
pkgdesc='An easy-to-use Python CLI Minecraft launcher'
arch=('any')
url='https://github.com/mindstorm38/portablemc'
license=('GPL3-only')
depends=('python')
provides=('portablemc')

source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/e6/d1/61fa495e7944597d4c6e61756ce175d7b3096f14fd7c3c67fa69da43e25d/portablemc-4.3.0.tar.gz"
  'portablemc'
)

sha256sums=(
  '30c43339310b0bb0494cb91a6a3311cc6b565fe8b651fafa800c7ceb98aad35d'
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

# Maintainer: Maksymilian Jopek <maks.aur@jopek.eu>
pkgname=portablemc
pkgver=4.4.0
pkgrel=1
pkgdesc='An easy-to-use Python CLI Minecraft launcher'
arch=('any')
url='https://github.com/mindstorm38/portablemc'
license=('GPL3-only')
depends=('python')
provides=('portablemc')

source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/e5/01/9dfddfc44459d075b21472bd5f5bbd161571619a1293b822448e1293ac88/portablemc-4.4.0.tar.gz"
  'portablemc'
)

sha256sums=(
  'fc2239e2747495220b385677d39f443358df1912793aede8cb783b35cd76b37b'
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

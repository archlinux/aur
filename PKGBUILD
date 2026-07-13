# Maintainer: William Canin <hello.williamcanin@gmail.com>

pkgname=tildr-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage HOME files and directories with symlinks and Git."
arch=('x86_64')
url="https://orbitbits.com/tildr"
# source GitHub: https://github.com/orbitbits/tildr
license=('custom')
depends=('glibc' 'gcc-libs' 'git' 'less')
optdepends=(
  'python-nautilus: Nautilus file manager plugin'
  'dolphin: Dolphin file manager plugin'
)
install='tildr.install'
options=('!strip' '!debug')
provides=('tildr')
conflicts=('tildr')

# - Build and install via makepkg -
# Before building, import the maintainer's GPG key:
#   gpg --keyserver keyserver.ubuntu.com --recv-keys DE28149E82A46E5182C42E716FC4906130203368
# Or via direct file:
#   curl https://raw.githubusercontent.com/orbitbits/pubkey/main/pubkey.asc | gpg --import

validpgpkeys=('DE28149E82A46E5182C42E716FC4906130203368')

# Variables in source
_man_base_url="https://raw.githubusercontent.com/orbitbits/tildr/main/docs/man/dist"

source=(
  "tildr-$pkgver-linux-x86_64::https://github.com/orbitbits/tildr/releases/download/v${pkgver}/tildr-${pkgver}-linux-x86_64"

  # Binary SHA256SUMS
  "SHA256SUMS::https://github.com/orbitbits/tildr/releases/download/v${pkgver}/SHA256SUMS"
  "SHA256SUMS.sig::https://github.com/orbitbits/tildr/releases/download/v${pkgver}/SHA256SUMS.sig"

  # Plugins
  "tildr.py::https://raw.githubusercontent.com/orbitbits/tildr/main/tools/plugins/nautilus/tildr.py"
  "tildr-dolphin.desktop::https://raw.githubusercontent.com/orbitbits/tildr/main/tools/plugins/dolphin/tildr.desktop"

  # Man pages
  "tildr.1::${_man_base_url}/tildr.1"
  "tildr-config.1::${_man_base_url}/tildr-config.1"
  "tildr-commands.1::${_man_base_url}/tildr-commands.1"
  "tildr-security.1::${_man_base_url}/tildr-security.1"

  # LICENSE
  "LICENSE::https://raw.githubusercontent.com/orbitbits/tildr/main/LICENSE"
)

sha256sums=(
  'SKIP'             # binary — verified via GPG
  'SKIP'             # SHA256SUMS — verified via GPG (SHA256SUMS.sig)
  'SKIP'             # GPG signature
  'SKIP'             # Nautilus Plugin
  'SKIP'             # Dolphin Plugin
  'SKIP'             # tildr.1
  'SKIP'             # tildr-config.1
  'SKIP'             # tildr-commands.1
  'SKIP'             # tildr-security.1
  'eec8d62abce01e1c6a97593efa0d508479d7d14c3bbfe9d7f52fc8a4f5edb413' # LICENSE - manual: sha256sum LICENSE
)

prepare() {
  cd "$srcdir"

  echo "==> Verifying SHA256SUMS signature..."
  gpg --verify SHA256SUMS.sig SHA256SUMS

  echo "==> Verifying binary via SHA256SUMS..."
  grep "tildr-$pkgver-linux-x86_64" SHA256SUMS | sha256sum -c -
}

package() {
  # Binary install
  install -Dm755 "$srcdir/tildr-$pkgver-linux-x86_64" \
    "$pkgdir/usr/bin/tildr"

  # Plugin Nautilus install
  install -Dm644 "$srcdir/tildr.py" \
    "$pkgdir/usr/share/nautilus-python/extensions/tildr.py"

  # Plugin Dolphin install
  install -Dm644 "$srcdir/tildr-dolphin.desktop" \
    "$pkgdir/usr/share/kio/servicemenus/tildr.desktop"

  # Man pages install
  install -Dm644 "$srcdir/tildr.1" \
    "$pkgdir/usr/share/man/man1/tildr.1"
  install -Dm644 "$srcdir/tildr-config.1" \
    "$pkgdir/usr/share/man/man1/tildr-config.1"
  install -Dm644 "$srcdir/tildr-commands.1" \
    "$pkgdir/usr/share/man/man1/tildr-commands.1"
  install -Dm644 "$srcdir/tildr-security.1" \
    "$pkgdir/usr/share/man/man1/tildr-security.1"

  # LICENSE install
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/tildr/LICENSE"
}
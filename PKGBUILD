# Maintainer: William Canin <hello.williamcanin@gmail.com>

pkgname=tildr-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Manage HOME files and directories with symlinks and Git."
arch=('x86_64')
url="https://orbitbits.com/tildr"
# source GitHub: https://github.com/orbitbits/tildr
license=('AGPL3')
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

source=(
  "tildr-$pkgver-linux-x86_64::https://github.com/orbitbits/tildr/releases/download/v${pkgver}/tildr-${pkgver}-linux-x86_64"
  "SHA256SUMS::https://github.com/orbitbits/tildr/releases/download/v${pkgver}/SHA256SUMS"
  "SHA256SUMS.sig::https://github.com/orbitbits/tildr/releases/download/v${pkgver}/SHA256SUMS.sig"
  "tildr-src::https://github.com/orbitbits/tildr/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
  'SKIP'             # binary — verified via GPG
  'SKIP'             # SHA256SUMS — verified via GPG (SHA256SUMS.sig)
  'SKIP'             # GPG signature
  'SKIP'             # source tarball
)

prepare() {
  cd "$srcdir"

  echo "==> Extracting source tarball..."
  tar -xzf tildr-src --strip-components=1

  echo "==> Downloading fresh SHA256SUMS..."
  curl -sL "https://github.com/orbitbits/tildr/releases/download/v${pkgver}/SHA256SUMS" -o SHA256SUMS.new

  echo "==> Verifying SHA256SUMS signature..."
  gpg --verify SHA256SUMS.sig SHA256SUMS.new

  echo "==> Verifying binary via SHA256SUMS..."
  grep "tildr-$pkgver-linux-x86_64" SHA256SUMS.new | sha256sum -c -
}

package() {
  # Binary install
  install -Dm755 "$srcdir/tildr-$pkgver-linux-x86_64" \
    "$pkgdir/usr/bin/tildr"

  # Plugin Nautilus install
  install -Dm644 "$srcdir/tools/plugins/nautilus/tildr.py" \
    "$pkgdir/usr/share/nautilus-python/extensions/tildr.py"

  # Plugin Dolphin install
  install -Dm644 "$srcdir/tools/plugins/dolphin/tildr.desktop" \
    "$pkgdir/usr/share/kio/servicemenus/tildr.desktop"

  # Man pages install
  install -Dm644 "$srcdir/docs/man/dist/tildr.1" \
    "$pkgdir/usr/share/man/man1/tildr.1"
  install -Dm644 "$srcdir/docs/man/dist/tildr-config.1" \
    "$pkgdir/usr/share/man/man1/tildr-config.1"
  install -Dm644 "$srcdir/docs/man/dist/tildr-commands.1" \
    "$pkgdir/usr/share/man/man1/tildr-commands.1"
  install -Dm644 "$srcdir/docs/man/dist/tildr-security.1" \
    "$pkgdir/usr/share/man/man1/tildr-security.1"

  # LICENSE install
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/tildr/LICENSE"
}

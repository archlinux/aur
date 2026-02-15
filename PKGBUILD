# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=qrdv
pkgver=0.1.2
pkgrel=1
pkgdesc="Encode any data into QR code videos with optional encryption."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/qrdv"
license=('MIT')
depends=('gcc-libs' 'glibc' 'ffmpeg')
provides=('qrdv')
conflicts=('qrdv')
options=('!debug')

source=('LICENSE' 'tests.sh')
source_x86_64=("qrdv-x86_64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/qrdv-linux-x86_64"
               "completions-x86_64-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/completions.zip")
source_aarch64=("qrdv-aarch64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/qrdv-linux-aarch64"
                "completions-aarch64-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/completions.zip")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c'
            '305f920fdbdafb80aa1e64161589325e3f731157c9419a6b7fc0f6692fe1be87')
sha256sums_x86_64=('dc7f5c9f5d98aa4e33184dade814b482a783a3cb33a6a4a2aaab7752ea9595d8'
                   '03e55a9da169887e416b2eb047d3d78488387ddea36d7d6fc7e09b56215d5d07')
sha256sums_aarch64=('8102a6dc9385ac58608cec52f8499fe8c1058aa72f4ce4482706ad0fc141ef35'
                    '03e55a9da169887e416b2eb047d3d78488387ddea36d7d6fc7e09b56215d5d07')

prepare() {
  # Extract completions zip (contains man pages + shell completions)
  if [ "$CARCH" == "x86_64" ]; then
    bsdtar -xf "$srcdir/completions-x86_64-$pkgver-$pkgrel.zip"
  elif [ "$CARCH" == "aarch64" ]; then
    bsdtar -xf "$srcdir/completions-aarch64-$pkgver-$pkgrel.zip"
  fi
}

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="qrdv-x86_64-$pkgver-$pkgrel"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="qrdv-aarch64-$pkgver-$pkgrel"
  fi

  # Binary
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/qrdv"

  # Tests
  install -d "$pkgdir/usr/share/tests/$pkgname"
  install -m755 "$srcdir/tests.sh" "$pkgdir/usr/share/tests/$pkgname/tests.sh"

  # Man pages
  install -d "$pkgdir/usr/share/man/man1"
  install -m644 "$srcdir/qrdv.1" "$pkgdir/usr/share/man/man1/qrdv.1"
  install -m644 "$srcdir/qrdv-encode.1" "$pkgdir/usr/share/man/man1/qrdv-encode.1"
  install -m644 "$srcdir/qrdv-decode.1" "$pkgdir/usr/share/man/man1/qrdv-decode.1"

  # Zsh completion
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -m644 "$srcdir/_qrdv" "$pkgdir/usr/share/zsh/site-functions/_qrdv"

  # Bash completion
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -m644 "$srcdir/qrdv.bash" "$pkgdir/usr/share/bash-completion/completions/qrdv"

  # Fish completion
  install -d "$pkgdir/usr/share/fish/completions"
  install -m644 "$srcdir/qrdv.fish" "$pkgdir/usr/share/fish/completions/qrdv.fish"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

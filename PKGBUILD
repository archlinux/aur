# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=qrdv
pkgver=0.1.1
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
sha256sums_x86_64=('e68fc77a3bf989c8f114ca15fa549024e9a4367e730ccc468c94139f8c310aca'
                   '760df76ebebf5068bd30a076739a51c6970533c9f4bc6717aecd68163cadced9')
sha256sums_aarch64=('cddf1f2f93db96802ed61a7384034eb7693baccedc1c28008f345fe3aa10a909'
                    '760df76ebebf5068bd30a076739a51c6970533c9f4bc6717aecd68163cadced9')

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

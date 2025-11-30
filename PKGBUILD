# Maintainer: SaintFore <saintfore@example.com>
pkgname=leetcode-fsrs-cli
pkgver=1.6.6
pkgrel=1
pkgdesc="A CLI tool for LeetCode practice using FSRS spaced repetition algorithm"
arch=('any')
url="https://github.com/SaintFore/LeetCodeCLI"
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-scipy' 'python-numpy')
optdepends=('git: for version control integration')
makedepends=('python-setuptools')
provides=('leetcode-fsrs-cli')
conflicts=('leetcode-fsrs-cli')
replaces=('leetcode-fsrs-cli')
backup=('etc/leetcode-fsrs-cli/config.json')

source=("https://github.com/SaintFore/LeetCodeCLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e4fd5d6e6bea05002894eb705c203e82f655cb79fbb0ca18939f14e07206c21')

build() {
  cd "LeetCodeCLI-$pkgver"
  python setup.py build
}

package() {
  cd "LeetCodeCLI-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Create configuration directory
  install -d "$pkgdir/etc/leetcode-fsrs-cli"

  # Create user data directory
  install -d "$pkgdir/usr/share/leetcode-fsrs-cli/data"

  # Install default configuration (create empty config if not exists)
  if [ -f data/config.json ]; then
    install -Dm644 data/config.json "$pkgdir/usr/share/leetcode-fsrs-cli/data/config.json"
  else
    mkdir -p "$pkgdir/usr/share/leetcode-fsrs-cli/data"
    echo '{}' > "$pkgdir/usr/share/leetcode-fsrs-cli/data/config.json"
    chmod 644 "$pkgdir/usr/share/leetcode-fsrs-cli/data/config.json"
  fi

  # Create a message about user data location
  install -d "$pkgdir/usr/share/leetcode-fsrs-cli"
  cat > "$pkgdir/usr/share/leetcode-fsrs-cli/INSTALL" << EOF
LeetCode FSRS CLI has been installed!

To get started:
1. Run: leetcode-fsrs init
2. Then: leetcode-fsrs practice

Your data will be stored in: ~/.config/leetcode-fsrs-cli/

For more information, see: leetcode-fsrs --help
EOF
}

# Maintainer: Patrick Wozniak <email@patwoz.de>

pkgname=masterpassword-cli-git
pkgver=20150830.r927.8f1d897
pkgrel=2
pkgdesc="CLI version of Master Password. (git-version)"

arch=('any')
url="https://github.com/Lyndir/MasterPassword"
license=('GPL3')

optdepends=(
  'xclip: copy password to clipboard'
)
makedepends=(
  'openssl'
  'gcc'
  'git'
)
conflicts=(
  'masterpassword-cli'
)

source=("${pkgname%-git}::git+http://github.com/Lyndir/MasterPassword.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}/MasterPassword/C"
  sed -i '/^svn=/d' ./lib/scrypt/.source
}

build() {
  cd "${pkgname%-git}/MasterPassword/C"
  targets="mpw" ./build
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  cd "MasterPassword/C"
  install -Dm755 "mpw" "$pkgdir/usr/bin/mpw"
}

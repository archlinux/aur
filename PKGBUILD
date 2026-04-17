# Maintainer: Coraline Shuryn <coraline.shuryn@gmail.com>
pkgname=gemini-cli-git
_pkgname=gemini-cli
epoch=1
pkgver=r5876.g3061555d28
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libsecret'
  'libstdc++'
  'nodejs'
)
makedepends=(
  'git'
  'jq'
  'node-gyp'
  'npm'
  'python'
)
optdepends=(
  'ripgrep: file content search'
  'wl-clipboard: clipboard image pasting on Wayland'
  'xclip: clipboard image pasting on X11'
  'xdg-utils: opening URLs in default browser'
)
provides=("google-gemini-cli" "gemini-cli")
conflicts=("google-gemini-cli" "gemini-cli" "google-gemini-cli-git")
replaces=("google-gemini-cli-git")
source=("$_pkgname::git+$url.git"
        "system-defaults.json")
sha256sums=('SKIP'
            '55bcdfa1000a07b81c817fb8d20cae5f4bb178959f2a55b9aaa49be7f68710e7')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  npm install
  npm run bundle
  npm run docs:settings
}

package() {
  cd "$srcdir/$_pkgname"
  npm pack --silent
  local tarball=$(find . -maxdepth 1 -name "*.tgz")
  npm install -g "$tarball" --prefix "$pkgdir/usr" --omit=dev
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/system-defaults.json" "$pkgdir/etc/gemini-cli/system-defaults.json"
}

# Maintainer: Your Name <your.email@example.com>
pkgname=dyad-git
_pkgname=dyad
pkgver=v0.28.0.r5.gfadfbc06
pkgrel=1
pkgdesc="Local, open-source AI app builder (git version)"
arch=('x86_64')
url="https://dyad.sh"
license=('Apache-2.0' 'custom:FSL-1.1')
depends=('gtk3' 'nss' 'alsa-lib' 'libsecret' 'libxtst' 'libxss' 'glibc')
makedepends=('git' 'npm' 'python' 'node-gyp')
provides=('dyad')
conflicts=('dyad' 'dyad-bin')
source=("git+https://github.com/dyad-sh/dyad.git"
        "dyad.desktop"
        "dyad.sh")
sha256sums=('SKIP'
            'c95a94a939b105e25f988b577b4fd090dff1059b3bd8f25ae9ffe9bb58e92ed7'
            '9d14e8f1084af56afdb8f17ade01dc117d85b1e2ee470941132731bfc1445ec9')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
}

build() {
  cd "$_pkgname"
  # Create userData directory as required by dev/build scripts (prevents build errors)
  mkdir -p userData
  
  npm install
  npm run db:generate
  
  # Build the electron package
  npm run package -- --platform=linux --arch=x64
}

package() {
  cd "$_pkgname"
  
  _out_dir=$(find out -maxdepth 1 -type d -name "*linux-x64*" | head -n 1)
  
  if [ -z "$_out_dir" ]; then
    echo "Error: Could not find build output directory in out/"
    return 1
  fi

  install -d "$pkgdir/opt/dyad"
  cp -r "$_out_dir"/* "$pkgdir/opt/dyad/"
  
  # Install wrapper script instead of symlink for better arg handling
  install -Dm755 "$srcdir/dyad.sh" "$pkgdir/usr/bin/dyad"
  
  install -Dm644 "$srcdir/dyad.desktop" "$pkgdir/usr/share/applications/dyad.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  _icon_path=$(find . -type f -path "*assets/icon.png" -o -path "*resources/icon.png" | head -n 1)
  if [ -n "$_icon_path" ]; then
    install -Dm644 "$_icon_path" "$pkgdir/usr/share/pixmaps/dyad.png"
  fi
}

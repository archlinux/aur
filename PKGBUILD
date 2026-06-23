pkgname=rime-array-git
pkgver=r46.557dbe3
pkgrel=1
pkgdesc="Array30 schema for Rime (with global activation)"
arch=('any')
url="https://github.com/rime/rime-array"
license=('GPL')
depends=('librime')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  # 1. Create the target directory
  install -dm755 "$pkgdir/usr/share/rime-data"
  
  # 2. Install all the schema and dictionary yaml files
  install -m644 *.yaml "$pkgdir/usr/share/rime-data/"

  # 3. Generate a global custom configuration
  cat << 'EOF' > system-default.custom.yaml
patch:
  "schema_list/+":
    - schema: array30
EOF

  # 4. Install the custom configuration as default.custom.yaml
  install -m644 system-default.custom.yaml "$pkgdir/usr/share/rime-data/default.custom.yaml"
}

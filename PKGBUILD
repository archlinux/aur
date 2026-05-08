# Maintainer: Pascal Lynxon <gfcwfzkm@protonmail.com>

pkgname=signalflowgrapher-git
pkgver=V2.0.0.6.g4fcdfdc
pkgrel=1
pkgdesc='Signal-flow graph editor and analysis tool'
arch=('any')
url='https://github.com/hanspi42/signalflowgrapher'
license=('Artistic-2.0')
depends=(
  'desktop-file-utils'
  'hicolor-icon-theme'
  'python'
  'python-dependency-injector'
  'python-jsonschema'
  'pyside6'
  'python-sympy'
  'shared-mime-info'
)
makedepends=('git')
provides=('signalflowgrapher')
conflicts=('signalflowgrapher')
install="${pkgname}.install"
source=(
  "${pkgname}::git+${url}.git"
  "signalflowgrapher.desktop"
  "signalflowgrapher.xml"
)
sha256sums=(
  'SKIP'
  'ed291caf76783dddda70f36e990242b967f213c6dc584243b0864cfe0ecd3358'
  '3093764da2688c4d2c2b8ba84a6e98f7080a883b46c2aa9b5730b06d9adbb9b2'
)

pkgver() {
  cd "$srcdir/$pkgname"

  local version
  version=$(git describe --tags --long --abbrev=7 2>/dev/null || true)

  if [[ -n $version ]]; then
    version=${version#v}
    version=${version//-/.}
    printf '%s\n' "$version"
    return
  fi

  printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/opt/signalflowgrapher"
  tar --exclude='.git' -cf - . | tar -C "$pkgdir/opt/signalflowgrapher" -xf -

  install -d "$pkgdir/usr/bin"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/signalflowgrapher" <<'EOF'
#!/bin/sh
cd /opt/signalflowgrapher || exit 1
exec python src/main/python/main.py "$@"
EOF

  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/signalflowgrapher.desktop" \
    "$pkgdir/usr/share/applications/signalflowgrapher.desktop"

  install -d "$pkgdir/usr/share/mime/packages"
  install -Dm644 "$srcdir/signalflowgrapher.xml" \
    "$pkgdir/usr/share/mime/packages/signalflowgrapher.xml"

  local size
  for size in 128 256 512 1024; do
    install -Dm644 "src/main/icons/linux/${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/signalflowgrapher.png"
    install -Dm644 "src/main/icons/linux/${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/mimetypes/signalflowgrapher.png"
  done
}

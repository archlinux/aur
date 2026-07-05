# Maintainer: Rodrigo Brito <rodrigo@w3ti.com.br>
pkgname=fina
pkgver=13.1.0
pkgrel=1
pkgdesc="Gerenciador de finanças pessoais"
arch=('x86_64')
url="https://github.com/britors/Fina"
license=('GPL-3.0-only')
depends=('electron38' 'libsecret')
makedepends=('npm' 'python' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/britors/Fina/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "Fina-$pkgver"
  npm ci --ignore-scripts
  # better-sqlite3-multiple-ciphers prebuilds top out at Electron 38; rebuild against that version
  local _electron_version
  _electron_version=$(electron38 --version | sed 's/^v//')
  npx @electron/rebuild -f -w better-sqlite3-multiple-ciphers -v "$_electron_version"
  # gera build/icon.png a partir do SVG (não versionado no tarball)
  npm run generate-icons
}

build() {
  cd "Fina-$pkgver"
  npm run build
}

package() {
  cd "Fina-$pkgver"

  # Arquivos do app
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r out "$pkgdir/usr/lib/$pkgname/"
  cp package.json "$pkgdir/usr/lib/$pkgname/"
  cp -r node_modules "$pkgdir/usr/lib/$pkgname/"

  # Launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec electron38 /usr/lib/$pkgname "\$@"
EOF

  # Ícone gerado em prepare() via generate-icons
  install -Dm644 "build/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "build/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # Entrada .desktop
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Fina
GenericName=Finanças Pessoais
Comment=Controle suas finanças com Fina
Exec=fina %U
Icon=fina
Terminal=false
Type=Application
Categories=Office;Finance;
Keywords=financas;dinheiro;orcamento;investimento;
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

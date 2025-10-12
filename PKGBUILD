pkgname=cat-git
pkgver=1.0.3
pkgrel=1
pkgdesc="An open-source highly customizable shell made in C#."
arch=('any')
url="https://github.com/lunaNoir25/CAT"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
conflicts=('catsh') 
source=("git+${url}.git")
sha256sums=('SKIP') 

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd CAT

  dotnet build CAT/CAT.csproj --configuration Release
}

package() {
  cd CAT

  local project_path="CAT/CAT.csproj" 
  local install_dir="$pkgdir/usr/share/$pkgname"
  local executable_name="CAT" 

  mkdir -p "$install_dir"

  dotnet publish "$project_path" \
    --configuration Release \
    --output "$install_dir" \
    --self-contained true \
    --runtime linux-x64 \
    -p:PublishReadyToRun=true

  mkdir -p "$pkgdir/usr/bin"

  cat > "$pkgdir/usr/bin/catsh" <<EOF
#!/bin/sh
exec "/usr/share/$pkgname/$executable_name" "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/catsh"
}
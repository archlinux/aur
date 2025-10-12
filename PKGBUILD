# Maintainer: lunaNoir
pkgname=cat-git
pkgver=1.0.0
pkgrel=1
pkgdesc="An open-source highly customizable shell made in C#."
arch=('any')
url="https://github.com/lunaNoir25/CAT"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
conflicts=()
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  dotnet build CAT.sln --configuration Release
}

package() {
  cd "$pkgname"

  local project_name="CAT/CAT.csproj"
  local install_dir="$pkgdir/usr/share/$pkgname"

  dotnet publish "$project_name" \
    --configuration Release \
    --output "$install_dir" \
    --self-contained false \
    -p:PublishReadyToRun=true

  local executable_name="CAT"
  
  install -Dm755 /dev/null "$pkgdir/usr/bin/catsh"
  ln -s "$install_dir/$executable_name" "$pkgdir/usr/bin/catsh"
}
pkgname=cat-git
pkgver=1.0.1
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
  cd src/CAT/

  dotnet build CAT/CAT.csproj --configuration Release
}

package() {
  cd src/CAT/

  local project_path="CAT/CAT.csproj" 
  local install_dir="$pkgdir/usr/share/$pkgname"
  local executable_name="CAT" 

  dotnet publish "$project_path" \
    --configuration Release \
    --output "$install_dir" \
    --self-contained false \
    -p:PublishReadyToRun=true

  install -Dm755 /dev/null "$pkgdir/usr/bin/catsh"
  ln -s "$install_dir/$executable_name" "$pkgdir/usr/bin/catsh"
}
# Maintainer: AnabasaSoft <anabasasoft@gmail.com>
pkgname=kamaleon-git
_pkgname=Kamaleon
pkgver=2.6.2
pkgrel=1
pkgdesc="Universal wrapper for: yay, paru, pacman, apt, dnf, zypper, apk (Alpine), flatpak and xbps (Void). Written in Go."
arch=('x86_64' 'aarch64')
url="https://github.com/AnabasaSoft/Kamaleon"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/AnabasaSoft/Kamaleon.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Extraemos la versión base limpia (ej: 2.6.2) ignorando cualquier ".r..." anterior
  local _basever="${pkgver%%.r*}"

  # Generamos la versión correcta sin duplicidades
  printf "%s.r%s.g%s" "$_basever" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -ldflags="-s -w" -o kml kml.go
}

package() {
  cd "$_pkgname"
  
  # Instalar el binario
  install -Dm755 kml "$pkgdir/usr/bin/kml"
  
  # Instalar autocompletado Zsh
  install -Dm644 _kml "$pkgdir/usr/share/zsh/site-functions/_kml"
  
  # Instalar autocompletado Bash
  install -Dm644 kml-completion.bash "$pkgdir/usr/share/bash-completion/completions/kml"
  
  # Instalar Licencia
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

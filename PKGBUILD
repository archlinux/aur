# Maintainer: MURDERRA <murderra@keemail.me>
pkgname=vapormove
pkgver=0.1.0
pkgrel=1
pkgdesc="Vaporwave motion trail effects for Hyprland and X11"
arch=('x86_64')
url="https://github.com/MURDERRA/Vapormove"

# Зависимости времени выполнения
depends=(
    'mesa'           # предоставляет libwayland-egl.so, libGL, libEGL
    'libxcomposite'  # для X11 backend
    'libxfixes'      # для X11 backend
    'xdotool'        # если используется в рантайме
)

# Зависимости сборки
makedepends=(
    'go'
    'gcc'
    'pkg-config'
    'wayland'        # для wayland-client.h и т.д.
    'wayland-protocols'  # для генерации протоколов (если нужно)
    'git'
)

# Опциональные зависимости (wlr-protocols из AUR)
optdepends=('wlr-protocols: для генерации Wayland bindings')

source=("$pkgname-$pkgver.tar.gz::https://github.com/MURDERRA/Vapormove/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Замените на реальный хэш после скачивания

prepare() {
  cd "Vapormove-$pkgver"  # ← ВАЖНО: заглавная V, как у репозитория
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "Vapormove-$pkgver"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  make generate 2>/dev/null || true
  
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=$pkgver" \
    -o vapormove .
}

package() {
  cd "Vapormove-$pkgver"
  install -Dm755 vapormove "$pkgdir"/usr/bin/vapormove
}

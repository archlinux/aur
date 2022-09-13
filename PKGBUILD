# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname=apparmor.d-git
pkgver=0.794
pkgrel=1
pkgdesc="Full set of apparmor profiles"
arch=("x86_64")
url="https://github.com/roddhjav/apparmor.d"
license=('GPL2')
depends=('apparmor')
makedepends=('go' 'git' 'rsync' 'lsb-release')
source=("$pkgname::git+https://github.com/roddhjav/apparmor.d.git?signed")
sha512sums=('SKIP')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "0.$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  ./configure --complain
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o .build/ ./cmd/aa-log
}

package() {
  local _build='.build'
  cd "$srcdir/$pkgname"

  # Install all system files
  mapfile -t root < <(find "$_build/root" -type f -printf "%P\n")
  for file in "${root[@]}"; do
    install -Dm0644 "$_build/root/$file" "$pkgdir/$file"
  done

  # Install all apparmor profiles
  mapfile -t profiles < <(find "$_build/apparmor.d" -type f -printf "%P\n")
  for file in "${profiles[@]}"; do
    install -Dm0644 "$_build/apparmor.d/$file" "$pkgdir/etc/apparmor.d/$file"
  done

  # Ensure some systemd services do not start before apparmor rules are loaded
  for file in systemd/*; do
    service=$(basename "$file")
    install -Dm0644 "$file" \
      "$pkgdir/usr/lib/systemd/system/$service.d/apparmor.conf"
  done

  # Internal tool
  install -Dm755 .build/aa-log "$pkgdir"/usr/bin/aa-log
}

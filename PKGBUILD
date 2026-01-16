# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Matt Harrison <matt@harrison.us.com>

pkgname=silverbullet
pkgver=2.4.1
pkgrel=1
pkgdesc='Clean Markdown-based writing/note taking application'
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url='https://github.com/silverbulletmd/silverbullet'
license=('MIT')
depends=('bash')
makedepends=('go' 'deno' 'git')
backup=("etc/default/$pkgname")
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname-system.service"
  "$pkgname-user.service"
  "$pkgname.sh"
)
sha256sums=('2a72555af0bdbecb6cf9f069ed5f658b7f199f42b37bb9907b02aec3555e4510'
            '93ac8414f9af3c29e43554468f2f5f5e37cbe0792d57e84a9f5228305aeed89d'
            '5f01fe05f871f60277508f8cf39e879a7db18f1ff45c1ef7b2359089bfe1a0bd'
            'c208d9388a720462991bcd4842d33e8fdf43daa3c17751f2801233af9ddd5b33')

build() {
  cd "$pkgname-$pkgver"

  deno task build
  deno task build-plug-compile

  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw

  for sh in bash zsh fish; do
    ./$pkgname completion $sh >$pkgname.$sh
  done
}

check() {
  cd "$pkgname-$pkgver"
  TZ=UTC deno task test
  go test ./...
}

package() {
  install -Dm755 /dev/stdin "$pkgdir/etc/default/$pkgname" <<EOF
HOST=localhost
PORT=3000
EOF

  install -Dm644 "$pkgname-system.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -Dm644 "$pkgname-user.service" \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  install -Dm755 "$pkgname.sh" \
    "$pkgdir/usr/bin/$pkgname"

  cd "$pkgname-$pkgver"

  install -Dm755 $pkgname -t "$pkgdir/usr/lib/$pkgname/"

  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

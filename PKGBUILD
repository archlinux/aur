# Maintainer: NeoTheFox
pkgname=clipryx
pkgver=1.1
pkgrel=1
pkgdesc="A Linux Wayland clipboard history manager written in C# on .NET"
arch=('x86_64')
url="https://github.com/Yot360/clipryx"
license=('Apache-2.0')
depends=('wl-clipboard')
makedepends=('dotnet-sdk' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yot360/clipryx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('778d237d3df8c76a2915fca88b1d7db97bd50ae1dbbd667951d74a4a22218ac0')

build() {
  cd "$srcdir/$pkgname-$pkgver/clipryx"
  dotnet publish -c Release -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishAot=true \
    -o publish
}

package() {
  cd "$srcdir/$pkgname-$pkgver/clipryx"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -Dm755 publish/clipryx "$pkgdir/usr/lib/$pkgname/clipryx"

  if [[ -f publish/clipryx.dbg ]]; then
    install -Dm644 publish/clipryx.dbg "$pkgdir/usr/lib/$pkgname/clipryx.dbg"
  fi

  find publish -name '*.so' -o -name '*.dll.so' | while read -r f; do
    install -Dm644 "$f" "$pkgdir/usr/lib/$pkgname/$(basename "$f")"
  done

  install -d "$pkgdir/usr/bin"
  sed 's|/usr/local/lib/clipryx|/usr/lib/clipryx|g' assets/clipryx.sh \
    > "$pkgdir/usr/bin/clipryx"
  chmod 755 "$pkgdir/usr/bin/clipryx"

  install -Dm644 assets/clipryx.desktop \
    "$pkgdir/usr/share/applications/clipryx.desktop"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

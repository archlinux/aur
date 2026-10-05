# Maintainer: AUR package maintainer
pkgname=opencodex-bin
pkgver=2.78.0
pkgrel=1
pkgdesc='Universal provider proxy for OpenAI Codex and Claude Code (prebuilt Bun binary)'
arch=('x86_64' 'aarch64')
url='https://opencodex.me/'
license=('MIT')
depends=('bash' 'glibc')
options=('!strip' '!debug')
noextract=("ocx-${pkgver}-bun-linux-x64.tar.gz"
           "ocx-${pkgver}-bun-linux-arm64.tar.gz")
provides=('opencodex')
conflicts=('opencodex')
source=('ocx-launcher' 'LICENSE')
source_x86_64=("ocx-${pkgver}-bun-linux-x64.tar.gz::https://github.com/lidge-jun/opencodex/releases/download/v${pkgver}/ocx-${pkgver}-bun-linux-x64.tar.gz")
source_aarch64=("ocx-${pkgver}-bun-linux-arm64.tar.gz::https://github.com/lidge-jun/opencodex/releases/download/v${pkgver}/ocx-${pkgver}-bun-linux-arm64.tar.gz")
sha256sums=('e0a6be04768d456556e6dc180daeebd82a6416ae576b1948f1a4cb85607e87f5'
            '34012a5529ad1e574e84457a609f9ea3df03c63d7c42c7e5f74ec14f438ed346')
sha256sums_x86_64=('c056a74c9892f92f05fc507ee8aed0b7714b4eb4f3a42e32293339e4392ba299')
sha256sums_aarch64=('9d2dfa5b80d85746ddd5287287a5d7671cf9454eca03f5c0430aa184371f62cb')

prepare() {
  local _platform
  case $CARCH in
    x86_64) _platform=x64 ;;
    aarch64) _platform=arm64 ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac
  install -dm755 "$srcdir/opencodex-payload"
  tar -xzf "$srcdir/ocx-${pkgver}-bun-linux-${_platform}.tar.gz" \
    -C "$srcdir/opencodex-payload"
}

package() {
  local _binary _root
  # The upstream release keeps gui/dist beside ocx; preserve that layout.
  _binary="$(find "$srcdir/opencodex-payload" -type f -name ocx -print -quit)"
  if [[ -z $_binary ]]; then
    echo 'Could not find the ocx executable in the upstream archive' >&2
    return 1
  fi
  _root="$(dirname "$_binary")"
  if [[ ! -d "$_root/gui/dist" ]]; then
    echo 'Could not find gui/dist beside the ocx executable' >&2
    return 1
  fi

  install -dm755 "$pkgdir/usr/lib/opencodex" "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/licenses/$pkgname"
  cp -R "$_root/." "$pkgdir/usr/lib/opencodex/"
  chmod 755 "$pkgdir/usr/lib/opencodex/ocx"
  install -Dm755 "$srcdir/ocx-launcher" "$pkgdir/usr/bin/ocx"
  ln -s ocx "$pkgdir/usr/bin/opencodex"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>

pkgname=camofox-browser
pkgver=1.18.1
pkgrel=1
pkgdesc="Stealth browser for AI agents with advanced fingerprint spoofing"
# Other arches may be supported, but are untested. Let me know if another one
# works and I'll add it to the list :D.
arch=('x86_64')
url="https://github.com/jo-inc/camofox-browser"
license=('MIT')
depends=('nodejs' 
  # namcap said these packages weren't needed. If we have problems we'll re-add them.
  # ==BEGIN==
  #'gtk3' 'alsa-lib' 'nss' 'nspr' 'libxtst' 'libxcomposite'
  #'libxfixes' 'libxrandr' 'libxrender' 'libxcursor' 'libxi' 
  # ==END==
  'sh' 'bash')
makedepends=('npm')
optdepends=('yt-dlp: YouTube transcript extraction (fast path)')

source=("$pkgname-$pkgver.tar.gz::https://github.com/jo-inc/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c511b0d80b0ed088caec171658198dd99aef6e889b07d101b23913a58bb33f5d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm ci --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/camofox-browser"
  cp -r . "$pkgdir/usr/lib/camofox-browser"

  rm -rf "$pkgdir/usr/lib/camofox-browser/node_modules/.cache"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/camofox-browser"
#!/bin/bash
cd /usr/lib/camofox-browser
exec npm start "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/camofox-browser"
}

# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='monochrome-git'
pkgver=r1027.f967d29
pkgrel=1
pkgdesc="Lossless music streaming"
arch=('x86_64')
url=https://github.com/monochrome-music/monochrome
license=('HIPPOCRATIC LICENSE')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'bun')
source_x86_64=(
  "${pkgname%-git}::git+https://github.com/monochrome-music/monochrome.git"
  "icon.png::https://raw.githubusercontent.com/monochrome-music/monochrome/refs/heads/main/public/assets/appicon.png"
)
sha256sums_x86_64=('SKIP' 'SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}" || exit
  bun install
  bun x neu update
}

build() {
  cd "$srcdir/${pkgname%-git}" || exit
  bun run build
}

package() {
  # Install full app to /opt
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp "$srcdir/${pkgname%-git}/dist/Monochrome/resources.neu" "$pkgdir/opt/${pkgname%-git}"
  cp "$srcdir/${pkgname%-git}/neutralino.config.json" "$pkgdir/opt/${pkgname%-git}"
  cp -r "$srcdir/${pkgname%-git}/dist/Monochrome/extensions" "$pkgdir/opt/${pkgname%-git}"
  cp "$srcdir/${pkgname%-git}/dist/Monochrome/Monochrome-linux_x64" "$pkgdir/opt/${pkgname%-git}/Monochrome"

  # Wrapper script
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/${pkgname%-git}"
#!/bin/sh
cd /opt/${pkgname%-git}
./Monochrome
EOF
  chmod +x "$pkgdir/usr/bin/${pkgname%-git}"

  # Desktop entry
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname%-git}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Monochrome
Comment=Monochrome music streaming app
Icon=${pkgname%-git}.png
Exec=/usr/bin/${pkgname%-git}
Terminal=false
Categories=Audio;Player;
EOF
}

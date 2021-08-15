# Maintainer: Speykious <speykious@gmail.com>

pkgname=vignette-git
pkgver='2021.730.0.r4.447e85a'
pkgrel=1
pkgdesc='The open source VTuber software toolkit. ❤'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/vignette-project/vignette'
license=('Non-Profit OSL')
depends=('dotnet-runtime>=5' 'ffmpeg' 'libgl')
makedepends=('git' 'dotnet-sdk>=5')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("$pkgname::git+https://github.com/vignette-project/vignette.git"
        "$pkgname.sh"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '6e5093a1e0ab26efd32cb343ed058cd779aed68ea60c750490fcbd8d83fe41f6'
            '081f9369356779e79f5613be3ce1a8c4591aa91d5f2da57d0fa4294549893ec3'
            'da8ba30c4d5033fa63e7289ea9ca341da4e0cef514100754cc343b22c4f35d80')

pkgver() {
  cd "$pkgname"
  printf "'%s'" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$pkgname"
  rm -rf compiled
  dotnet_runtime="$(dotnet --info | grep -F RID | cut -d: -f2 | tr -d '[:space:]')"
  env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" \
  dotnet publish Vignette.Desktop --no-self-contained -c Release -r "$dotnet_runtime" -o compiled
}

package() {
  # Application launch script
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/vignette"

  # Desktop file
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/vignette.desktop"

  # Icon
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/vignette.png"

  # License
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Runtime
  cd "$pkgname/compiled"
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/lib/vignette/{}" ';'
  cd ..
}

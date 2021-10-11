# Maintainer: Speykious <speykious@gmail.com>

pkgname=vignette-git
pkgver='2021.902.1.r8.2211edf'
pkgrel=1
pkgdesc='The open source VTuber software toolkit. ❤'
arch=('i686' 'x86_64')
url='https://github.com/vignette-project/vignette'
license=('Non-Profit OSL')
depends=('dotnet-runtime>=5' 'ffmpeg' 'libgl' 'libgeotiff')
makedepends=('git' 'dotnet-sdk>=5' 'dotnet-targeting-pack>=5' 'netstandard-targeting-pack>=5')
#provides=("${pkgname%-git}")
#conflicts=("${pkgname%-git}")
#options=('!strip')
source=("$pkgname::git+https://github.com/vignette-project/vignette.git"
        "$pkgname.sh"
        "$pkgname.svg"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '6e5093a1e0ab26efd32cb343ed058cd779aed68ea60c750490fcbd8d83fe41f6'
            'bb0000105fc2a0ec6ae151bb811fbca9cb12223e610406188586f0676595fd73'
            'e5b74b7781199961214fa2b4375edd4f2391477407a7153a7db31a61bb38911d')

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
	install -Dm644 "$pkgname.svg" "$pkgdir/usr/share/pixmaps/vignette.svg"

  # License
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Runtime
  cd "$pkgname/compiled"
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/lib/vignette/{}" ';'
  cd ..
}

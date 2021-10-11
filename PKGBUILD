# Maintainer: Speykious <speykious@gmail.com>

pkgname=vignette-git
pkgver='2021.1011.0'
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
_meta=vignette-linux-meta
source=("$pkgname::git+https://github.com/vignette-project/vignette.git"
        "$_meta::git+https://github.com/lionirdeadman/$_meta")
sha256sums=(SKIP SKIP)

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
  cd "$_meta"

  # Install launch script and app metadata
  install -Dm755 vignette "$pkgdir/usr/bin/vignette"
  install -Dm644 org.vignetteapp.Vignette.desktop "$pkgdir/usr/share/applications/org.vignetteapp.Vignette.desktop"
  install -Dm644 org.vignetteapp.Vignette.appdata.xml "$pkgdir/usr/share/appdata/org.vignetteapp.Vignette.appdata.xml"
  install -Dm644 org.vignetteapp.Vignette.svg "$pkgdir/usr/share/pixmaps/org.vignetteapp.Vignette.svg"

  # License
  cd "../$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Runtime
  cd compiled
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/lib/vignette/{}" ';'
  cd ..
}

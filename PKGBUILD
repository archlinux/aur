# Maintainer: Speykious <speykious@gmail.com>

pkgname=vignette-git
pkgver='2021.1102.2.r1.3bf9b44'
pkgrel=1
pkgdesc='The open source VTuber software toolkit. ❤'
arch=('i686' 'x86_64')
url='https://github.com/vignette-project/vignette'
license=('Non-Profit OSL')
depends=('dotnet-runtime-5.0-bin' 'ffmpeg' 'libgl' 'libgeotiff' 'opencv')
makedepends=('git' 'dotnet-sdk-5.0-bin' 'dotnet-targeting-pack-5.0-bin')
#provides=("${pkgname%-git}")
#conflicts=("${pkgname%-git}")
#options=('!strip')
_meta=vignette-linux-meta
source=("$pkgname::git+https://github.com/vignette-project/vignette.git#branch=debut"
        "$_meta::git+https://github.com/lionirdeadman/$_meta")
sha256sums=(SKIP SKIP)

pkgver() {
  cd "$pkgname"
  printf "'%s'" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$pkgname"
  rm -rf compiled
  env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" \
  dotnet publish Vignette.Desktop --no-self-contained -c Release -r ubuntu.20.04-x64 -o compiled
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

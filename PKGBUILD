# Maintainer: David Hess (Lunix) <davidhess336@gmx.de>
# PKGBUILD for Oscilloscope Unstable (latest git commit)

pkgname=dimethoxy-oscilloscope-git
# pkgver is generated from the latest git commit; the initial dummy version is 0.0.0.
pkgver=01c4508
pkgrel=1
pkgdesc="Unstable build of the latest commit of Oscilloscope from Dimethoxy's GitHub repository"
arch=('x86_64')
url="https://github.com/Dimethoxy/Oscilloscope"
license=('GPL3')
provides=('dimethoxy-oscilloscope')
conflicts=('dimethoxy-oscilloscope' 'dimethoxy-oscilloscope-git' 'dimethoxy-oscilloscope-bin')
# Source from the git repo (unstable build using the latest commit)
source=("git+https://github.com/Dimethoxy/Oscilloscope.git")
sha256sums=('SKIP')

# Build and runtime dependencies – adjust as necessary for your project.
makedepends=('gcc' 'git' 'cmake' 'ninja' 'pkg-config' 'alsa-lib' 'jack' 'ladspa'
  'curl' 'freetype2' 'fontconfig' 'libx11' 'libxcomposite' 'libxcursor'
  'libxext' 'libxinerama' 'libxrandr' 'libxrender' 'webkit2gtk' 'glu' 'mesa')
depends=('curl')

# Generate a proper pkgver from the git commit (using git describe)
pkgver() {
  cd "$srcdir/Oscilloscope"
  # Extract the latest tag (assumed to be the base version)
  base_version=$(git describe --tags --abbrev=0 | sed 's/^v//')
  # Get the short commit hash
  commit_hash=$(git rev-parse --short HEAD)
  # Construct the version string
  echo "${commit_hash}"
}

build() {
  cd "$srcdir/Oscilloscope"
  mkdir -p build
  cd build
  # Configure using the CMake preset defined in your project.
  cmake --preset "Linux Release" -DDMT_DISABLE_UPDATE_NOTIFICATION=ON ..
  # Build using the Release configuration.
  cmake --build . --config "Release"
}

package() {
  # Create installation directories for the plugin formats.
  install -d "$pkgdir/usr/lib/vst3/Oscilloscope"
  install -d "$pkgdir/usr/lib/lv2/Oscilloscope"
  install -d "$pkgdir/usr/lib/clap/Oscilloscope"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # Install the built artifacts paths mirror those produced by your CI/CD script.
  cp -r "$srcdir/Oscilloscope/build/src/OscilloscopePlugin_artefacts/Release/VST3" "$pkgdir/usr/lib/vst3/Oscilloscope/"
  cp -r "$srcdir/Oscilloscope/build/src/OscilloscopePlugin_artefacts/Release/LV2" "$pkgdir/usr/lib/lv2/Oscilloscope/"
  cp -r "$srcdir/Oscilloscope/build/src/OscilloscopePlugin_artefacts/Release/CLAP" "$pkgdir/usr/lib/clap/Oscilloscope/"

  # Install the license.
  if [ -f "$srcdir/Oscilloscope/LICENSE" ]; then
    install -Dm644 "$srcdir/Oscilloscope/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    curl -L "https://raw.githubusercontent.com/USERNAME/Oscilloscope/refs/heads/main/LICENSE" \
      -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

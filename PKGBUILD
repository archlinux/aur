# Maintainer: David Hess (Lunix) <davidhess336@gmx.de>
# PKGBUILD for Disflux Unstable (latest git commit)

pkgname=dimethoxy-disflux-git
# pkgver is generated from the latest git commit; the initial dummy version is 0.0.0.
pkgver=ce3a425
pkgrel=1
pkgdesc="Unstable build of the latest commit of Disflux from Dimethoxy's GitHub repository"
arch=('x86_64')
url="https://github.com/Dimethoxy/Disflux"
license=('GPL3')
provides=('dimethoxy-disflux')
conflicts=('dimethoxy-disflux' 'dimethoxy-disflux-git' 'dimethoxy-disflux-bin')
# Source from the git repo (unstable build using the latest commit)
source=("git+https://github.com/Dimethoxy/Disflux.git")
sha256sums=('SKIP')

# Build and runtime dependencies – adjust as necessary for your project.
makedepends=('gcc' 'git' 'cmake' 'ninja' 'pkg-config' 'alsa-lib' 'jack' 'ladspa' 
     'curl' 'freetype2' 'fontconfig' 'libx11' 'libxcomposite' 'libxcursor' 
     'libxext' 'libxinerama' 'libxrandr' 'libxrender' 'webkit2gtk' 'glu' 'mesa')
depends=('curl')

# Generate a proper pkgver from the git commit (using git describe)
pkgver() {
  cd "$srcdir/Disflux"
  # Extract the latest tag (assumed to be the base version)
  base_version=$(git describe --tags --abbrev=0 | sed 's/^v//')
  # Get the short commit hash
  commit_hash=$(git rev-parse --short HEAD)
  # Construct the version string
  echo "${commit_hash}"
}


build() {
  cd "$srcdir/Disflux"
  mkdir -p build
  cd build
  # Configure using the CMake preset defined in your project.
  cmake --preset "Linux Release" -DDMT_DISABLE_UPDATE_NOTIFICATION=ON ..
  # Build using the Release configuration.
  cmake --build . --config "Release"
}

package() {
  # Create installation directories for the plugin formats.
  install -d "$pkgdir/usr/lib/vst3/Disflux"
  install -d "$pkgdir/usr/lib/lv2/Disflux"
  install -d "$pkgdir/usr/lib/clap/Disflux"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # Install the built artifacts paths mirror those produced by your CI/CD script.
  cp -r "$srcdir/Disflux/build/src/DisfluxPlugin_artefacts/Release/VST3" "$pkgdir/usr/lib/vst3/Disflux/"
  cp -r "$srcdir/Disflux/build/src/DisfluxPlugin_artefacts/Release/LV2" "$pkgdir/usr/lib/lv2/Disflux/"
  cp -r "$srcdir/Disflux/build/src/DisfluxPlugin_artefacts/Release/CLAP" "$pkgdir/usr/lib/clap/Disflux/"

  # Install the license.
  if [ -f "$srcdir/Disflux/LICENSE" ]; then
    install -Dm644 "$srcdir/Disflux/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    curl -L "https://raw.githubusercontent.com/USERNAME/Disflux/refs/heads/main/LICENSE" \
         -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

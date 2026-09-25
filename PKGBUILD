# Maintainer: 
# Contributor: 
pkgname=webots-git
pkgver=R2026a.g20260925
pkgrel=1
pkgdesc="Mobile robot simulation software (git version)"
arch=('x86_64')
url="https://cyberbotics.com/"
license=('Apache-2.0')
groups=()

# Build-time dependencies
makedepends=(
  'git'
  'make'
  'gcc'
  'wget'
  'python'
  'freetype2'
  'openal'
  'mesa'
  'glu'
  'libx11'
  'libxrandr'
  'libxrender'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
)

# Runtime dependencies
depends=(
  'freetype2'
  'openal'
  'mesa'
  'glu'
  'libx11'
  'libxrandr'
  'libxrender'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'gcc-libs'
  'glibc'
)

# Optional dependencies
optdepends=(
  'alsa-lib: ALSA sound support'
  'pulseaudio: PulseAudio sound support'
  'ffmpeg: Video recording support'
  'libzip: ZIP file support'
  'libssh: SFTP support'
  'openssl: HTTPS support'
  'zziplib: ZZIP file support'
)

provides=('webots')
conflicts=('webots')

options=('!strip' '!emptydirs')

source=('git+https://github.com/cyberbotics/webots.git')
sha256sums=('SKIP')

pkgver() {
  cd "webots"
  # Get the latest release tag starting with R
  local latest_tag
  latest_tag=$(git describe --long --tags --match 'R*' 2>/dev/null | head -1)
  if [[ -z "$latest_tag" ]]; then
    # Fallback to commit hash
    latest_tag=$(git rev-parse --short HEAD)
    printf 'r%s.g%s' "${latest_tag}" "$(date +%Y%m%d)"
  else
    # Replace - with . for versioning
    printf '%s.g%s' "${latest_tag//-/.}" "$(date +%Y%m%d)"
  fi
}

prepare() {
  cd "webots"
  # Initialize submodules if any
  git submodule update --init --recursive 2>/dev/null || true
}

build() {
  cd "webots"
  
  # Webots uses its own dependency management
  # It will download and build Qt, OIS, assimp, pico, openssl to WEBOTS_HOME
  export WEBOTS_HOME="${srcdir}/webots"
  
  # Build in release mode (optimized)
  msg "Building Webots..."
  make -j$(nproc) release
}

package() {
  cd "webots"
  
  # Webots builds everything in-place under WEBOTS_HOME
  # The main entry point is the 'webots' shell script
  
  # Install directory structure
  install -d "${pkgdir}/usr/share/webots"
  install -d "${pkgdir}/usr/bin"
  
  # Copy the webots launcher script (created during build)
  if [ -f "webots" ]; then
    install -Dm755 webots "${pkgdir}/usr/bin/webots"
  fi
  
  # Copy the actual binary
  if [ -f "bin/webots-bin" ]; then
    install -Dm755 bin/webots-bin "${pkgdir}/usr/share/webots/bin/webots-bin"
  fi
  
  # Copy all libraries
  if [ -d "lib" ]; then
    cp -r lib "${pkgdir}/usr/share/webots/"
  fi
  
  # Copy resources
  if [ -d "resources" ]; then
    cp -r resources "${pkgdir}/usr/share/webots/"
  fi
  
  # Copy include headers
  if [ -d "include" ]; then
    cp -r include "${pkgdir}/usr/share/webots/"
  fi
  
  # Copy projects (sample simulations)
  if [ -d "projects" ]; then
    cp -r projects "${pkgdir}/usr/share/webots/"
  fi
  
  # Copy tests
  if [ -d "tests" ]; then
    cp -r tests "${pkgdir}/usr/share/webots/"
  fi
  
  # Copy documentation
  if [ -d "docs" ]; then
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}"
  fi
  
  # Set WEBOTS_HOME in the launcher script to point to the correct location
  if [ -f "${pkgdir}/usr/bin/webots" ]; then
    sed -i "s|^export WEBOTS_HOME=.*|export WEBOTS_HOME=/usr/share/webots|" \
      "${pkgdir}/usr/bin/webots"
  else
    # Create a wrapper script if the launcher wasn't built
    cat > "${pkgdir}/usr/bin/webots" << EOF
#!/bin/bash
export WEBOTS_HOME=/usr/share/webots
exec /usr/share/webots/bin/webots-bin "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/webots"
  fi
  
  # Create environment file for profile.d
  install -d "${pkgdir}/etc/profile.d"
  echo "export WEBOTS_HOME=/usr/share/webots" > "${pkgdir}/etc/profile.d/webots.sh"
  chmod 644 "${pkgdir}/etc/profile.d/webots.sh"
}

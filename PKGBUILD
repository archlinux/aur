# Maintainer: JJDizz1L <jjdizz1l@proton.me>
#
# Nuvio Linux — Linux-native mpv desktop media player (AUR VCS package).
#
# Builds the latest `dev` branch from source via the Gradle wrapper and bundles
# a baseline x86-64 JRE, so no system Java is required at runtime (system mpv is
# still required for playback). The `dist/arch/PKGBUILD` is the stable
# equivalent; this VCS package lets the fork ship on the AUR before a versioned
# tag exists.
#
# NOTE: the Gradle build downloads its toolchain and dependencies at build time,
# so building requires network access (standard for Gradle AUR packages).

pkgname=nuvio-linux-git
pkgver=r2241.gb06b9c9c
pkgrel=1
pkgdesc="Nuvio Linux desktop media player — Linux native mpv playback (git)"
arch=('x86_64')
url="https://github.com/JJDizz1L/NuvioLinux"
license=('custom:commercial')
depends=('mpv' 'glibc' 'gcc-libs' 'libstdc++' 'libx11' 'libxext' 'libxrender' 'libxi' 'libxtst')
makedepends=('git' 'jdk21-openjdk' 'gcc')
install=nuvio-linux-git.install
provides=('nuvio-linux')
conflicts=('nuvio-linux')
source=("git+https://github.com/JJDizz1L/NuvioLinux.git#branch=dev")
sha256sums=('SKIP')

# Supabase backend — public client config shared with the upstream app. These
# are required at build time so nuvio-account sign-in works; they are
# client-side (anon) credentials and are identical in every shipped binary.
NUVIO_SUPABASE_URL="https://api.nuvio.tv"
NUVIO_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzgxNTIxMzQ2LCJleHAiOjE5MzkyMDEzNDZ9.tmQaj682pwzehpqlgCDMnySOqiUvpgRbrE43T4VJpDI"
NUVIO_SUPABASE_FALLBACK_URL="https://api-two.nuvioapp.space"

pkgver() {
  cd "$srcdir/NuvioLinux" 2>/dev/null || return
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/NuvioLinux"
  export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/java-21-openjdk}"

  # generateRuntimeConfigs requires local.properties to exist (it is gitignored
  # and absent from the archive); write the public Supabase client config so
  # account sign-in works in the built app.
  cat > local.properties <<EOF
NUVIO_SUPABASE_URL=${NUVIO_SUPABASE_URL}
NUVIO_SUPABASE_ANON_KEY=${NUVIO_SUPABASE_ANON_KEY}
NUVIO_SUPABASE_FALLBACK_URL=${NUVIO_SUPABASE_FALLBACK_URL}
EOF

  echo "[nuvio-linux-git] building with JAVA_HOME=${JAVA_HOME}"
  ./gradlew --no-daemon :composeApp:createReleaseDistributable
}

package() {
  cd "$srcdir/NuvioLinux"
  local APP_DIR="${pkgdir}/opt/nuvio-linux"

  install -d "${APP_DIR}"
  cp -r composeApp/build/compose/binaries/main-release/app/nuvio-linux/* "${APP_DIR}/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/nuvio-linux/bin/nuvio-linux "${pkgdir}/usr/bin/nuvio-linux"

  install -Dm644 dist/desktop/nuvio-linux.desktop \
    "${pkgdir}/usr/share/applications/nuvio-linux.desktop"
  install -Dm644 dist/desktop/io.github.jjdizz1l.NuvioLinux.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.jjdizz1l.NuvioLinux.metainfo.xml"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "dist/desktop/icons/hicolor/${size}x${size}/apps/nuvio-linux.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/nuvio-linux.png"
  done
}

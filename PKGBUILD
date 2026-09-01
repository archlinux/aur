# Maintainer: dizziee <jjdizz1l@proton.me>
#
# Nuvio — desktop media player (AUR VCS package).
# Builds the latest upstream Dev branch (NuvioMedia/NuvioDesktop) from
# source via the Gradle wrapper and bundles a Temurin 21 jpackage runtime,
# so no system Java is required at runtime. Playback uses system libmpv
# (mpv dependency). The dist/arch/PKGBUILD in NuvioLinux-unofficial is the
# versioned-stable equivalent.
#
# NOTE: the Gradle build downloads its toolchain and dependencies at build
# time, so building requires network access (standard for Gradle AUR
# packages). The Linux player bridge is compiled against system mpv and
# webkit2gtk-4.1 headers at build time.

pkgname=nuvio-linux-git
pkgver=r2711.g5aca4f3f
pkgrel=2
pkgdesc="Nuvio desktop media player — upstream source packaged for Arch Linux (git)"
arch=('x86_64')
url="https://github.com/NuvioMedia/NuvioDesktop"
license=('GPL3')
depends=('mpv' 'webkit2gtk-4.1' 'gtk3' 'glibc' 'gcc-libs' 'libx11' 'libxcomposite' 'libxext' 'libxrender' 'libxi' 'libxtst')
makedepends=('git' 'jdk21-temurin' 'gcc' 'mpv' 'webkit2gtk-4.1' 'gtk3' 'libxcomposite' 'libxext')
install=nuvio-linux-git.install
provides=('nuvio-linux')
conflicts=('nuvio-linux' 'nuvio-linux-bin')
options=('!strip')
source=("git+https://github.com/NuvioMedia/NuvioDesktop.git#branch=Dev")
sha256sums=('SKIP')

# Supabase backend — public client config shared with the upstream app. These
# are required at build time so nuvio-account sign-in works; they are
# client-side (anon) credentials and are identical in every shipped binary.
NUVIO_SUPABASE_URL="https://api.nuvio.tv"
NUVIO_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzgxNTIxMzQ2LCJleHAiOjE5MzkyMDEzNDZ9.tmQaj682pwzehpqlgCDMnySOqiUvpgRbrE43T4VJpDI"
NUVIO_SUPABASE_FALLBACK_URL="https://api-two.nuvioapp.space"

pkgver() {
  cd "$srcdir/NuvioDesktop"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/NuvioDesktop"

  # Baseline x86-64 JDK (Temurin 21 LTS, AUR) — set unconditionally so the
  # bundled jpackage runtime stays portable (never a -march=v3|v4 JDK build).
  export JAVA_HOME="/usr/lib/jvm/java-21-temurin"

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
  cd "$srcdir/NuvioDesktop"
  local APP_DIR="${pkgdir}/opt/Nuvio"

  # Self-contained jpackage app-image (upstream packageName="Nuvio").
  install -d "${APP_DIR}"
  cp -r composeApp/build/compose/binaries/main-release/app/Nuvio/. "${APP_DIR}/"

  # Launcher on PATH
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Nuvio/bin/Nuvio "${pkgdir}/usr/bin/nuvio"

  # Desktop entry + icon (upstream ships no Linux .desktop)
  install -d "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
  cat > "${pkgdir}/usr/share/applications/nuvio.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Nuvio
Comment=Nuvio desktop media player
Exec=/opt/Nuvio/bin/Nuvio
Icon=nuvio
Terminal=false
Categories=AudioVideo;Video;Player;
EOF
  install -Dm644 composeApp/src/desktopMain/resources/icons/nuvio-app-icon-transparent.png \
    "${pkgdir}/usr/share/pixmaps/nuvio.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
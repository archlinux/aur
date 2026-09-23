pkgname=fuoevolve
pkgver=1.6.3
pkgrel=1
pkgdesc='Open-source cross-platform music player based on FeelUOwn'
arch=('x86_64')
url='https://feeluown.github.io/FuoEvolve/'
license=('GPL-3.0-only')
conflicts=('fuoevolve-bin')
depends=(
  'gtk3'
  'libx11'
  'libxkbcommon'
  'libsecret'
  'mpv'
  'webkit2gtk-4.1'
  'alsa-lib'
  'pipewire'
  'libpulse'
)
makedepends=(
  'git'
  'jdk25-openjdk'
  'rust'
  'nodejs'
  'npm'
  'clang'
  'pkgconf'
  'patchelf'
  'xorg-server-xvfb'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/feeluown/FuoEvolve/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ccaafc6f1c1fc6eb7e1a81e57bd87cd37ed24303179ef66ca1e52f3d564c7c4e')

build() {
  cd "FuoEvolve-${pkgver}"

  export JAVA_HOME='/usr/lib/jvm/java-25-openjdk'
  export GRADLE_USER_HOME="${srcdir}/gradle-home"
  export FUOEVOLVE_PACKAGE_VERSION="${pkgver}"
  export FUOEVOLVE_DESKTOP_CHANNEL='stable'
  export FUOEVOLVE_DESKTOP_VERSION_LABEL="${pkgver}"
  export FUOEVOLVE_COMMIT_SHA='23623f20871af9f7d556f80e69b0ef954ccb266c'

  chmod +x gradlew

  Xvfb :99 -screen 0 1280x1024x24 > "${srcdir}/xvfb.log" 2>&1 &
  local xvfb_pid=$!
  export DISPLAY=:99
  trap 'kill "$xvfb_pid" 2>/dev/null || true' EXIT

  local gradle_status=0
  ./gradlew \
    --no-daemon \
    --no-configuration-cache \
    --warning-mode all \
    --stacktrace \
    -PnativeMarch=compatibility \
    -Pfuoevolve.nucleus.bundleLinuxRuntime=false \
    :desktopApp:packageGraalvmPacman || gradle_status=$?

  kill "$xvfb_pid" 2>/dev/null || true
  trap - EXIT
  return "$gradle_status"
}

package() {
  cd "FuoEvolve-${pkgver}"

  local -a archives
  mapfile -t archives < <(
    find desktopApp/build -type f \
      \( -name '*.pacman' -o -name '*.pkg.tar.xz' -o -name '*.pkg.tar.zst' \) \
      -print
  )
  if (( ${#archives[@]} != 1 )); then
    printf 'Expected exactly one source-built Arch package, found %d\n' "${#archives[@]}" >&2
    printf '%s\n' "${archives[@]}" >&2
    return 1
  fi

  bsdtar \
    --exclude='.PKGINFO' \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.INSTALL' \
    -xf "${archives[0]}" \
    -C "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

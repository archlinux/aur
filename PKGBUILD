# Maintainer: italoghost <eduprodive at posteo dot me>

pkgname=freetube-electron-git
_pkgname=FreeTube
_electron=electron41
pkgver=0.24.0.beta.r10160.b55e623
pkgrel=1
pkgdesc='A private YouTube client - built from latest git, using the system electron.'
arch=('x86_64')
url="https://freetubeapp.io"
license=('AGPL-3.0-or-later')

# Added explicit dependencies to satisfy namcap and ensure runtime stability
depends=($_electron 'alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'libnm')
makedepends=('git' 'pnpm')
provides=("freetube")
conflicts=("freetube" "freetube-bin" "freetube-git")
source=(git+https://github.com/FreeTubeApp/FreeTube
        freetube.desktop)
sha256sums=("SKIP"
            "496fc67b30fa66e8eff1e551121e5bb7ae0253bfb804b3a902d4e7bd3cdcbc26")

pkgver() {
  cd "$_pkgname"
  # Generate version based on the latest tag, commit count, and short hash
  printf "%s.r%s.%s" "$(git tag --sort=committerdate | tail -1 | sed 's/^v//;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"

  # Inject system electron path into the build configuration
  sed -i "5i \  electronDist: '/usr/lib/$_electron'," "_scripts/ebuilder.config.mjs"

  # Configure the builder to create a directory output instead of a compressed installer
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "_scripts/build.mjs"
}

build() {
  cd "$_pkgname"
  pnpm run ci
  pnpm run lint
  pnpm run build
}

package() {
  cd "$_pkgname"

  # Create necessary directory structure
  install -d "${pkgdir}/opt/freetube"
  install -d "${pkgdir}/usr/bin"

  # Install the app.asar bundle
  #cp -R "build/linux-unpacked/resources/app.asar" "${pkgdir}/opt/freetube/"

  # Create the launcher script using the system electron
  #printf "#!/bin/sh\nexec %s /opt/freetube/app.asar \"\$@\"\n" "$_electron" > "${pkgdir}/usr/bin/freetube"
  #chmod 755 "${pkgdir}/usr/bin/freetube"

  # Temporaly use the compiled binary instead of the script with the system electron
  cp -R "build/linux-unpacked/." "${pkgdir}/opt/freetube/"
  ln -s "/opt/freetube/freetube" "${pkgdir}/usr/bin/freetube"

  # Install license, icon, and desktop entry
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "_icons/icon.svg" "${pkgdir}/usr/share/pixmaps/freetube.svg"
  install -Dm644 "${srcdir}/freetube.desktop" "${pkgdir}/usr/share/applications/freetube.desktop"
}

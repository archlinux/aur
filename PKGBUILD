# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgbase=bisq
pkgname=(
  bisq-desktop
  bisq-cli
  bisq-daemon
)
pkgver=1.10.3
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk21-openjdk')
makedepends=('jdk21-openjdk' 'git')
# The release tag is PGP-signed by the Bisq release manager; makepkg
# verifies it against validpgpkeys (?signed). Import the key first:
#   curl -fsSL https://bisq.network/pubkey/E222AA02.asc | gpg --import
# bitcoind (Bisq's node-integration modules, a gradle includeBuild) is a
# git submodule that release tarballs don't ship, so it is a second git
# source and prepare() points the submodule at the local clone. The
# revision to check out comes from the signed tag itself.
source=("git+https://github.com/bisq-network/bisq.git#tag=v${pkgver}?signed"
  "git+https://github.com/bisq-network/bitcoind.git"
  "bisq.desktop"
  "bisq-desktop-launcher")
sha256sums=('SKIP'
            'SKIP'
            '9f2ee38c5089f5a929f978a0fd0adabba6bd7e42fd89864dcf2e0bfa0dcd90d2'
            '59029081b943f51e0e3efe4a82abbf5bd3c0a33b49117837cd30e25ec48cb7bd')
validpgpkeys=('B493319106CC3D1F252E19CBF806F422E222AA02') # Alejandro García <alejandro.garcia@disroot.org>

prepare() {
  cd "${srcdir}/bisq"
  git config submodule.bitcoind.url "${srcdir}/bitcoind"
  git -c protocol.file.allow=always submodule update --init bitcoind
}

build() {
  cd "${srcdir}/bisq"
  msg2 "Building bisq..."
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  ./gradlew :desktop:build :cli:build :daemon:build \
    -Dorg.gradle.java.home=/usr/lib/jvm/java-21-openjdk \
    -Dorg.gradle.java.installations.paths=/usr/lib/jvm/java-21-openjdk \
    -Porg.gradle.java.installations.auto-download=false \
    -x test
}

package_bisq-desktop() {
  conflicts=("bisq-bin" "bisq-git" "bisq")
  provides=("bisq")
  replaces=("bisq")

  install -d "${pkgdir}/opt/bisq-desktop"
  cp -r "${srcdir}/bisq/desktop/build/install/desktop/." "${pkgdir}/opt/bisq-desktop"

  # JavaFX must be loaded as named modules (not via classpath) so the
  # --add-exports/--add-opens flags resolve and HiDPI GTK auto-detection
  # works. Move javafx-*.jar to a dedicated module-path subdir and patch
  # the gradle-generated launcher.
  install -d "${pkgdir}/opt/bisq-desktop/lib/javafx"
  mv "${pkgdir}/opt/bisq-desktop/lib/"javafx-*.jar "${pkgdir}/opt/bisq-desktop/lib/javafx/"
  sed -i \
    -e 's|\$APP_HOME/lib/javafx-[^:]*\.jar:||g' \
    -e 's|:\$APP_HOME/lib/javafx-[^:]*\.jar||g' \
    -e "s|^DEFAULT_JVM_OPTS='|DEFAULT_JVM_OPTS='\"--module-path\" \"/opt/bisq-desktop/lib/javafx\" \"--add-modules\" \"javafx.controls,javafx.fxml\" |" \
    "${pkgdir}/opt/bisq-desktop/bin/desktop"

  # JavaFX on Linux doesn't auto-detect compositor HiDPI scaling, so
  # /usr/bin/bisq-desktop is a thin wrapper that resolves the user's UI
  # scale and passes it via -Dglass.gtk.uiScale. See bisq-desktop-launcher.
  install -Dm755 "${srcdir}/bisq-desktop-launcher" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq-desktop.desktop"
  install -Dm644 "${srcdir}/bisq/desktop/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq-desktop.png"
}

package_bisq-cli() {
  install -d "${pkgdir}/opt/bisq-cli"
  cp -r "${srcdir}/bisq/cli/build/install/cli/." "${pkgdir}/opt/bisq-cli"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq-cli/bin/cli" "${pkgdir}/usr/bin/bisq-cli"
}

package_bisq-daemon() {
  install -d "${pkgdir}/opt/bisq-daemon"
  cp -r "${srcdir}/bisq/daemon/build/install/daemon/." "${pkgdir}/opt/bisq-daemon"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq-daemon/bin/daemon" "${pkgdir}/usr/bin/bisq-daemon"
}

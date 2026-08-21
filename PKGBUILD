# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=nextcloud-native
pkgver=0.1.0alpha.2
pkgrel=1
pkgdesc="Adaptive native client for Nextcloud files, media and apps"
arch=('x86_64')
url="https://nc-native.obiente.dev"
license=('AGPL-3.0-or-later')
# createDistributable produces a jpackage application image with its own jlink
# runtime, so the shared libraries that runtime needs are the only depends.
depends=('alsa-lib' 'brotli' 'bzip2' 'expat' 'fontconfig' 'freetype2'
         'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libbsd' 'libglvnd' 'libmd'
         'libpng' 'libsecret' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext'
         'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'zlib')
# The Android SDK, Rust and Node.js that CONTRIBUTING.md lists are needed for
# the mobile target, the Windows shell helper and the website. The Linux
# desktop image builds with JDK 21 alone; python renders the AppStream file.
makedepends=('jdk21-openjdk' 'python')
optdepends=('gnome-keyring: Secret Service provider for stored accounts'
            'kwallet: Secret Service provider for stored accounts on Plasma'
            'fuse2: mount an account as a virtual file system')
options=('!strip' '!debug')
# Upstream has no stable release yet; only the versioned tags are packaged.
# pkgver drops the hyphen from the tag; see pkg.sh.
_tag="v0.1.0-alpha.2"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Obiente/nc-native/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('7ec5b795778668f133f0fe3d3e41e11b4fcb0c2e825c794c3915d791af14f920')

_srcname="nc-native-${_tag#v}"

build() {
  cd "$_srcname"

  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  # keep Gradle's cache inside the build tree instead of ~/.gradle
  export GRADLE_USER_HOME="$srcdir/gradle-home"

  # Gradle resolves the dependency graph from Maven Central and Google's
  # repository during this step, so build() needs network access.
  ./gradlew --no-daemon --console=plain :ui:createDistributable
}

package() {
  cd "$_srcname"

  install -d "$pkgdir/opt/nextcloudnative"
  cp -a ui/build/compose/binaries/main/app/NextcloudNative/. \
    "$pkgdir/opt/nextcloudnative/"

  # the launcher resolves its own directory through /proc/self/exe, so a
  # symlink into /usr/bin keeps the application image self-contained
  install -d "$pkgdir/usr/bin"
  ln -s /opt/nextcloudnative/bin/NextcloudNative "$pkgdir/usr/bin/nextcloud-native"

  # upstream's jpackage template, with the launcher path jpackage would fill in
  sed "s|^Exec=.*|Exec=/opt/nextcloudnative/bin/NextcloudNative|" \
    release/linux/jpackage/NextcloudNative.desktop \
    > "$srcdir/nextcloudnative-NextcloudNative.desktop"
  install -Dm644 "$srcdir/nextcloudnative-NextcloudNative.desktop" \
    "$pkgdir/usr/share/applications/nextcloudnative-NextcloudNative.desktop"

  install -Dm644 ui/src/desktopMain/resources/nextcloud-native.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev.obiente.nextcloudnative.png"

  # same renderer the packageDeb path uses, fed from gradle.properties so the
  # metadata cannot drift away from the tag being built
  python3 tools/render-linux-appstream-metadata.py \
    release/linux/dev.obiente.nextcloudnative.metainfo.xml \
    "$pkgdir/usr/share/metainfo/dev.obiente.nextcloudnative.metainfo.xml" \
    "$(grep -Po '^ncDesktopPackageVersion=\K.*' gradle.properties)" \
    "$(grep -Po '^ncVersionName=\K.*' gradle.properties)" \
    "$(date -u -d "@$SOURCE_DATE_EPOCH" +%F)"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

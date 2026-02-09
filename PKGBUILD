# Maintainer: Masato TOYOSHIMA <phoepsilonix at gmail dot com>
# Contributor: Alessandro Bernardello

#_tag=auth-v4.4.15
#_commit=fd27208e058a75c3c951db0118329aab3b9cb1a4

# https://github.com/ente-io/ente/blob/main/.github/workflows/auth-release.yml
_FLUTTER_VERSION=3.32.8
_jdk_ver=17

_pkgname=enteauth
pkgname=ente-auth-git
pkgver=4.4.17.r28.gfd27208
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://github.com/ente-io/ente/tree/main/auth"
license=('AGPL-3.0-only')
depends=('at-spi2-core' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libsecret' 'pango' 'libepoxy' 'curl' 'fontconfig')
makedepends=('patchelf' 'clang' 'git' 'cmake' 'ninja' "jdk${_jdk_ver}-openjdk" 'mold')
options=('!strip' '!emptydirs')
source=("git+https://github.com/ente-io/auth.git"
        "fix-flutter.patch"
)

source_x86_64=("https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_FLUTTER_VERSION}-stable.tar.xz")
sha512sums=('SKIP'
            '00a812be226ae347d9bda689245a5af39b967e62e8d7d838ff02434e1d4735a79b4e60054ee1bf18f912c7e086c912d4d5c1fb5deb4be2b9edb12eb935c4f594')
sha512sums_x86_64=('c46984bb59a3fb5337d1bd4dd7f41306ad66a8b0430c69a41c755c3d8d8ebe0a3b5be7c8fdc25ef202cfeab7faa31914ffb21bc4ad928f4eb7d352ca00248f3e')
provides=('ente-auth')
conflicts=('ente-auth')

export PATH_=$PATH
export LD=ld.mold
export LDFLAGS="$LDFLAGS -Wl,-z,relro,-z,now"
options=('strip')

pkgver() {
  cd "$srcdir/auth"
  # cutting off 'auth-v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^auth-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

set_env(){
    export PUB_CACHE="${srcdir}/.pub-cache"
    export PATH="$srcdir/flutter/bin":"$PATH_":"$PUB_CACHE/bin"
    export JAVA_HOME="/usr/lib/jvm/java-${_jdk_ver}-openjdk"
}

prepare(){
    cd "$srcdir/auth"
    git submodule update --init --recursive
    patch -p1 -i "${srcdir}/fix-flutter.patch"

    # metainfo
    cd "$srcdir/auth/mobile/apps/auth/"
    APPDATA_FILE="linux/packaging/enteauth.appdata.xml"
    RELEASE_DATE=$(date -u +%Y-%m-%d)

    # Extract version from pkgver (e.g., 4.4.15.r0.gbb7d369eeb -> 4.4.15)
    VERSION_NAME=${pkgver%%\.r*}

    # Create new release entry
    NEW_RELEASE="        <release version=\"${VERSION_NAME}\" date=\"${RELEASE_DATE}\" />"

    # Insert new release entry after <releases> tag
    sed -i "/<releases>/a\\${NEW_RELEASE}" "$APPDATA_FILE"

    echo "✅ Updated $APPDATA_FILE with version ${VERSION_NAME}"
    echo "Release entry added:"
    echo "$NEW_RELEASE"

    set_env
    # Disable analytics
    flutter --disable-analytics

    # Ensure no build artifacts are cached
    flutter clean
}

build() {
    set_env
    
    cd "${srcdir}/auth/mobile/packages/strings"
    flutter gen-l10n
    
    cd "$srcdir/auth/mobile/apps/auth/"
    flutter config --no-analytics
    dart --disable-analytics
    flutter pub get
    flutter config --enable-linux-desktop
    #flutter build linux --release
    
    dart pub global activate --source git https://github.com/ente-io/fastforgefork --git-ref develop --git-path packages/fastforge
    fastforge package --platform=linux --targets=pacman --skip-clean
}

check() {
    cd "$srcdir/auth/mobile/apps/auth/"
    set_env
    flutter test
}

package(){
    cd "$srcdir/auth/mobile/apps/auth/"
    # fakeroot environment
    tar --no-same-owner --owner 0 --group 0 -xvf ./dist/*/ente_auth-*-linux.pacman --exclude="\.*" -C "$pkgdir"

    # libsodium.so is needed by libflutter_linux_gtk.so.
    patchelf --add-needed libsodium.so "${pkgdir}/usr/share/${_pkgname}/lib/libflutter_linux_gtk.so"

    # ICON: added StartupWMClass to desktop file
    # The Version field in the Desktop Entry indicates the specification version and is typically 1.0. The application version should be specified as X-Version.
    local desktop_file="${pkgdir}/usr/share/applications/enteauth.desktop"
    sed -i '/^StartupWMClass=/d' "$desktop_file" && sed -i 's/^Version=\(.*\)/X-Version=\1/; $a StartupWMClass=io.ente.auth' "$desktop_file"

    # file layout: namcap check
    mkdir -p "${pkgdir}/usr/lib/enteauth"
    mv "${pkgdir}/usr/share/enteauth/enteauth" "${pkgdir}/usr/lib/enteauth/"
    mv "${pkgdir}/usr/share/enteauth/lib" "${pkgdir}/usr/lib/enteauth"
    mv "${pkgdir}/usr/share/enteauth/data" "${pkgdir}/usr/lib/enteauth/"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/enteauth/enteauth" "${pkgdir}/usr/bin/enteauth"

    # remove insecure RUNPATH
    for so_file in ${pkgdir}/usr/lib/enteauth/lib/*.so; do
        while read -r rpath; do
          if [[ "$rpath" == *"${srcdir}"* ]]; then
              patchelf --remove-rpath "$so_file"
          fi
        done < <(patchelf --print-rpath "$so_file" | tr ':' '\n')
    done
}

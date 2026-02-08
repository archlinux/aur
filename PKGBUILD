# Maintainer: Masato TOYOSHIMA <phoepsilonix at gmail dot com>
# Contributor: Alessandro Bernardello

#_tag=auth-v4.4.15
#_commit=fd27208e058a75c3c951db0118329aab3b9cb1a4

# https://github.com/ente-io/ente/blob/main/.github/workflows/auth-release.yml
_FLUTTER_VERSION=3.32.8

_pkgname=enteauth
pkgname=ente-auth-git
pkgver=4.4.17.r28.gfd27208
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://github.com/ente-io/ente/tree/main/auth"
license=('AGPL-3.0')
depends=('at-spi2-core' 'ayatana-ido' 'cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libayatana-appindicator' 'libsecret' 'libsodium' 'pango' 'sqlite' 'webkit2gtk')
makedepends=('patchelf' 'clang' 'git' 'cmake' 'ninja' 'jdk17-openjdk')
options=('!strip' '!emptydirs')
source_x86_64=("git+https://github.com/ente-io/auth.git"
        "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_FLUTTER_VERSION}-stable.tar.xz"
        "fix-flutter.patch"
)
sha512sums_x86_64=('SKIP'
                   'c46984bb59a3fb5337d1bd4dd7f41306ad66a8b0430c69a41c755c3d8d8ebe0a3b5be7c8fdc25ef202cfeab7faa31914ffb21bc4ad928f4eb7d352ca00248f3e'
                   '191c8d8246573ce1df5e501a6cc2ecbe102899b266c25684f13472d1f0de8db48835a25419607bb02fa62205ecbfa024cd19de315fe6a7762f711df6a23b2ac5')
provides=('ente-auth')
conflicts=('ente-auth')

pkgver() {
  cd "$srcdir/auth"
  # cutting off 'auth-v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^auth-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
}

build() {
    export PUB_CACHE="${srcdir}/.pub-cache"
    export PATH="$srcdir/flutter/bin":"$PATH":"$PUB_CACHE/bin"
    export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
    
    cd "${srcdir}/auth/mobile/packages/strings"
    flutter gen-l10n
    
    cd "$srcdir/auth/mobile/apps/auth/"
    flutter pub get
    flutter config --enable-linux-desktop
    #flutter build linux --release
    
    dart pub global activate --source git https://github.com/ente-io/fastforgefork --git-ref develop --git-path packages/fastforge
    fastforge package --platform=linux --targets=pacman --skip-clean
}

package(){
    cd "$srcdir/auth/mobile/apps/auth/"
    tar xvf ./dist/*/ente_auth-*-linux.pacman --exclude="\.*" -C "$pkgdir"

    # libsodium.so is needed by libflutter_linux_gtk.so.
    patchelf --add-needed libsodium.so "${pkgdir}/usr/share/${_pkgname}/lib/libflutter_linux_gtk.so"

    # ICON: added StartupWMClass to desktop file
    # The Version field in the Desktop Entry indicates the specification version and is typically 1.0. The application version should be specified as X-Version.
    local desktop_file="${pkgdir}/usr/share/applications/enteauth.desktop"
    sed -i '/^StartupWMClass=/d' "$desktop_file" && sed -i 's/^Version=\(.*\)/X-Version=\1/; $a StartupWMClass=io.ente.auth' "$desktop_file"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/usr/share/enteauth/enteauth" "${pkgdir}/usr/bin/enteauth"
    chmod +x "${pkgdir}/usr/bin/enteauth"
}

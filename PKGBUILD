# Maintainer: Masato TOYOSHIMA <phoepsilonix at gmail dot com>
# Contributor: Alessandro Bernardello

#_tag=auth-v4.4.15
#_commit=fd27208e058a75c3c951db0118329aab3b9cb1a4

_pkgname=enteauth
pkgname=ente-auth-git
pkgver=4.4.17.r28.gfd27208e05
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://github.com/ente-io/ente/tree/main/auth"
license=('AGPL-3.0')
depends=('at-spi2-core' 'ayatana-ido' 'cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libayatana-appindicator' 'libsecret' 'libsodium' 'pango' 'sqlite' 'webkit2gtk')
makedepends=('flutter' 'flutter-tool' 'patchelf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("git+https://github.com/ente-io/auth.git"
        fix-flutter.patch
)
sha512sums_x86_64=('SKIP'
                   '191c8d8246573ce1df5e501a6cc2ecbe102899b266c25684f13472d1f0de8db48835a25419607bb02fa62205ecbfa024cd19de315fe6a7762f711df6a23b2ac5')
provides=('ente-auth')
conflicts=('ente-auth')

pkgver() {
  cd "$srcdir/auth"
  # cutting off 'auth-v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^auth-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/auth"
    git submodule update --init --recursive
    patch -p1 -i ${srcdir}/fix-flutter.patch

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
    patchelf --add-needed libsodium.so ${pkgdir}/usr/share/${_pkgname}/lib/libflutter_linux_gtk.so
}

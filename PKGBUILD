# Maintainer: Alessandro Bernardello
# Contributor: Alessandro Bernardello
pkgname=ente-auth-git
pkgver=auth.v2.0.50.r33.ge1ac5e739
pkgrel=2
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://github.com/ente-io/ente/tree/main/auth"
license=('AGPL-3.0')
depends=('at-spi2-core' 'ayatana-ido' 'cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libayatana-appindicator' 'libsecret' 'libsodium' 'pango' 'sqlite' 'webkit2gtk')
makedepends=('flutter' 'flutter-tool')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("git+https://github.com/ente-io/auth.git"
                "ente_auth.desktop"
)
sha512sums_x86_64=('SKIP'
                  'ae03fe007d28ad9ccbda6f48aa5635f233e283fa34e264e636a76263c9f32bad4a31c02aafefa9af7b04714eaebbce3bae0dd13aaea28fe110c0f9a8bbcf48bc')
provides=('ente-auth')
conflicts=('ente-auth')

pkgver() {
  cd "$srcdir/auth"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/auth"
    git submodule update --init --recursive
}

build() {
    # i really don't know how to make flutter strip all references to the build directory
    # this means that the build won't be truly reproducible and makepkg will spam warnings about references to $srcdir in the built package
    # this should be safe to ignore anyways
    cd "$srcdir/auth/auth"
    flutter pub get
    flutter build linux --release
}

package(){
    # this could probably be done better
    install -m755 -d "$srcdir/auth/auth/build/linux/x64/release/bundle/" "$pkgdir/usr/share/ente_auth"
    cp -R "$srcdir/auth/auth/build/linux/x64/release/bundle/"* "$pkgdir/usr/share/ente_auth/"
    chmod 755 "$pkgdir/usr/share/ente_auth/ente_auth"
    find $pkgdir/usr/share/ente_auth/data -type d -exec chmod 755 {} +
    find $pkgdir/usr/share/ente_auth/data -type f -exec chmod 644 {} +
    find $pkgdir/usr/share/ente_auth/lib -type d -exec chmod 755 {} +
    find $pkgdir/usr/share/ente_auth/lib -type f -exec chmod 644 {} +
    install -Dm644 "$srcdir/ente_auth.desktop" "${pkgdir}/usr/share/applications/ente_auth.desktop"
}

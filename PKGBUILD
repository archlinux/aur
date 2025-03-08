# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
# shellcheck disable=SC2148

pkgname='jhentai-git'
_reponame='JHenTai'
pkgver='v8.0.6_276'
_ver_main='8.0.6'
_ver_sub='276'
pkgdesc='A manga app for E-Hentai, supporting Android & iOS & Windows & MacOS & Linux.'
conflicts=('jhentai-bin')
provides=("jhentai-bin=${pkgver}")

arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/jiangtian616/JHenTai'
license=('Apache-2.0')
pkgrel='1'
options=(!debug)
makedepends=(
    'git'
    'flutter-target-linux'
    'flutter-tool'
    'webkit2gtk-4.1'
)
depends=(
    'webkit2gtk-4.1'
)

pkgver() {
    cd "$srcdir/$_reponame" || exit
    _ver="$(head -n 5 pubspec.yaml | tail -n 1 | cut -d ' ' -f 2)"
    printf "v%s_%s" "$(echo "$_ver" | cut -d'+' -f1)" "$(echo "$_ver" | cut -d'+' -f2)"
}

source=("git+https://github.com/jiangtian616/JHenTai#branch=linux-build")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$_reponame" || exit
    flutter pub add path:1.9.1 # flutter_test require path 1.9.1
    flutter build linux --release -t lib/src/main.dart
}

package() {
    # Install application
    install -dm0755 "$pkgdir/opt/jhentai/"
    cp -a "$srcdir/$_reponame/build/linux/x64/release/bundle/"* "$pkgdir/opt/jhentai/"

    # Install icons
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    cp "$srcdir/$_reponame/assets/icon/JHenTai_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/top.jtmonster.jhentai.png"
    chmod 644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/top.jtmonster.jhentai.png"

    # Install desktop file
    install -dm0755 "$pkgdir/usr/share/applications"
    cp "$srcdir/$_reponame/linux/assets/top.jtmonster.jhentai.desktop" "$pkgdir/usr/share/applications/"
    chmod 644 "$pkgdir/usr/share/applications/top.jtmonster.jhentai.desktop"

    # Symlink binary to /usr/bin
    install -dm0755 "$pkgdir/usr/bin"
    ln -s /opt/jhentai/jhentai "$pkgdir/usr/bin/jhentai"
}

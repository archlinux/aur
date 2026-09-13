# Maintainer: wearzdk <hi@wearzdk.me>
pkgname=nahimic-linux
pkgver=0.3.0
pkgrel=1
pkgdesc='Nahimic speaker effects and equalizer for supported Linux laptops'
arch=('x86_64')
url='https://github.com/wearzdk/nahimic-linux'
license=('MIT' 'LicenseRef-Nahimic')
depends=('python' 'pyside6' 'wine' 'pipewire' 'pipewire-pulse' 'wireplumber>=0.5' 'libpulse' 'systemd' 'hicolor-icon-theme' 'bash' 'glibc')
makedepends=('mingw-w64-gcc' 'pkgconf' 'cabextract' 'git')
install=nahimic-linux.install
options=('!strip' '!debug')
source=("$pkgname::git+$url#tag=v$pkgver"
        'nahimic-apo4-4.14.cab::https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2025/06/5038101c-bafc-45b6-b338-d086f6877059_8ba41f8fd185d004f674891c937eb6b815acb443.cab'
        'nahimic-runtime-settings.exe::https://nahimic.helprace.com/resources/SdHjE1CwBkqCwL1qTng83XvmSgyUM3WU8bA3F21ZCfca-wMam1lcLqCrQgAIHtE1DyfpwdnFPjQ5DuRdOgpXLg%7E%7E/GenericNahimicRestoreTool.exe'
        'nahimic-linux.install')
noextract=('nahimic-apo4-4.14.cab' 'nahimic-runtime-settings.exe')
sha256sums=('SKIP'
            'f3b1aae44826f85045cff8e085367dd8b48ffb3510e074adf552cc8eafbf8bde'
            '5f9c4d9eda54b7f946e331740354f01c043f25408d7053b4c23327c1b5b0a74a'
            'f8206f52fd53c647e8ab1707545d5d977a2dd1495ba76b1f24abdb4faf35ce6e')

prepare() {
    python "$srcdir/$pkgname/packaging/extract_runtime.py" \
        "$srcdir/nahimic-apo4-4.14.cab" "$srcdir/nahimic-runtime-settings.exe" "$srcdir/runtime"
}
build() {
    make -C "$srcdir/$pkgname"
    strip --strip-unneeded "$srcdir/$pkgname/bin/pulse_state"
}
package() {
    make -C "$srcdir/$pkgname" DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/nahimic-linux"
    cp -r "$srcdir/runtime/vendor" "$srcdir/runtime/factory" "$pkgdir/usr/share/nahimic-linux/"
}

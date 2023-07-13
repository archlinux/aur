# Maintainer: Ivan Fedorov <i@ifedorov.me>

pkgname=rupost-desktop
pkgver=115.0.109
pkgrel=1
pkgdesc="RuPost Desktop - почтовый клиент, созданный на базе нового поколения Thunderbird (Supernova) компанией ООО 'РуПост'"
arch=("x86_64")
url="http://www.rupost.ru/desktop"
license=('custom')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'hunspell')
optdepends=('hyphen: Hyphenation'
            'libcanberra: Sound support')
provides=("$pkgname")
install=
source=(
    "https://www.rupost.ru/desktop/download/linux/${pkgname}-${pkgver}.ru.linux-x86_64.deb"
)
sha256sums=("2ef3852c9c247c85fe2fa61eaaac370f3124957764df63fb8e4e26096a98f167")

package() {
    tar -xC "$pkgdir" -f data.tar.xz
    # Move license to correct directory
    mkdir -p "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/share/doc/"$pkgname" "$pkgdir"/usr/share/licenses/"$pkname"
    rm -r "$pkgdir"/usr/share/doc
    # Fix dock icon.
    sed -i -e 's/RemotingName=rupost-desktop-default/RemotingName=rupost-desktop/' "$pkgdir"/usr/lib/rupost-desktop/application.ini
    sed -i -e \
        's/$MOZ_LIBDIR\/$MOZ_APP_NAME "$@"/$MOZ_LIBDIR\/$MOZ_APP_NAME -app \/usr\/lib\/rupost-desktop\/application.ini "$@"/' \
        "$pkgdir"/usr/bin/rupost-desktop
    sed -i -e \
        's/$MOZ_LIBDIR\/$EXE "$@"/$MOZ_LIBDIR\/$EXE -app \/usr\/lib\/rupost-desktop\/application.ini "$@"/' \
        "$pkgdir"/usr/bin/rupost-desktop
}

# Maintainer: Marcus Andersson <m.andersson0602 at gmail.com>

pkgname=icons-in-terminal
pkgver=r93.b12286d
pkgrel=2
pkgdesc="Icon fonts in terminal without a need for replacing or patching existing"
url="https://github.com/sebastiencs/icons-in-terminal"
arch=('any')
license=('custom:MIT')
provides=('icons-in-terminal')
conflicts=('icons-in-terminal')
depends=('fontconfig')
makedepends=('git')
source=('git://github.com/sebastiencs/icons-in-terminal.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"

    sed -i 's filename="./build/mapping.txt" filename="/etc/icons-in-terminal/mapping.txt" ' print_icons.sh
    ./scripts/generate_fontconfig.sh > 30-"$pkgname".conf
}

package() {

    install -dm755 "${pkgdir}"/etc/icons-in-terminal
    install -dm755 "${pkgdir}"/etc/fonts/conf.avail
    install -dm755 "${pkgdir}"/etc/fonts/conf.d
    install -dm755 "${pkgdir}"/usr/share/fonts/TTF
    install -dm755 "${pkgdir}"/usr/bin

    cd "$srcdir/$pkgname"

    install -m644 30-"$pkgname".conf    "${pkgdir}"/etc/fonts/conf.avail/
    install -m644 build/*.ttf           "${pkgdir}"/usr/share/fonts/TTF/
    install -m644 build/*               "${pkgdir}"/etc/icons-in-terminal/
    install -m755 print_icons.sh        "${pkgdir}"/usr/bin/icons-in-terminal

    pushd "${pkgdir}"/etc/fonts/conf.avail
    for config in *; do
        ln -sf ../conf.avail/${config} ../conf.d/${config}
    done
    popd

    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install='icons-in-terminal.install'
}

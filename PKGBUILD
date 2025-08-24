# Maintainer: notfire <luke@notfire.cc>

pkgname=sharkey
pkgver=2025.4.4
pkgrel=1
pkgdesc='A Sharkish microblogging platform'
url='https://activitypub.software/TransFem-org/Sharkey'
license=('AGPL')
arch=('x86_64' 'aarch64')
depends=(npm pnpm postgresql valkey ffmpeg python pango)
provides=("$pkgname")
backup=('var/lib/sharkey/Sharkey/.config/default.yml')
install=sharkey.install
source=('sharkey.sysusers'
        'sharkey.tmpfiles'
        'sharkey.service'
        )
sha512sums=('73bf054122fc6a0372deee3f0613f3432bc59c6a55e30277a9e202de325af1150b8f491877a5792e38d5a61c56a34d6cf88b8396b4989f5ddafc64ad59ecc91c'
            'a02f0f29a216d43671f795faa99cfc72413173d7e3977e247f1d1cea0421a3b6d435300cc5e7c66ea2fab3581f7749ab9cf967c205ff1d6869b6408c04e6b394'
            '6f6f20b017191f452081051a279eda28ad938bf1a46ffa29377fcd4c059240f52e070a95a6facff10115e672c69971b122df1c739361364741779b30c46f408c')
build() {
    git clone --recurse-submodules -b stable https://activitypub.software/TransFem-org/Sharkey.git
    cd "$pkgname"
    pnpm install --frozen-lockfile
    pnpm run build
}
package() {
    cd "$pkgname"

    install -dm 740 "${pkgdir}/var/lib/sharkey/Sharkey"
    install -Dm 644 "${srcdir}/sharkey.service" "${pkgdir}/usr/lib/systemd/system/sharkey.service"
    install -Dm 644 "${srcdir}/sharkey.sysusers" "${pkgdir}/usr/lib/sysusers.d/sharkey.conf"
    install -Dm 644 "${srcdir}/sharkey.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sharkey.conf"
    install -Dm 640 ".config/example.yml" ".config/default.yml"

    cp -dpTr --no-preserve=ownership "${srcdir}/Sharkey" "${pkgdir}/var/lib/sharkey/Sharkey"

    chown -R sharkey:sharkey "${pkgdir}/var/lib/sharkey/Sharkey"

    rm -rf "${pkgdir}/var/lib/sharkey/Sharkey/.git"
}

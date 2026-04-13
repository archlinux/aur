# Maintainer: notfire <luke@notfire.cc>

pkgname=sharkey
pkgver=2025.4.6
pkgrel=2
pkgdesc='A Sharkish microblogging platform'
url='https://activitypub.software/TransFem-org/Sharkey'
license=('AGPL')
arch=('x86_64' 'aarch64')
depends=(npm pnpm postgresql valkey ffmpeg python pango)
provides=("$pkgname")
backup=('var/lib/sharkey/Sharkey/.config/default.yml')
install=sharkey.install
options=(!strip)
source=('sharkey.sysusers'
        'sharkey.tmpfiles'
        'sharkey.service'
        )
sha512sums=('73bf054122fc6a0372deee3f0613f3432bc59c6a55e30277a9e202de325af1150b8f491877a5792e38d5a61c56a34d6cf88b8396b4989f5ddafc64ad59ecc91c'
            'd1da614d615f13293219a1e91fce03f64ab1286ccb3006bf76b82f0e3a79d47ad47b19ca6430c6d0dc6cce05d20e6a505272c9c0e0074cbb3f99b4b55df89889'
            '6f6f20b017191f452081051a279eda28ad938bf1a46ffa29377fcd4c059240f52e070a95a6facff10115e672c69971b122df1c739361364741779b30c46f408c')
build() {
    git clone --recurse-submodules -b stable https://activitypub.software/TransFem-org/Sharkey.git
    cd "Sharkey"
    pnpm install --frozen-lockfile
    pnpm run build
}
package() {
    cd "Sharkey"

    install -dm 740 "${pkgdir}/var/lib/sharkey/Sharkey"
    install -Dm 644 "${srcdir}/sharkey.service" "${pkgdir}/usr/lib/systemd/system/sharkey.service"
    install -Dm 644 "${srcdir}/sharkey.sysusers" "${pkgdir}/usr/lib/sysusers.d/sharkey.conf"
    install -Dm 644 "${srcdir}/sharkey.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sharkey.conf"
    install -Dm 640 ".config/example.yml" ".config/default.yml"

    cp -dpTr --no-preserve=ownership "${srcdir}/Sharkey" "${pkgdir}/var/lib/sharkey/Sharkey"

    chown -R sharkey:sharkey "${pkgdir}/var/lib/sharkey/Sharkey"

    rm -rf "${pkgdir}/var/lib/sharkey/Sharkey/.git"
}

# Maintainer: Mistle <tehmistle [at] gmx.com>
pkgname=stash
pkgver=0.18.0
pkgrel=2
pkgdesc="Locally hosted web-based app written in Go which organizes and serves your Adult Video"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/stashapp/stash"
license=('AGPL3')
depends=('glibc' 'ffmpeg')
makedepends=('go>=2:1.19' 'golangci-lint' 'yarn')
conflicts=('stash-bin')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
"0001-Fix-build-with-extldflags.patch"
"0002-Add-Arch-specific-build-flags.patch"
"stash.service"
"stash-user.service"
"stash.sysusers"
"stash.tmpfiles"
"stash.env"
)
sha256sums=('SKIP'
            '70225e5691038d623c6cff3ebc8fa9682305670cb6cedb5e539a30b2090bcdef'
            '5ff482cf77c6b053051fad6255ece848db3a60882201eaf29945dbea920bc399'
            'bf30830e85fd7cf0cc2d0f4e1037b20cd407da80c47c4f33048ddd616bbbbc84'
            '41f79ebc8d24cb1ae87ba55923d56e6d5c6bff9fa62433070fdf37ff5a52f7fd'
            'de94761e4a705c6fa7216359d5286c4724c985818b21ed071d3866246fffd870'
            '7aac9c11831133f271c52bc432bd68a3eeb48afa9f0affa0486e57a693abf862'
            '4f6add7bf6d1be8dc5df5f6117b7288a2c9d4ba97fd784bc05c197673353de85')

prepare() {
        cd "$pkgname"
        patch -Np1 -i "${srcdir}/0001-Fix-build-with-extldflags.patch"
        patch -Np1 -i "${srcdir}/0002-Add-Arch-specific-build-flags.patch"
        mkdir -p build
        make pre-ui
        make generate
}

build() {
        cd "$pkgname"
        make ui
        OUTPUT=build/ make build-release
}


package() {
        cd "$pkgname/build"
        install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
        cd "${srcdir}"
        install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        install -Dm644 ${pkgname}-user.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
        install -Dm644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
        install -Dm644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
        install -Dm644 ${pkgname}.env "${pkgdir}/etc/conf.d/${pkgname}"
}


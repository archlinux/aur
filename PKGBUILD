# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
pkgver=0.9.0
pkgrel=3
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard'
arch=(x86_64)
url=https://listmonk.app
license=(AGPL3)
depends=(postgresql)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=(etc/listmonk/config.toml)
install=${pkgname%-bin}.install
source=("https://github.com/knadh/${pkgname%-bin}/releases/download/v$pkgver-beta/${pkgname%-bin}_$pkgver-beta_linux_amd64.tar.gz"
        "${pkgname%-bin}.conf"
        "${pkgname%-bin}.service")
sha256sums=('1137f572fd93b25034865cb638d169acb1bd9b87d6848c274405bc6108dad62c'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '4852f206b7763ba047ba123d663cadb806f437967154ebe837845198b3266533')
_sample_pw=TKByjizucIoex3mA

build() {
    rm -f config.toml
    ./${pkgname%-bin} --new-config
    sed -i -e "/admin_password/s,\".*\",\"$_sample_pw\"," config.toml
}

package() {
    install -Dm755 -t "$pkgdir/usr/bin" ${pkgname%-bin}
    install -Dm600 -t "$pkgdir/etc/${pkgname%-bin}" config.toml
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "${pkgname%-bin}.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "${pkgname%-bin}.conf"
}

pkgname=website-stalker-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('LGPL-2.1-or-later')
depends=('git')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('a4a69cf6385fe8fe65ffc30b0b4651cb342f486a271183885131eecf375d501e')
sha256sums_aarch64=('a0ececf4fe44948d490c86db5a01be0b9aec983c6bd1627217d69bdeded53596')
sha256sums_armv6h=('128254bffc11982ac25dcc7b783f4b1c34a5df6b4bed735f0e8d9395d1df118f')
sha256sums_armv7h=('bd38a3bc156bdb4a2df2b675f46b4a51f582261f1e1d53fe367c4f21a250df29')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-bin/}/LICENSE"
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  install -Dm644 "completions/${pkgname/-bin/}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname/-bin/}.bash"
  install -Dm644 "completions/${pkgname/-bin/}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname/-bin/}.fish"
  install -Dm644 "completions/_${pkgname/-bin/}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname/-bin/}"

  # migrate all /usr/local/lib thingies to /usr/lib
  sed -i "s/\/local\//\//g" systemd/*

  install -Dm644 "systemd/systemd.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "systemd/systemd.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
  install -Dm644 "systemd/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "systemd/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

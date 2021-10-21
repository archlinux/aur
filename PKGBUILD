pkgname=website-stalker-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('LGPL2.1')
depends=('gcc-libs' 'zlib')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('cb19586a2788dbb1bd8509a47901ec7170a9f094bdf4bd33e6ade076d5f3517c')
sha256sums_aarch64=('59090e5f556d0b74e9bef3f76452a1d27a66a283b4a4573e5a4b80e6464a190a')
sha256sums_armv6h=('485f1610373fb1a02dddb9d92504ec46615e3cb7c1c25cbff6ce3a47f5ebc97f')
sha256sums_armv7h=('5fa9ba1a5d59c504e0c509f62683458d91a4426d61e7e7aaa38d94f245f6566b')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-bin/}/LICENSE"
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  install -Dm644 "completions/${pkgname/-bin/}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname/-bin/}.bash"
  install -Dm644 "completions/${pkgname/-bin/}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname/-bin/}.fish"
  install -Dm644 "completions/_${pkgname/-bin/}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname/-bin/}"

  # migrate all /usr/local/lib thingies to /usr/lib
  sed -i "s#/local/#/#g" systemd/**/*
  # Set the executable path
  sed -i "s#^ExecStart=.*${pkgname/-bin/}#ExecStart=/usr/bin/${pkgname/-bin/}#g" systemd/**/*.service

  install -Dm644 "systemd/system/systemd.service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.service"
  install -Dm644 "systemd/system/systemd.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.timer"
  install -Dm644 "systemd/system/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname/-bin/}.conf"
  install -Dm644 "systemd/system/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname/-bin/}.conf"

  install -Dm644 "systemd/user/systemd.service" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.service"
  install -Dm644 "systemd/user/systemd.timer" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.timer"
}

check() {
  eval "./website-stalker --help"
}

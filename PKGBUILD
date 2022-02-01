pkgname=website-stalker-bin
pkgver=0.18.0
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

sha256sums_x86_64=('218c6bf468e9ee95afd0d82f299acb0bd066730b513ece1e788103055f2185b1')
sha256sums_aarch64=('f6f7b11b49a7afde9eccb66db590e286ff01553d597dd241e28dd0825a93aea3')
sha256sums_armv6h=('37c3bbd48b7debfb706ede6359018bd527744a890ea8110a4bc4204bc15e229c')
sha256sums_armv7h=('c7289ccbdb50e9a72e592d1cea555bd376a1d41c30bd63223f7bfa0b2765f282')

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

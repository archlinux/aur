pkgname=website-stalker-bin
pkgver=0.13.0
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

sha256sums_x86_64=('add99110ed158353cb50c4d9208b525f4b45ba7555f5035ad44c78b818913288')
sha256sums_aarch64=('6fa3b8c01ddec877b9d13c8fc58b4296bae413635cfb902049178e0630271444')
sha256sums_armv6h=('816e4940707e920178b0416367f3d12b97c824a3a5fa8847d24d4b85e5b0f134')
sha256sums_armv7h=('f45bbe37f939407d48e8e37193fd898b63844c91495c8a3482a4da31dbc8365c')

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

pkgname=website-stalker-bin
pkgver=0.8.0
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

sha256sums_x86_64=('991ab8da297e5f30058e670b89b5d397eefb68bbf7a0f68e39e10424b0da13ba')
sha256sums_aarch64=('7eae1e11c98aeada7c8f5c3e369bd06f4b697ca035274ef50b40ed87a44ae0db')
sha256sums_armv6h=('0e0df0c7879139f9f94486b8f237527fff2883a2c8360d8984728d91d4952c5e')
sha256sums_armv7h=('700877ecad424472975c6531228ee5ef067627df7fd49dc34bfe2284fe4e2ae9')

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

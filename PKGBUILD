# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=browser-open-in
_app_name=com.add0n.node
pkgver=0.9.5
pkgrel=1
pkgdesc='Native components needed by open-in browser extensions'
arch=(any)
url='https://add0n.com/open-in.html'
license=(MPL-2.0)
depends=(nodejs)
source=(https://github.com/andy-portmen/native-client/releases/download/$pkgver/linux.zip
        'install_module.patch')
b2sums=('8d238ab47bef51ef1d7b2ca56bafa66b670ff4f9d46dcd5c8a4a361d5f8adcf909be0c75980692a59831a289ee9437c0dd022d5f09f7784015c27ec9101f4244'
        '2cd3a68a2f886cafe1349a086e47ff0753632bf26513e7c01a12ce8b7ce56c16714bf898e388d19fadeac3735631fbdc1af798e92474645778fc175f60a80416')

prepare() {
    # Patch the provided install script into a module we can use in the PKGBUILD
    patch --forward --strip=1 --input=install_module.patch
}

package() {
    # Use the install module via a inline script
    cd app
    node -e "'use strict';
const install = require('./install.js')

const app_dir = \`/usr/lib/$pkgname/\${install.name}\`

install.manifest('$pkgdir/etc/chromium/native-messaging-hosts', 'chrome', app_dir)
install.manifest('$pkgdir/etc/opt/chrome/native-messaging-hosts', 'chrome', app_dir)
install.manifest('$pkgdir/etc/opt/edge/native-messaging-hosts', 'chrome', app_dir)
install.manifest('$pkgdir/usr/lib/mozilla/native-messaging-hosts', 'firefox', app_dir)

install.application('$pkgdir' + app_dir, '/usr/bin/node')
"
}

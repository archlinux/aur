# Maintainer: Alice Gaudon <alice at gaudon dot pro>

pkgname='serverplate'
pkgver=0.1.5
pkgrel=1
pkgdesc='A simple aesthetic web front for your server.'
arch=('x86_64')
url='https://github.com/ArisuOngaku/serverplate'
license=('GPL3')
source=("serverplate-src::git://github.com/ArisuOngaku/serverplate.git#tag=v$pkgver"
  'serverplate.service'
  'serverplate.sysusers'
  'local.ts')
sha512sums=('SKIP'
            '0ff16d5ea6a2b2638c12c0e85d06f1b6de4c08b32249fae1cc94c5d0589ac6aa02eaf9ccfb63bd645abac932a94f6bcc15efdd7030b44d2119b320bbf9dce8ee'
            '391fc8cf4ae59d51a2681869892516c5f1ecfbbf92eb12d7a562f874e9bcac9cd31b802063e712823b987b19f0c3895b7e11493a76972a5ea38f918f316d8585'
            '068c495a483c799890f73f1afe95b41890bd6ece4f3346b3873c1bea7811e7cdafa72e0b4d0c97c43a89c30cb357f83435b2a9c2e99fb19a8f2cc11719446630')
provides=('serverplate')
conflicts=('serverplate')
depends=('figlet' 'lolcat')
optdepends=('bind-tools: dig command for reverse DNS lookup')
makedepends=('yarn' 'npm')
options=("!strip")

prepare() {
  cd "$srcdir/serverplate-src" || exit 1
  yarn install
}

build() {
  cd "$srcdir/serverplate-src" || exit 1
  yarn dist && yarn pkg
}

package() {
  install -Dm644 "$srcdir/serverplate-src/LICENSE" "$pkgdir/usr/share/licenses/serverplate/LICENSE"

  install -Dm755 "$srcdir/serverplate-src/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 "${srcdir}/serverplate.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/local.ts" "${pkgdir}/etc/serverplate/local.ts"
  install -Dm 644 "${srcdir}/serverplate.sysusers" "${pkgdir}/usr/lib/sysusers.d/serverplate.conf"
}

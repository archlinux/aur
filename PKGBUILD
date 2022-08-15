# Maintainer: Douglas Chimento <dchimento@gmail.com>
_npmname=balanceofsatoshis
_npmver=12.24.0
pkgname="balance-of-satoshis"
pkgver=${_npmver}
pkgrel=1
pkgdesc="Commands for working with LND balances."
arch=(any)
url="https://github.com/alexbosworth/balanceofsatoshis"
license=("MIT")
depends=("nodejs>=10")
makedepends=("npm")
optdepends=('lnd-bin')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=(ec02ef7847ef6812cf37f97e6fbd8d784f5ba4fa5c1c46a8ed34e6fbe83495fb)
options=('!strip')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/$_npmname-$_npmver.tgz"
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
  install -d -m755 "$pkgdir/usr/share/bash-completion/completions"
  install -d -m755 "$pkgdir/usr/share/zsh/site-functions"
  $pkgdir/usr/bin/bos completion bash > "$pkgdir/usr/share/bash-completion/completions/bos" 
  $pkgdir/usr/bin/bos completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_bos"
}

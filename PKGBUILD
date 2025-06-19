# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Douglas Chimento <dchimento@gmail.com>

_npmname=balanceofsatoshis
_npmver=19.4.15
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
sha256sums=('6125c66101a1e1c8873d02d05c8f0795759493e3bb2f5306daa880f434afa31f')
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

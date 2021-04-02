# Maintainer: Douglas Chimento <dchimento@gmail.com>
_npmname=btc-rpc-explorer
_npmver=2.2.0
pkgname=${_npmname}
pkgver=${_npmver}
pkgrel=1
pkgdesc="Simple, database-free Bitcoin blockchain explorer, via RPC to Bitcoin Core"
arch=(any)
url="https://github.com/janoside/btc-rpc-explorer"
license=("MIT")
depends=("nodejs>=10")
makedepends=("npm")
optdepends=()
backup=("etc/default/${pkgname}")
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz" ${pkgname}.service ${pkgname}.default )
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('f2eabe5e21d9ab7ccef4c0b1a2894ef6c3bc0911a5f704320aff02809a9db7ab'
            'f19d942b6b6789c7deeb076e70eaf140e65a18d9cfe9ceab30cf2c33120e25f3'
	    '98a6cdcf741807d2cc98825b074a882e520563b7b6528c24d2abd090bc007d0a')

package() {
  chown -R root:root "${pkgdir}"
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/$_npmname-$_npmver.tgz"

  install -Dm640 ${pkgname}.default "${pkgdir}/etc/default/${pkgname}"
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  echo "u ${pkgname} - - /var/lib/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
  echo "d /var/lib/${pkgname} 0750 ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

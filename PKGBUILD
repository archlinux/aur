# Maintainer: Douglas Chimento <dchimento@gmail.com>
_npmname=btc-rpc-explorer
_npmver=3.1.0
pkgname=${_npmname}
pkgver=${_npmver}
pkgrel=2
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
sha256sums=('639f655f3f2e8dd230faa8807d4903c6f7d6c0425d1d9dbe8ae0559977dd95ea'
            'f19d942b6b6789c7deeb076e70eaf140e65a18d9cfe9ceab30cf2c33120e25f3'
	    '98a6cdcf741807d2cc98825b074a882e520563b7b6528c24d2abd090bc007d0a')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/$_npmname-$_npmver.tgz"
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
  
  install -Dm640 ${pkgname}.default "${pkgdir}/etc/default/${pkgname}"
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  echo "u ${pkgname} - - /var/lib/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
  echo "d /var/lib/${pkgname} 0750 ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

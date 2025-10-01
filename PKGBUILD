# Maintainer: dougefresh <dchimento@gmail.com>
pkgname=btc-rpc-explorer
pkgver=3.5.1
pkgrel=1
pkgdesc="Simple, database-free Bitcoin blockchain explorer, via RPC to Bitcoin Core"
arch=(any)
url="https://github.com/janoside/btc-rpc-explorer"
license=("MIT")
depends=("nodejs>=10")
makedepends=("npm")
optdepends=()
backup=("etc/default/${pkgname}")
source=("https://github.com/janoside/btc-rpc-explorer/archive/refs/tags/v${pkgver}.tar.gz" ${pkgname}.service ${pkgname}.default )
noextract=("v${pkgver}.tar.gz")
sha256sums=('731aa12573d541f00a27117784c86307c4c3833d27d2cf33565f71a34b3aa38f'
            'f19d942b6b6789c7deeb076e70eaf140e65a18d9cfe9ceab30cf2c33120e25f3'
	    '98a6cdcf741807d2cc98825b074a882e520563b7b6528c24d2abd090bc007d0a')
options=('!strip')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" ${srcdir}/*.tar.gz
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

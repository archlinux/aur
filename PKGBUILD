# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
_npmname=meshcentral
_npmver=0.6.28
pkgname=meshcentral
pkgver=0.6.28
pkgrel=1
pkgdesc="Web based remote computer management and file server"
arch=(any)
url="http://meshcommander.com"
license=(Apache)
depends=('nodejs')
makedepends=('npm')
backup=('etc/meshcentral/config.json' 'var/lib/meshcentral')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
        "$_npmname.service"
        "$_npmname.sysusers"
        "$_npmname.tmpfiles")
noextract=($_npmname-$_npmver.tgz)
sha1sums=(a38335776d2c96959fbc952c946e11c762bf78bb SKIP SKIP SKIP)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove references to package and source directories
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # Our additional files
  install -D "${srcdir}/$_npmname.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -D "${srcdir}/$_npmname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_npmname.conf"
  install -D "${srcdir}/$_npmname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$_npmname.conf"

  # Default configuration
  install -D "${pkgdir}/usr/lib/node_modules/$_npmname/sample-config-advanced.json" "${pkgdir}/etc/$_npmname/config.json"

  # Data directories
  install -d ${pkgdir}/var/lib/${_npmname}/data
  install -d ${pkgdir}/var/lib/${_npmname}/files
}

# vim:set ts=2 sw=2 et:

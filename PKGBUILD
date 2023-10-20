# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=hedgedoc2
_reponame=hedgedoc
_pkgver=2.0.0-alpha.1
pkgver=2.0.0_alpha.1
pkgrel=1
pkgdesc="Platform to write and share markdown (Version 2)"
arch=(x86_64)
url='https://github.com/hedgedoc/hedgedoc'
license=('AGPL3')
depends=('nodejs')
backup=("etc/${pkgname}/settings.env")
makedepends=('sqlite' 'python' 'node-gyp' 'git' 'yarn' 'npm')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'sqlite: sqlite database support')
# backup=("etc/webapps/${pkgname}"/config.json)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hedgedoc/hedgedoc/archive/v${_pkgver}.tar.gz"
        "sysusers.conf"
        "tmpfiles.conf"
        "settings.env"
        "Caddyfile"
        "$pkgname.service"
        "$pkgname-backend.service"
        "$pkgname-frontend.service")
options=(!emptydirs)
sha256sums=('a2dfd2dd248d189a6ace23da5a3c4686fe8c2bd31a206e531f4b4d509905ed56'
            '113dd8cf558ced474a4aefa03418429526d2789c40acf6102785874d1e50e585'
            '331757b7a93259176332cd40226ac9fbd240d517daca812ddf84312709a9e845'
            'a688ee2b50d5b31599c08288a302d7239906ac07352892ad34c839ec20c16fba'
            'd614569984eeb0ecc1dc0dbc4f713694569cec718062f2e2ba469f8bba54954b'
            '3b70b1a1ff13b9ef028819aa56d3f176f9b3cf31820f5bcf988d0f2aaa145cca'
            'd718be6c560db0daf6e866081d9b1dcd34bec0802aadf3af16f87afa9626b163'
            '486ae9f3e0a2603474f21cb4fee8f076c5514cb55c6690d729cc1c59df021a2a')

build() {
  cd "${_reponame}-${_pkgver}"

  # yarn workspaces focus --all --production
  yarn workspaces focus --all
  yarn build --no-cache --no-daemon
}

package() {
  cd "${_reponame}-${_pkgver}"

  install -m0755 -d "${pkgdir}/usr/share/webapps/${pkgname}/backend" \
                    "${pkgdir}/usr/share/webapps/${pkgname}/backend"/dist \
                    "${pkgdir}/usr/share/webapps/${pkgname}/frontend"/dist \
                    "${pkgdir}/usr/share/webapps/${pkgname}/commons"

  # install backend
  install -m0644 package.json -t "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -a node_modules "${pkgdir}/usr/share/webapps/${pkgname}/"

  install -m0644 backend/package.json -t "${pkgdir}/usr/share/webapps/${pkgname}/backend"
  cp -a backend/dist/src/* "${pkgdir}/usr/share/webapps/${pkgname}/backend/dist/"
  cp -a backend/public "${pkgdir}/usr/share/webapps/${pkgname}/backend/"

  # install frontend
  cp -a frontend/dist/ "${pkgdir}/usr/share/webapps/${pkgname}/frontend/"

  # install commons
  install -m0644 commons/package.json -t "${pkgdir}/usr/share/webapps/${pkgname}/commons"
  cp -a commons/dist "${pkgdir}/usr/share/webapps/${pkgname}/commons/"

  # Configure system users and some directories writable for that user.
  install -Dm0644 ${srcdir}/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 ${srcdir}/tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # Install systemd service file.
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}"/$pkgname{,-backend,-frontend}.service

  install -Dm0644 "${srcdir}/settings.env" "${pkgdir}/etc/${pkgname}/settings.env"
  # FIXME(gromit): use upstream caddyfile
  install -m0644 "${srcdir}/Caddyfile" -t "${pkgdir}/usr/share/webapps/${pkgname}/"
}

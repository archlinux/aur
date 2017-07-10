# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>
# Maintainer: guillaume alaux <guillaume at alaux dot net>
# Contributor: xeross <contact at xeross dot me>
# Contributor: codekoala <codekoala at gmail dot com>

pkgname=etcd
pkgver=3.1.8
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://github.com/coreos/etcd'
license=('Apache')
makedepends=('go')
backup=('etc/conf.d/etcd')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/v${pkgver}.tar.gz"
         '10-EnvironmentFile.conf'
         'etcd.env')
sha256sums=('f68700f710dfd9c5fefb41a60e96f9d0c7907e6abe21518ab0a05f6e425a3d4e'
            '5c65989c7c9309e07ad1f7d886d9869e6fa326f5c6c85dea3e59da5f34e17d05'
            '14843a1bba6ca70fc60f3a5694ca47d533dae9401c5134aca85bfdbdea4098d8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export GOPATH="$(pwd)/_gopath"
  _coreos="${GOPATH}/src/github.com/coreos"
  mkdir -vp ${_coreos}
  ln -vsf ${srcdir}/${pkgname}-${pkgver} ${_coreos}/${pkgname}
  # Note: this script may produce no output
  bash -x ./build
}

package() {
  # binaries
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/etcd ${pkgdir}/usr/bin/etcd
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/etcdctl ${pkgdir}/usr/bin/etcdctl
  # Upstream systemd unit
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/etcd.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  # Adding 'EnvironmentFile=-/etc/conf.d/etcd' option to the unit
  install -Dm644 ${srcdir}/10-EnvironmentFile.conf ${pkgdir}/usr/lib/systemd/system/${pkgname}.service.d/10-EnvironmentFile.conf
  # env file itself
  install -Dm644 ${srcdir}/etcd.env ${pkgdir}/etc/conf.d/${pkgname}
  # License
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  # Docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${srcdir}/${pkgname}-${pkgver}/Documentation/* ${pkgdir}/usr/share/doc/${pkgname}/
  install -m644 ${srcdir}/${pkgname}-${pkgver}/${pkgname}.conf.yml.sample ${pkgdir}/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:

# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: guillaume alaux <guillaume at alaux dot net>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>
# Contributor: xeross <contact at xeross dot me>
# Contributor: codekoala <codekoala at gmail dot com>

pkgname=etcd
pkgver=3.5.10
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('x86_64' 'armv6h' 'armv7h')
url='https://github.com/etcd-io/etcd'
license=('Apache')
makedepends=('go' 'git')
backup=('etc/conf.d/etcd')
install="${pkgname}".install
options=(!lto)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/etcd-io/"${pkgname}"/archive/v"${pkgver}".tar.gz
         10-EnvironmentFile.conf
         etcd.env)
b2sums=('d6b6c60dee15ffc42e3510837eefc543d16bdbda532828cd6a846f9d12921e24df948b93b4951f8e660be9967e540f59ecba558094558f67ec5aa4059dee60de'
        '754d5e84506b9aff7629b9b08743e609d8e9db5926d5dd1ef22366a2eeffd4b9e56903284c3b6081bc2a3035e75922a009174aa612517d93e0f6a48fd6345729'
        '71f207c4ef1643dc70eecea6bdba4dcd7226626813d2a9f3330059f1b9f78ea2d3607b8b15b67b1afec0d201b01c10f6db3267695118732621a05f967a56a65a')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GO_BUILD_FLAGS="-trimpath -buildmode=pie -mod=readonly -modcacherw"
  export GO_LDFLAGS="-linkmode=external -extldflags=${LDFLAGS}"

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  ./build.sh
}

package() {
  # binaries
  install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/bin/etcd "${pkgdir}"/usr/bin/etcd
  install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/bin/etcdctl "${pkgdir}"/usr/bin/etcdctl

  # Upstream systemd unit
  install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/contrib/systemd/etcd.service "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service

  # Adding 'EnvironmentFile=-/etc/conf.d/etcd' option to the unit
  install -Dm644 "${srcdir}"/10-EnvironmentFile.conf "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service.d/10-EnvironmentFile.conf

  # env file itself
  install -Dm644 "${srcdir}"/etcd.env "${pkgdir}"/etc/conf.d/"${pkgname}"

  # License
  install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Docs
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
  cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/Documentation/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
  install -m644 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${pkgname}".conf.yml.sample "${pkgdir}"/usr/share/doc/"${pkgname}"
}

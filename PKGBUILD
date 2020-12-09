pkgname=mysterium-node
pkgver=0.39.3
pkgrel=1

pkgdesc='Mysterium Node for decentralised VPN Network'
url='https://mysterium.network/'
arch=(x86_64 aarch64 armv7h)
license=(GPL-3)

depends=( "openvpn>=2.4.0" resolvconf ca-certificates iptables iproute2 sudo wireguard-tools)
makedepends=('go')
_dirname=node-${pkgver}


source=("https://github.com/mysteriumnetwork/node/archive/${pkgver}.tar.gz"
"initd.sh"
"myst.service"
"sudoers"
"LICENSE"
"default"
"${pkgname}.install"
)
install="${pkgname}.install"
build() {
  cd ${_dirname}
  #export GOOS=linux
  #export GOARCH=arm64
  export BUILD_COMMIT=d241e5483c275cd28228e50655823b20405c115e
  export BUILD_BRANCH=master
  export BUILD_NUMBER=1
  export BUILD_VERSION=${pkgver}
  make build
}

package() {
  mkdir -p $pkgdir/var/run/mysterium-node

  install -Dm 755 $srcdir/${_dirname}/build/myst/myst "$pkgdir/usr/bin/myst"
  install -Dm 755 initd.sh "$pkgdir/usr/lib/mysterium-node/installation/initd.sh" #/etc/init.d/initd.sh
  
  # SYSTEMD
  install -Dm 644 myst.service "$pkgdir/usr/lib/systemd/system/mysterium-node.service"
  
  # ETC
  install -Dm 755 $srcdir/${_dirname}/build/myst/config/nonpriv-ip "$pkgdir/etc/mysterium-node/nonpriv-ip"
  install -Dm 755 $srcdir/${_dirname}/build/myst/config/prepare-env.sh "$pkgdir/etc/mysterium-node/prepare-env.sh"
  install -Dm 755 $srcdir/${_dirname}/build/myst/config/update-resolv-conf "$pkgdir/etc/mysterium-node/update-resolv-conf"
  install -Dm 644 sudoers "$pkgdir/etc/sudoers.d/mysterium-node"
  install -Dm 644 default "$pkgdir/etc/default/mysterium-node"
  
  #LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MYSTERIUM" LICENSE
}

md5sums=('6270748f1fbb5406139ef8a2333af71b'
         '98c921e848f46630097311d88ebd4c80'
         'b8f7e06c5fcccacb45be75b028f6bb5c'
         '720de49cf62f9e1b182da83c22db1034'
         '2541dec04c7fd8c9f0d55c81f5abef07'
         '90d849e9a576d28aaeb84ae10d53273b'
         'ef2fbcfa9beaba00013e4c03704a3bb2')
sha512sums=('7a55906327130646cbb0ede3b4a812b3d996336d2461c30c0065dcfea73b4b785d9cc58240b10a78355fa8d36a13a4d2c4b0b3f3e338f802ad1d8cf5cea0ad7d'
            '2d833621aa158fc7c0d08a863f83e94199c3f0ce6d687605a1c9463941126e78d792c82a2b2da0dadf2735a6f4e97c6140a4ac5c0dc7b31641011dd26a580a59'
            'f922077dfee324fd7081dc2445de3add7e6ebcfb2021b38a57a326e7c3885715d242cc522bb05391b78566dbc8b7c00ebb8719868ec84556a72ed420e3656c3e'
            '10d7634be184eda83f10d8fc4a0800716c92c48132f57ba8758c87ea5cc3d0d2586e0be8961c231aa1d8450b65fca1ac1691a4fe0af936208181527354ecc158'
            'ed4a2ae2e92f50931e40d6ae44f0d9d0019e9ad6acc9262d7b3ee3eb2cff4df8f7ec96b1737480a5826072612eb9cb70c203e56a5194af6ea03a6922df6795e6'
            'e879e1952950acc9b3389bec073dc4b478483648edeacadccccd992d50af995c8b55d1d8e39e0af2b6cede6ff322a70675132185f2b2f7eeb55e8fe6f4e41bd5'
            'd4982c848061a662a4cad6689475e5402e4e3e3eda20cb8b4e6e95ee5a4b4c24c41d2f64a0a707ab3042cfa88a30a8ec15c64140efff04a4a8ee551a37ae7fea')
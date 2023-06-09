#Maintainer: SecondaryArcs 25348fac440da98721ce3eb39e7b6220ea3b6d4d http418teapot@protonmail.com

pkgname=mysterium-node
pkgver=1.22.1
pkgrel=1

pkgdesc='Mysterium Node for decentralised VPN Network'
url='https://mysterium.network/'
arch=(x86_64 aarch64 armv7h )
license=(GPL-3)

depends=(resolvconf ca-certificates iptables iproute2 sudo wireguard-tools)
makedepends=('go')
_dirname=node-${pkgver}


source=("https://github.com/mysteriumnetwork/node/archive/${pkgver}.tar.gz"
"initd.sh"
"myst.service"
"mystconsumer.service"
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
  export BUILD_COMMIT=905a6e20a3db1d7f0cc83f60f56bb0602e23a32e
  export BUILD_BRANCH=master
  export BUILD_NUMBER=1
  export BUILD_VERSION=${pkgver}
  make build
}

package() {
  mkdir -p $pkgdir/run/mysterium-node
  mkdir -p $pkgdir/var/log/mysterium-node

  install -Dm 755 $srcdir/${_dirname}/build/myst/myst "$pkgdir/usr/bin/myst"
  install -Dm 755 initd.sh "$pkgdir/usr/lib/mysterium-node/installation/initd.sh" #/etc/init.d/initd.sh
  
  # SYSTEMD
  install -Dm 644 myst.service "$pkgdir/usr/lib/systemd/system/mysterium-node.service"
 
	install -Dm 644 mystconsumer.service "$pkgdir/usr/lib/systemd/system/mysterium-consumer.service"

  # ETC
  install -Dm 755 $srcdir/${_dirname}/build/myst/config/nonpriv-ip "$pkgdir/etc/mysterium-node/nonpriv-ip"
  install -Dm 755 $srcdir/${_dirname}/build/myst/config/prepare-env.sh "$pkgdir/etc/mysterium-node/prepare-env.sh"
  install -Dm 755 $srcdir/${_dirname}/build/myst/config/update-resolv-conf "$pkgdir/etc/mysterium-node/update-resolv-conf"
  install -Dm 644 sudoers "$pkgdir/etc/sudoers.d/mysterium-node"
  install -Dm 644 default "$pkgdir/etc/default/mysterium-node"
  
  #LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MYSTERIUM" LICENSE
}

md5sums=('8aaf8896e424a8316b99a329fb01c284'
         '98c921e848f46630097311d88ebd4c80'
         'd7a3c7c37902b9eff954a6b08eba1314'
				 'b95b54717678f5e3224aba7981d2caaa'
         '720de49cf62f9e1b182da83c22db1034'
         '2541dec04c7fd8c9f0d55c81f5abef07'
         '90d849e9a576d28aaeb84ae10d53273b'
         'ef2fbcfa9beaba00013e4c03704a3bb2')
sha512sums=('8dd4d181a00c50d087ea13b66b49d00c998a1475bb3bc937e97a7abf29cbb744a05a6e17e531a3b9da160165b6483b69acf97786b5c43bb204bd04f743aa0632'
            '2d833621aa158fc7c0d08a863f83e94199c3f0ce6d687605a1c9463941126e78d792c82a2b2da0dadf2735a6f4e97c6140a4ac5c0dc7b31641011dd26a580a59'
            'eb66ff9dfbbbe7fa9b83e64486d2b7078625160ecf96fc1c2bf309e06b0516d41fe909fa25ab6d7728a955a7e9390e7a806a0e9613594489c609fbc3423f5f6a'
						'7a9cc3b7b1c89bba8a4ec290de93d1111edb176ed9e331315b3342a5a8f583c23380df1ba535ee3f961f4c542dc6eca39c5cd18a2b3a372270c2340ebe4792a2'
            '10d7634be184eda83f10d8fc4a0800716c92c48132f57ba8758c87ea5cc3d0d2586e0be8961c231aa1d8450b65fca1ac1691a4fe0af936208181527354ecc158'
            'ed4a2ae2e92f50931e40d6ae44f0d9d0019e9ad6acc9262d7b3ee3eb2cff4df8f7ec96b1737480a5826072612eb9cb70c203e56a5194af6ea03a6922df6795e6'
            'e879e1952950acc9b3389bec073dc4b478483648edeacadccccd992d50af995c8b55d1d8e39e0af2b6cede6ff322a70675132185f2b2f7eeb55e8fe6f4e41bd5'
            'd4982c848061a662a4cad6689475e5402e4e3e3eda20cb8b4e6e95ee5a4b4c24c41d2f64a0a707ab3042cfa88a30a8ec15c64140efff04a4a8ee551a37ae7fea')

# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-mainnet-node-bin
pkgver=3.0.1
pkgrel=1
pkgdesc='Concordium Mainnet Node'
arch=('x86_64')
url='http://developer.concordium.software/en/mainnet/net/index.html'
license=('AGPL3')
depends=('postgresql-libs' 'openssl' 'unbound')
source=(
    "https://distribution.mainnet.concordium.software/deb/concordium-mainnet-node_${pkgver}_amd64.deb"
    'concordium-mainnet-node.default'
    'concordium-mainnet-node-collector.default'
)
sha512sums=(
    'b030f556e7401ea50e0a80561d9c34f0644da1c7389f86a35bf336868a4203cb9f4f0e301b5f3c60a820a9ebf0be82a24424fbb8e9ac8a13b5478189e31da01a'
    'b1d37f98eb7647de17b068ae58b217850d9382680534adad9921de111f6d8078b9121924fc539791d50eb4198280e3b3b71318ba7aa4fee7b79d556326ac7661'
    '1d89a0c782f0f5e2ce8543e20bc32cd0382cdc7e5fb2be7bddf47393810073c7fc00553c1abcc9103f0851065c355920bba8c59ea7a5080dde68ca4c79fce0b3'
)
options=(!strip)
install='concordium-mainnet-node.install'
backup=(
    'etc/default/concordium-mainnet-node'
    'etc/default/concordium-mainnet-node-collector'
)

prepare() {
    tar -xf data.tar.xz
    rm -rf usr/share
    mv lib usr

    sed -i '/^ExecStart/i EnvironmentFile=\/etc\/default\/concordium-mainnet-node' \
        usr/lib/systemd/system/concordium-mainnet-node.service
    sed -i '/^ExecStart/i EnvironmentFile=\/etc\/default\/concordium-mainnet-node-collector' \
        usr/lib/systemd/system/concordium-mainnet-node-collector.service
}

package() {
    cp -r usr var "$pkgdir/"
    install -Dm644 concordium-mainnet-node.default "$pkgdir/etc/default/concordium-mainnet-node"
    install -Dm644 concordium-mainnet-node-collector.default "$pkgdir/etc/default/concordium-mainnet-node-collector"
}

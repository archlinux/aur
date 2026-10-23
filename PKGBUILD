# Maintainer: Christoph Hamm <christoph.hamm@elektrobit.com>

pkgbase=ankaios-bin
pkgname=(ankaios-server-bin ankaios-agent-bin ankaios-cli-bin ankaios-bin)
groups=(ankaios-bin)
pkgver=1.1.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://eclipse-ankaios.github.io/ankaios"
license=('Apache-2.0')
depends=('libgcc' 'glibc')
source=("$pkgbase-${pkgver}_configs.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/ankaios_configs.tar.gz"
        "$pkgbase-${pkgver}_man-pages.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/man-pages.tar.gz"
	'ankaios.sysusers')
source_x86_64=("$pkgbase-$pkgver-x86_64.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/ankaios-linux-amd64.tar.gz")
source_aarch64=("$pkgbase-$pkgver-aarch64.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/ankaios-linux-arm64.tar.gz")
b2sums=('03a7429138045dc7cfe814357bed41346bf70784cd812453a004305a7c7a34216179d1afa8d661756576d8d633c14fb13f68acdb020c8f162f5f3b1b66505f50'
        '483f0209232f3bb812b7ca7fd00ab86560937f218368ab5f94392c656c794b6b8401f7d4332f1af99a37d09d3bbdb8cfb7f3720681fc9983fe4ba050324dd344'
        'f8f40d8b3c5e67941d3cd8294ef388eca34ee10e4dd0711f0f842d8e881b856478bf08d9a057f659f190bd81ecd4791ec9873723e946bec0723f897bce6f2436')
b2sums_x86_64=('0cdc317a642463388196a32acab0585048551b0ee53962bdcac7e0c9be36c11e127c2f21bca6caf4ca2e0bafde11da6ec2a48df480720e18b2a26b783c7b0959')
b2sums_aarch64=('051dc12b6c9ef8bcf38c91e356e92e8b9fb0dceef117e4e6bf45685eb1e45b978b59a8407aad31ef6d9d5a64e8b40462ca93194f4675ecbc64d97e67310c1078')

prepare() {
    # The released config archive ships the unit files with ExecStart=/usr/local/bin/...; adapt to the AUR package layout
    sed -i 's#/usr/local/bin#/usr/bin#' ank-server.service ank-agent.service
}

package_ankaios-server-bin() {
    pkgdesc="The server application of Eclipse Ankaios"
    provides=(ankaios-server)
    conflicts=(ankaios-server)
    backup=("etc/ankaios/ank-server.conf"
            "etc/ankaios/state.yaml")

    install -Dm755 -t "$pkgdir"/usr/bin/ "ank-server"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ank-server.service
    install -Dm644 ankaios.sysusers "$pkgdir"/usr/lib/sysusers.d/ankaios.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ ank-server.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ state.yaml
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 man8/ank-server.8
}

package_ankaios-agent-bin() {
    pkgdesc="An agent running on each node of an Eclipse Ankaios cluster"
    provides=(ankaios-agent)
    conflicts=(ankaios-agent)
    backup=("etc/ankaios/ank-agent.conf")
    optdepends=(
      'podman: for running podman workloads'
      'nerdctl: for running containerd workloads'
    )

    install -Dm755 -t "$pkgdir"/usr/bin/ ank-agent
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ank-agent.service
    install -Dm644 -t "$pkgdir"/etc/ankaios/ ank-agent.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 man8/ank-agent.8
}

package_ankaios-cli-bin() {
    pkgdesc="A command line tool for communicating with the API of the Eclipse Ankaios server"
    provides=(ankaios-cli)
    conflicts=(ankaios-cli)
    install=ankaios-cli.install
    backup=("etc/ankaios/ank.conf")

    install -Dm755 -t "$pkgdir"/usr/bin/ ank
    install -Dm644 -t "$pkgdir"/etc/ankaios ank.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man1 man1/*
}

package_ankaios-bin() {
    pkgdesc="Meta-package to install all components of Eclipse Ankaios"
    depends=('ankaios-server-bin' 'ankaios-agent-bin' 'ankaios-cli-bin')
}

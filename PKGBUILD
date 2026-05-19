# Maintainer: Christoph Hamm <christoph.hamm@elektrobit.com>

pkgbase=ankaios-bin
pkgname=(ankaios-server-bin ankaios-agent-bin ankaios-cli-bin ankaios-bin)
groups=(ankaios-bin)
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://eclipse-ankaios.github.io/ankaios"
license=('Apache-2.0')
depends=('libgcc' 'glibc')
source=("$pkgbase-${pkgver}_configs.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/ankaios_configs.tar.gz"
        "$pkgbase-${pkgver}_man-pages.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/man-pages.tar.gz"
	'ank-server.service'
	'ank-agent.service')
source_x86_64=("$pkgbase-$pkgver-x86_64.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/ankaios-linux-amd64.tar.gz")
source_aarch64=("$pkgbase-$pkgver-aarch64.tar.gz::https://github.com/eclipse-ankaios/ankaios/releases/download/v$pkgver/ankaios-linux-arm64.tar.gz")
b2sums=('834c6c20c9c708ac99bad42baa0fad57e15baf45e8da24747afcc9f008728e2656d2d5ad11bc4923c4d2a87cb760517bf3397ddf0cf74ab5d68013d55115cb44'
        '5a4b55f1fc4ba480f78df7ed37c7966f3aeec08e974eb214b2376561e8af34fdf684534552180cc1bbb84454f11a2b43bb3db38725b4dae2c12828258f918573'
        '4a49445b8da1e14764696afd16995a92abe00fecd2d32162beeb96e8ba454edafa4312c725a125a41b58367cb7dfafc9cfb81d71bc9b6bbb17495441a670972e'
        'b0ff4b3ec44d77bc088eb92250c0d240645b2bc8e4bbc918b7e1be53e63769ca45c42bfc08eae8a39bbfe5af9ec1b0e44238b894117222ccf0b5676b0c974fdd')
b2sums_x86_64=('17323a55dc53b1008a799d5919d0a53f9fb51ecc07d92b9953ef9ea3771b4338a8bc7073d562b7a51d84c8eeb2e3a3ef68a369d465685436f27e0662b7e77f53')
b2sums_aarch64=('2ac922114d0297fbad90d086591566e48ca0d772f6dbeeebf5454bac6dc2c2a3ec763a0425cfca705dbce957b948f023e2a952c13adf8f385ba6afbcd02d82d2')

package_ankaios-server-bin() {
    pkgdesc="The server application of Eclipse Ankaios"
    provides=(ankaios-server)
    conflicts=(ankaios-server)
    backup=("etc/ankaios/ank-server.conf"
            "etc/ankaios/state.yaml")

    install -Dm755 -t "$pkgdir"/usr/bin/ "ank-server"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ank-server.service
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

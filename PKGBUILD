# Maintainer: Christoph Hamm <christoph.hamm@elektrobit.com>

pkgbase=ankaios-bin
pkgname=(ankaios-server-bin ankaios-agent-bin ankaios-cli-bin ankaios-bin)
groups=(ankaios-bin)
pkgver=1.0.4
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
b2sums=('12c7debc16de4c82ff1f84cf13dc48f45da0d72025996c5432acdc924445cb8d314dcee87ec5541e8c6afb60cac72079feb17c12b71d7cdafd20bedcbcc0b0ce'
        '1aa745c37667c56229bb7d5380ff3ff8bd29ab5466073c588405a5f3a5d440962af05f93cf0446d7122feee8585fcc93736a18176ef1d2322a9e45059a820f8c'
        '4a49445b8da1e14764696afd16995a92abe00fecd2d32162beeb96e8ba454edafa4312c725a125a41b58367cb7dfafc9cfb81d71bc9b6bbb17495441a670972e'
        'b0ff4b3ec44d77bc088eb92250c0d240645b2bc8e4bbc918b7e1be53e63769ca45c42bfc08eae8a39bbfe5af9ec1b0e44238b894117222ccf0b5676b0c974fdd')
b2sums_x86_64=('0a90f834413a8b37010f6c48d5e0b97f0378e28f10fc1b6ccafd3492eff05f0072a380477a88a0f699e3aeb45f86917521f15fc544eed3cc2286a268caea5a50')
b2sums_aarch64=('6bc550d7fefc8d42dc7fb2fd737df8a0b14b0ac5556d516136a70f37b0a9a1a9f0b8b0b2f4d683034b068da392f4fe39a4aff8c1b626ee5faf0ae01073fad5ce')

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

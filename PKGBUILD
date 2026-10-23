# Maintainer: Christoph Hamm <christoph.hamm@elektrobit.com>

pkgbase=ankaios
pkgname=(ankaios-server ankaios-agent ankaios-cli ankaios)
groups=(ankaios)
pkgver=1.1.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://eclipse-ankaios.github.io/ankaios"
license=('Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'protobuf' 'help2man')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/eclipse-ankaios/ankaios/archive/refs/tags/v$pkgver.tar.gz"
	'ankaios.sysusers')
b2sums=('62f2d2e09644d85f604988d8dd4850e5abb4328a2d203baca8a34326063257d721d75f7fada8d2cd4ebc8f33ed30ff3b8e2dd36ec769f6a5b1fe7def95842784'
        'f8f40d8b3c5e67941d3cd8294ef388eca34ee10e4dd0711f0f842d8e881b856478bf08d9a057f659f190bd81ecd4791ec9873723e946bec0723f897bce6f2436')

prepare() {
    cd "ankaios-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    # Unit files ship with ExecStart=/usr/local/bin/...; adapt to the AUR package layout
    sed -i 's#/usr/local/bin#/usr/bin#' server/config/ank-server.service agent/config/ank-agent.service
}

build() {
    cd "ankaios-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --target host-tuple
    ./tools/generate_man_pages.sh "target/$(rustc --print host-tuple)/release/" build/man/
}

package_ankaios-server() {
    pkgdesc="The server application of Eclipse Ankaios"
    backup=("etc/ankaios/ank-server.conf"
            "etc/ankaios/state.yaml")

    install -Dm755 -t "$pkgdir"/usr/bin/ "ankaios-$pkgver/target/$(rustc --print host-tuple)/release/ank-server"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "ankaios-$pkgver"/server/config/ank-server.service
    install -Dm644 ankaios.sysusers "$pkgdir"/usr/lib/sysusers.d/ankaios.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "ankaios-$pkgver"/server/config/ank-server.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "ankaios-$pkgver"/server/config/state.yaml
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 "ankaios-$pkgver"/build/man/man8/ank-server.8
}

package_ankaios-agent() {
    pkgdesc="An agent running on each node of an Eclipse Ankaios cluster"
    backup=("etc/ankaios/ank-agent.conf")
    optdepends=(
      'podman: for running podman workloads'
      'nerdctl: for running containerd workloads'
    )

    install -Dm755 -t "$pkgdir"/usr/bin/ "ankaios-$pkgver/target/$(rustc --print host-tuple)/release/ank-agent"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "ankaios-$pkgver"/agent/config/ank-agent.service
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "ankaios-$pkgver"/agent/config/ank-agent.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 "ankaios-$pkgver"/build/man/man8/ank-agent.8
}

package_ankaios-cli() {
    pkgdesc="A command line tool for communicating with the API of the Eclipse Ankaios server"
    install=ankaios-cli.install
    backup=("etc/ankaios/ank.conf")

    install -Dm755 -t "$pkgdir"/usr/bin/ "ankaios-$pkgver/target/$(rustc --print host-tuple)/release/ank"
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "ankaios-$pkgver"/ank/config/ank.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man1 "ankaios-$pkgver"/build/man/man1/*
}

package_ankaios() {
    pkgdesc="Meta-package to install all components of Eclipse Ankaios"
    depends=('ankaios-server' 'ankaios-agent' 'ankaios-cli')
}

# Maintainer: Christoph Hamm <christoph.hamm@elektrobit.com>

pkgbase=ankaios-git
pkgname=(ankaios-server-git ankaios-agent-git ankaios-cli-git ankaios-git)
groups=(ankaios)
pkgver=v1.0.0.r82.g47f96d7
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://eclipse-ankaios.github.io/ankaios"
license=('Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'git' 'protobuf' 'help2man')
source=("$pkgbase::git+https://github.com/eclipse-ankaios/ankaios.git"
	'ankaios.sysusers')
b2sums=('SKIP'
        'f8f40d8b3c5e67941d3cd8294ef388eca34ee10e4dd0711f0f842d8e881b856478bf08d9a057f659f190bd81ecd4791ec9873723e946bec0723f897bce6f2436')

pkgver() {
  cd "$pkgbase"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    # Unit files ship with ExecStart=/usr/local/bin/...; adapt to the AUR package layout
    sed -i 's#/usr/local/bin#/usr/bin#' server/config/ank-server.service agent/config/ank-agent.service
}

build() {
    cd "$pkgbase"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --target host-tuple
    ./tools/generate_man_pages.sh "target/$(rustc --print host-tuple)/release/" build/man/
}

package_ankaios-server-git() {
    pkgdesc="The server application of Eclipse Ankaios"
    provides=(ankaios-server)
    conflicts=(ankaios-server)
    backup=("etc/ankaios/ank-server.conf"
            "etc/ankaios/state.yaml")

    install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgbase/target/$(rustc --print host-tuple)/release/ank-server"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "$pkgbase"/server/config/ank-server.service
    install -Dm644 ankaios.sysusers "$pkgdir"/usr/lib/sysusers.d/ankaios.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/server/config/ank-server.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/server/config/state.yaml
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 "$pkgbase"/build/man/man8/ank-server.8
}

package_ankaios-agent-git() {
    pkgdesc="An agent running on each node of an Eclipse Ankaios cluster"
    provides=(ankaios-agent)
    conflicts=(ankaios-agent)
    backup=("etc/ankaios/ank-agent.conf")
    optdepends=(
      'podman: for running podman workloads'
      'nerdctl: for running containerd workloads'
    )

    install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgbase/target/$(rustc --print host-tuple)/release/ank-agent"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ "$pkgbase"/agent/config/ank-agent.service
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/agent/config/ank-agent.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 "$pkgbase"/build/man/man8/ank-agent.8
}

package_ankaios-cli-git() {
    pkgdesc="A command line tool for communicating with the API of the Eclipse Ankaios server"
    provides=(ankaios-cli)
    conflicts=(ankaios-cli)
    install=ankaios-cli.install
    backup=("etc/ankaios/ank.conf")

    install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgbase/target/$(rustc --print host-tuple)/release/ank"
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/ank/config/ank.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man1 "$pkgbase"/build/man/man1/*
}

package_ankaios-git() {
    pkgdesc="Meta package to install all components of Eclipse Ankaios"
    depends=('ankaios-server-git' 'ankaios-agent-git' 'ankaios-cli-git')
}

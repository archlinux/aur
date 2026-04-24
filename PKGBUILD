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
	'ank-server.service'
	'ank-agent.service')
b2sums=('SKIP'
        '4c9777df4769145ca3121f098034b7fd2aae7e975902f74907e73342c6a9bb234a7ce7084c8856c4efcb2bb468d68c9b24409d8b64536adf0c6be1f88c3982df'
        '49369e38d073c6fe73104c566bcc3c90c7a9224bc1c6d6b9a147bad943059395a17a6cb3452d29b9b20419a763b18e2bc961d4982902826b81b9b94abb8e6f4d')

pkgver() {
  cd "$pkgbase"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
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

    install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgbase/target/$(rustc --print host-tuple)/release/ank-server"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ank-server.service
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/server/config/ank-server.conf
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/server/config/state.yaml
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 "$pkgbase"/build/man/man8/ank-server.8
}

package_ankaios-agent-git() {
    pkgdesc="An agent running on each node of an Eclipse Ankaios cluster"
    provides=(ankaios-agent)
    conflicts=(ankaios-agent)
    optdepends=(
      'podman: for running podman workloads'
      'nerdctl: for running containerd workloads'
    )

    install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgbase/target/$(rustc --print host-tuple)/release/ank-agent"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ank-agent.service
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/agent/config/ank-agent.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man8 "$pkgbase"/build/man/man8/ank-agent.8
}

package_ankaios-cli-git() {
    pkgdesc="A command line tool for communicating with the API of the Eclipse Ankaios server"
    provides=(ankaios-cli)
    conflicts=(ankaios-cli)

    install=ankaios-cli.install
    install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgbase/target/$(rustc --print host-tuple)/release/ank"
    install -Dm644 -t "$pkgdir"/etc/ankaios/ "$pkgbase"/ank/config/ank.conf
    install -Dm644 -t "$pkgdir"/usr/share/man/man1 "$pkgbase"/build/man/man1/*
}

package_ankaios-git() {
    pkgdesc="Meta package to install all components of Eclipse Ankaios"
    depends=('ankaios-server-git' 'ankaios-agent-git' 'ankaios-cli-git')
}

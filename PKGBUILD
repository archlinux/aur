# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname="livebook-git"
pkgver=nightly.r0.g8514f12d2
pkgrel=2
pkgdesc="Automate code & data workflows with interactive Elixir notebooks (git version)"
arch=('any')
url='https://livebook.dev'
_github_url="https://github.com/livebook-dev/livebook"
license=('Apache-2.0')
depends=('elixir>=1.18' 'erlang-parsetools' 'erlang-asn1' 'erlang-inets' 'erlang-os_mon' 'erlang-runtime_tools' 'erlang-ssl' 'erlang-xmerl')
makedepends=('git' 'elixir')
provides=('livebook')
conflicts=('livebook')
source=("git+https://github.com/livebook-dev/livebook.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/livebook"
    git fetch --tags
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/livebook"

    export MIX_ENV=prod

    mix local.hex --force --if-missing
    mix local.rebar --force --if-missing

    mix deps.get --only prod
    mix escript.build
}

check() {
    cd "${srcdir}/livebook"
    ./livebook --version
}

package() {
    cd "${srcdir}/livebook"
    install -Dm755 livebook "${pkgdir}/usr/bin/livebook"

    mkdir -p "${pkgdir}/usr/bin"
    cat <<'EOF' > "${pkgdir}/usr/bin/livebook-desktop"
#!/bin/sh
set -eu
exec /usr/bin/livebook server @home "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/livebook-desktop"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<'EOF' > "${pkgdir}/usr/share/applications/livebook.desktop"
[Desktop Entry]
Name=Livebook
Comment=Interactive Elixir notebooks (latest)
Exec=/usr/bin/livebook-desktop
Terminal=false
Type=Application
Categories=Development;
Keywords=elixir;notebook;code;
Icon=utilities-terminal
EOF
}

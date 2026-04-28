# Maintainer: tgiachi <tom@orivega.io>
pkgname=arrr-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Linux desktop notification aggregator daemon — aggregates RSS, IMAP, Teams and more into one place (built from source)"
arch=('x86_64')
url="https://github.com/tgiachi/Arrr"
license=('MIT')
depends=('dbus' 'libnotify')
makedepends=('dotnet-sdk>=10' 'nodejs' 'npm' 'git')
optdepends=(
    'libnotify: desktop popup notifications via D-Bus'
)
provides=('arrr')
conflicts=('arrr' 'arrr-bin')
install=arrr-git.install
source=("Arrr::git+https://github.com/tgiachi/Arrr.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Arrr"
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Arrr"

    # Build UI — output lands in src/Arrr.Service/wwwroot/
    cd ui
    npm ci
    npm run build
    cd ..

    # Publish self-contained single-file binary
    dotnet publish src/Arrr.Service/Arrr.Service.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishSingleFile=true \
        -o "$srcdir/publish"
}

package() {
    install -Dm755 "$srcdir/publish/Arrr.Service" "${pkgdir}/usr/bin/arrr"
    install -Dm644 "$srcdir/Arrr/packaging/aur/arrr.service" \
        "${pkgdir}/usr/lib/systemd/user/arrr.service"
}

# Maintainer: Krzysztof Demir Kuzniak <krzysztofdemirkuzniak@gmail.com>

pkgname=flox-bin
pkgver=1.11.2
pkgrel=2
pkgdesc="The Deterministic Foundation for your SDLC"
arch=('x86_64' 'aarch64')
url="https://flox.dev"
license=('GPL2')
groups=('dev')

depends=('sudo')
provides=('flox')
conflicts=('flox')

backup=(
  'etc/apt/sources.list.d/flox.list'
  'etc/flox.toml'
  'etc/flox-version'
  'etc/init.d/nix-daemon'
  'etc/nix/flox.conf'
)

options=('!strip' '!emptydirs')
install="${pkgname}.install"

# -------------------------
# Architecture selection
# -------------------------
source_x86_64=("flox.deb::https://flox.dev/downloads/debian-archive/flox.x86_64-linux.deb")
source_aarch64=("flox.deb::https://flox.dev/downloads/debian-archive/flox.aarch64-linux.deb")

sha512sums_x86_64=('27db524e0afaa6ecbec3cef5ed5c71d8eb21a395391758c66f8d999486419e02fcbff19e812b167629317f7edb8b5870f7b2f3fdfa5ed156c2377cc59e89a950')
sha512sums_aarch64=('SKIP')

package() {
    cd "$srcdir"

    # Extract Debian payload (makepkg already unpacked .deb)
    if [[ ! -f data.tar.gz ]]; then
        error "data.tar.gz not found (deb unpack failed)"
        return 1
    fi

    bsdtar -xf data.tar.gz -C "$pkgdir"

    # -------------------------
    # Arch compatibility fix
    # -------------------------
    if [[ -d "$pkgdir/usr/sbin" ]]; then
        msg "Fixing /usr/sbin → /usr/bin"

        mkdir -p "$pkgdir/usr/bin"
        mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/" 2>/dev/null || true
        rmdir "$pkgdir/usr/sbin" 2>/dev/null || true
    fi
}

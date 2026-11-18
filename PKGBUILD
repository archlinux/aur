# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=prime-agent-bin
_pkgname=prime-agent
pkgver=0.10.4
pkgrel=1
pkgdesc='Self-improving RLM agent for coding workflows and long-running autonomous tasks'
arch=('x86_64' 'aarch64')
url='https://github.com/PrimeIntellect-ai/prime-agent'
license=('MIT')
# uv builds the per-user Python kernel (~/.prime/agent/kernel-venv) on first run.
depends=('gcc-libs' 'glibc' 'uv')
optdepends=('git: repository workflows')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_rel="$url/releases/download/v$pkgver"
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_rel/$_pkgname-$pkgver-linux-x64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_rel/$_pkgname-$pkgver-linux-arm64.tar.gz")
# The archive has no top-level directory; it is unpacked straight into the payload dir.
noextract=("$_pkgname-$pkgver-x86_64.tar.gz" "$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('cecf29b7057c2a876e2eca7355c9947b87ec5d84b4d2c71c373d69f0386c6f43')
sha256sums_aarch64=('279fe439dccc2374b40e20a8b852a16294f8032991c28207a8ff07e698143d62')

package() {
    # The binary looks for prime-agent-runtime/, skills/ and its assets next to itself
    # (resolved through the /usr/bin symlink). Its self-updater refuses to run outside
    # upstream's managed install directory, so pacman stays in charge of updates.
    local _lib="$pkgdir/usr/lib/$_pkgname"
    install -d "$_lib" "$pkgdir/usr/bin"
    bsdtar -xf "$_pkgname-$pkgver-$CARCH.tar.gz" -C "$_lib" --no-same-owner
    ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "$_lib/LICENSE" "$_lib/PHOTON-LICENSE.md" "$_lib/THIRD-PARTY-NOTICES.txt"
}

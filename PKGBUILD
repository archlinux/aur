# Maintainer: skint007 <archlinux.repose742@passmail.net>
#
# The command-line client from a GitHub Release: the binary CI built for
# this architecture from the bundle it tested (docs/releasing.md). The
# release workflow sets the maintainer's email, _version, pkgrel and the
# checksums when it publishes this to the AUR. The binaries start with the
# release after 0.12.0, so this copy's version and checksums are only where
# publishing starts.

# pacman sorts a prerelease such as 0.3.0rc.1 before 0.3.0 only without the `-`.
_version=0.23.0-beta.4
# The beta channel's wikistow-cli-beta-bin is this package, renamed
# (docs/releasing.md).
_channel=beta
# The beta installs beside the stable CLI as wikistow-beta, which the CLI
# reads from its own name to keep its files apart (apps/cli/src/program.ts).
if [[ $_channel == beta ]]; then
    _app=wikistow-beta
else
    _app=wikistow
fi
pkgname=wikistow-cli-beta-bin
pkgver=${_version//-/}
pkgrel=1
pkgdesc="Command-line client for your family's encrypted wiki, for people and their agents (beta channel)"
arch=('x86_64' 'aarch64')
url="https://github.com/skint007/wikistow"
license=('MIT')
# Bun's runtime is inside the binary; it links only glibc.
depends=('glibc')
optdepends=("libsecret: keep an agent's key in the keyring (agent enroll --secret-store)")
provides=("wikistow-cli${_app#wikistow}")
conflicts=("wikistow-cli${_app#wikistow}")
# Stripping would cut off the program Bun appends to its runtime.
options=('!strip' '!debug')
_download="https://github.com/skint007/wikistow/releases/download/v$_version"
source=("LICENSE-$_version::$_download/LICENSE")
source_x86_64=("wikistow-$_version-x86_64::$_download/wikistow-linux-x64")
source_aarch64=("wikistow-$_version-aarch64::$_download/wikistow-linux-arm64")
sha256sums=('49e9b16003c5e96891265ca2f912087102de955704eda32482dfe2c4b8fbafd6')
sha256sums_x86_64=('202fa222bc328bf482b4f94de7295fc4228b9da813bf40d3f93a45a577672a95')
sha256sums_aarch64=('4cabc1f46028cdfc88593d4b2c60b861ea4187d82dff26e9b2119754d2720eb3')

package() {
    install -Dm755 "wikistow-$_version-$CARCH" "$pkgdir/usr/bin/$_app"
    install -Dm644 "LICENSE-$_version" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

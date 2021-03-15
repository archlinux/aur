# Maintainer: Nicholas Schlabach <Techcable at techcable dot net>
pkgname=zls-bin
pkgver="0.1.0"
pkgrel=1
pkgdesc="Zig Language Server, or zls, is a language server for Zig. Pre-compiled official binary."
arch=('x86_64')
url="https://github.com/zigtools/zls"
license=('MIT')
depends=('zig')
# Used to update the `zls.json` file with the path to our build runner.
# See: https://github.com/zigtools/zls/blob/master/README.md#configuration-options
# I could use `jq` but I think python is more prevalent ;)
makedepends=('python>=3.6')
provides=('zls')
conflicts=('zls' 'zls-git')
replaces=('zls' 'zls-git')
# This is the location of the ZLS config :)
# If the user makes changes they should be preserved
#
# Of course ideally, the user would make changes locally
# in ~/.config instead of globally
backup=('usr/bin/zls.json')
source_x86_64=("https://github.com/zigtools/zls/releases/download/${pkgver}/x86_64-linux.tar.xz")
sha256sums_x86_64=("1318a785e6982ef86d1d0242403b20cec34ce209c64eee339512f8267e9a5ccb")

prepare() {
    python3 ../update_config.py $CARCH-linux/zls.json || exit 1
}

package() {
    _output="${srcdir}/$CARCH-linux"
    install -Dm755 "${_output}/zls" "${pkgdir}/usr/bin/zls"
    # Unfortunately, this config needs to sit alongside
    # the `zls` executable in order to be found :(
    install -Dm644 "${_output}/zls.json" "${pkgdir}/usr/bin/zls.json"

    # Install `build_runner.zig` (this is the reason we have to customize `zls.json`)
    install -Dm644 "${_output}/build_runner.zig" "${pkgdir}/usr/share/zls/build_runner.zig"
    install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/zls/README.md"

    # License
    install -Dm644 "${_output}/LICENSE.md" "${pkgdir}/usr/share/zls/LICENSE.md"
}

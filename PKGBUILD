# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>
# Contributor: William Penton <william@nexxuz.co>
# Contributor: Jeff Moody <jeff@fifthecho.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: iBernd81 <aur at gempel dot bayern>
# Contributor: mosi0815 <ralph.twentyone@gmail.com>

pkgname=gitkraken
pkgrel=1
pkgver=12.4.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="https://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64' 'aarch64')
license=('custom')
depends=('nss' 'gtk3' 'libsecret' 'libxkbfile')
optdepends=('git-lfs: git-lfs support'
            'org.freedesktop.secrets: Provides ways to store passwords and encryption keys')
makedepends=()
backup=()
install=''
source=(
    "GitKraken.desktop"
    "gitkraken-url-handler.desktop"
    "gk-cli-url-handler.desktop"
    "eula.html"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://api.gitkraken.dev/releases/production/linux/x64/${pkgver}/gitkraken-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://api.gitkraken.dev/releases/production/linux/arm64/${pkgver}/gitkraken-aarch64.tar.gz")
sha256sums=('af2d2e5a44ec6e543c34f94cfb89fe34b6c05d2baf6ca9db5b6d332e4a5686e5'
            '4342596839114228740e5d61cdc49fbe9e98d05d1aabe2694ffe9d48ffd4082e'
            '4b3eaf932b79e8f1d6a6a6efd030e73cb544d3d0fbe6bf7b61b884f4c6042b0a'
            '5b7b39b331bc32a606e1e79c695df4519c9b220225be00fb34ef368c3af319a6')
sha256sums_x86_64=('7f7e56b5bf345c1da3bcc3ff4f50bf51bf8292399f471e5c5bc2213bfafefb4d')
sha256sums_aarch64=('66d6d7cc158187074afd0d6933a1636a7c15c14f9c0404e7c45599f3c9cad3e9')
options=('!strip' '!debug')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    # chrome-sandbox must be setuid root for Electron's SUID sandbox; cp drops the
    # bit. Restore it to match upstream's deb. namcap will flag this as a setuid
    # binary -- that warning is expected and intentional, not a packaging mistake.
    chmod 4755 "$pkgdir"/opt/gitkraken/chrome-sandbox

    install -d "$pkgdir"/usr/bin
    # CLI and URL entrypoint. Symlink to the launcher bundled in the tarball (as
    # the upstream deb does) instead of carrying our own wrapper; it resolves its
    # own real path, so it works unchanged from /opt. The URL-handler entries
    # invoke this via `--uri=`.
    ln -s /opt/gitkraken/resources/bin/gitkraken.sh "$pkgdir"/usr/bin/gitkraken

    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"

    # Desktop entries taken from upstream's deb: the visible launcher plus the two
    # scheme handlers that make gitkraken:// and gk:// links (e.g. OAuth callbacks)
    # register and open via `/usr/bin/gitkraken --uri=`. The launcher drops the
    # deb's MimeType=text/plain, which wrongly associated GitKraken with every
    # plaintext file (issue #260).
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken-url-handler.desktop" "${pkgdir}/usr/share/applications/gitkraken-url-handler.desktop"
    install -D -m644 "./gk-cli-url-handler.desktop" "${pkgdir}/usr/share/applications/gk-cli-url-handler.desktop"

    install -D -m644 "$pkgdir/opt/gitkraken/gitkraken.png" "$pkgdir/usr/share/pixmaps/gitkraken.png"
}

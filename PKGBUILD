# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=grappa-bin
pkgver=1.6.3
pkgrel=1
_upstream_tag=v1.6.3
_asset=grappa-1.6.3-1-x86_64.pkg.tar.zst
pkgdesc='Always-on IRC bouncer with a REST/WebSocket API and bundled cicchetto web client (official binary)'
arch=('x86_64')
url='https://github.com/vjt/grappa-irc'
license=('MIT')
depends=('bash' 'ca-certificates' 'curl' 'glibc' 'libgcc' 'libstdc++' 'ncurses' 'openssl' 'systemd' 'util-linux' 'zlib')
optdepends=('shottino-bin: terminal client and IRC bridge for Grappa'
            'perl-image-exiftool: remove metadata from image uploads'
            'ffmpeg: remove metadata from video uploads'
            'nginx: HTTPS reverse proxy')
provides=("grappa=${pkgver}")
conflicts=('grappa')
options=('!strip' '!debug')
install=grappa.install
source=("${pkgname}-${_upstream_tag}-${_asset}::${url}/releases/download/${_upstream_tag}/${_asset}"
        'README.md')
noextract=("${pkgname}-${_upstream_tag}-${_asset}")
sha256sums=('20a8f279c43dee84ee6e349659d7d075fe0384f946694f20de2627bbb72e60c6'
            '1d037e0e576fb87f6b7abe29004060184b874a9e7794dea1e1a32faa2878286c')

package() {
    # Repackage only the upstream payload, never its pacman metadata/hooks.
    bsdtar --no-same-owner -xf "${srcdir}/${pkgname}-${_upstream_tag}-${_asset}" -C "${pkgdir}" usr
    # Preserve operator-controlled upgrades; exclude the upstream auto-apply hook.
    rm "${pkgdir}/usr/share/libalpm/hooks/grappa-apply.hook"
    rmdir "${pkgdir}/usr/share/libalpm/hooks" "${pkgdir}/usr/share/libalpm"
    mv "${pkgdir}/usr/share/licenses/grappa" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/grappa/AUR.md"
}

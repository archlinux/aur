# Maintainer: Josef Andersson <josefandersson@tuta.io>
#
# Installs the prebuilt bundle from a published release, with no build step. The from-source
# package is the PKGBUILD at the repo root; this one exists so Arch users get updates
# through pacman without rebuilding electron.
#
# pkgver and both hashes are rewritten from the published assets by
# packaging/ci-aur-publish.sh, so all three stay placeholders here. This file is never built
# as committed, only after CI has filled it in. To build it by hand: set pkgver, run `updpkgsums`.

pkgname=frenfoil-bin
_pkgname=frenfoil
pkgver=0.3.7
pkgrel=1
pkgdesc='Opinionated, e2e-only XMPP client, post-quantum by default'
arch=('x86_64')
url='https://git.josf.dev/josefandersson/frenfoil'
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Prebuilt electron and prebuilt native modules, so there is nothing to strip or split out.
options=('!strip' '!debug')

_relbase="${url}/releases/download/v${pkgver}"
_rawbase="${url}/raw/tag/v${pkgver}"

# The .desktop file is fetched from the tag rather than embedded here so it stays a single
# source of truth with the root PKGBUILD's copy.
source=("${_pkgname}-${pkgver}-linux-x64.zip::${_relbase}/${_pkgname}-${pkgver}-linux-x64.zip"
        "${_pkgname}-${pkgver}.desktop::${_rawbase}/${_pkgname}.desktop")
# Placeholders, not SKIP: an unverified download is worse than a build that refuses to start.
# CI substitutes the real hashes; building this dir by hand fails until `updpkgsums` is run.
sha256sums=('9133d9832ac815a981b8ac377b5559556d0b62012ca8c2548fd9c9aada4cc846' 'd6d95f8388758754049ab11eb9d645969f8dd42476b1aa57a5488e1d6039b6f6')

package() {
	install -dm755 "$pkgdir/opt/$_pkgname"
	cp -a "$srcdir/${_pkgname}-linux-x64/." "$pkgdir/opt/$_pkgname/"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "${_pkgname}-${pkgver}.desktop" \
		"$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$pkgdir/opt/$_pkgname/resources/app/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# The bundle carries its own hicolor set, so the icons need no extra source.
	for icon in "$pkgdir/opt/$_pkgname/resources/icons/$_pkgname-"*.png; do
		size="${icon##*-}"
		install -Dm644 "$icon" \
			"$pkgdir/usr/share/icons/hicolor/${size%.png}x${size%.png}/apps/$_pkgname.png"
	done
}

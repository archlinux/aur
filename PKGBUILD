# Maintainer: Josef Andersson <josefandersson@tuta.io>
#
# Installs the prebuilt bundle from a published release — no build step. The from-source
# package is the PKGBUILD at the repo root; this one exists so Arch users get updates
# through pacman without rebuilding electron.
#
# pkgver and both hashes are rewritten from the published assets by
# packaging/ci-aur-publish.sh, so all three stay placeholders here — this file is never built
# as committed, only after CI has filled it in. To build it by hand: set pkgver, run `updpkgsums`.

pkgname=frenfoil-bin
_pkgname=frenfoil
pkgver=0.3.6
pkgrel=1
pkgdesc='XMPP client with OMEMO encryption'
arch=('x86_64')
url='https://git.josf.dev/josefandersson/frenfoil'
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Prebuilt electron and prebuilt native modules — there is nothing to strip or split out.
options=('!strip' '!debug')

_relbase="${url}/releases/download/v${pkgver}"
_rawbase="${url}/raw/tag/v${pkgver}"

# The .desktop file is fetched from the tag rather than embedded here so it stays a single
# source of truth with the root PKGBUILD's copy.
source=("${_pkgname}-${pkgver}-linux-x64.zip::${_relbase}/${_pkgname}-${pkgver}-linux-x64.zip"
        "${_pkgname}-${pkgver}.desktop::${_rawbase}/${_pkgname}.desktop")
# Placeholders, not SKIP: an unverified download is worse than a build that refuses to start.
# CI substitutes the real hashes; building this dir by hand fails until `updpkgsums` is run.
sha256sums=('334ef1aa9edbfd45f1cf1421d1580c23f3728f3a8de9cc08665f3b641962ca6d' '56c46d99006fdeb72a4bac3a551726eb134d573d2ca0280741b2fd7c3141e1b7')

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

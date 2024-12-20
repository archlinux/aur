# AUR Maintainer: otaj <jasek.ota@gmail.com>
# PKGBUILD inspiration from fira-code

pkgbase=fragment-mono
_github='weiweihuanghuang/fragment-mono'
pkgname=('ttf-fragment-mono' 'woff2-fragment-mono' 'otf-fragment-mono')
pkgver=1.21
pkgrel=1
pkgdesc="Fragment Mono font. Monospaced version of Helvetica with coding ligatures"
arch=('any')
url="https://github.com/${_github}"
license=('custom:OFL')
depends=()
source=("$pkgbase-$pkgver.zip::$url/releases/download/${pkgver}/${pkgbase}-${pkgver}.zip")
sha512sums=('11e57d43a2f4dfeb073c34e28b2937069cc6c5bb1a0450cb16b311c14c428ead85a0665d344dde1c6860abaa593c2bcba3b5b228955b3ee3f4783eebf60f98a8')

function prepare {
	cd "${srcdir}/${pkgbase}-${pkgver}/fonts"
	mv webfonts woff2
}

function _package {
	local _pkgname=$1
	local ext="${_pkgname%%-*}"
	cd "$srcdir/${pkgbase}-${pkgver}/fonts/$ext"
	local fonts=(*."$ext")
	local installdir="${ext^^}"

	# Prepare destination directory
	install -dm755 "$pkgdir/usr/share/fonts/$installdir"

	# Install fonts
	local font
	for font in "${fonts[@]}"; do
		install -m644 "$font" "$pkgdir/usr/share/fonts/$installdir"
	done

	# Install LICENSE
	install -Dm644 "$srcdir/${pkgbase}-${pkgver}/OFL.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
	eval "function package_$_pkgname() { _package $_pkgname; }"
done

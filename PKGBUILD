# AUR Maintainer: otaj <jasek.ota@gmail.com>
# PKGBUILD inspiration from fira-code

pkgbase=fragment-mono
_github='weiweihuanghuang/fragment-mono'
pkgname=('ttf-fragment-mono' 'woff2-fragment-mono' 'otf-fragment-mono')
pkgver=1.011
pkgrel=1
pkgdesc="Fragment Mono font. Monospaced version of Helvetica with coding ligatures"
arch=('any')
url="https://github.com/${_github}"
license=('custom:OFL')
depends=()
source=("$pkgbase-$pkgver.zip::$url/releases/download/${pkgver}/${pkgbase}-fonts.zip"
	"LICENSE::https://raw.githubusercontent.com/${_github}/main/OFL.txt")
sha512sums=('ba0b1a398ffafcd954e505cc168d406f98cb602710fee086e4fc8d794d21e58f9a3a2f43fa083aaf137c315be109be31737ff3a80a2f1978dc5cc092362b8b1f'
	'8d17e9ab4c121a5a02beb68f827ea0598106ddbc8a4ff80809d46f7e8890f20ea4ed7102777f7f1399bc50b5354da2140ecab50aa7d2f0e47e1b19d58ff882ff')

function prepare {
	cd "${srcdir}/${pkgbase}-fonts/fonts"
	mv webfonts woff2
}

function _package {
	local _pkgname=$1
	local ext="${_pkgname%%-*}"
	cd "$srcdir/${pkgbase}-fonts/fonts/$ext"
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
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
	eval "function package_$_pkgname() { _package $_pkgname; }"
done

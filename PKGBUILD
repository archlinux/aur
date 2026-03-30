# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname-git"
pkgver=r1584.g970c1178
pkgrel=1
pkgdesc="The memory-first coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs' 'bun' 'org.freedesktop.secrets' 'imagemagick>=7')
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
    # "$_pkgname-git"
)
source=("git+$url.git" "letta" "https://patch-diff.githubusercontent.com/raw/letta-ai/letta-code/pull/1247.patch")
noextract=()
options=(!strip)
sha256sums=('SKIP'
            'c9350b744337f0a0b0c51e1a8661e8c7bc757fcc753bddaef872b0ef626228e8'
            'a28460805ff6c7f2e38b4238b3974f45838f1c174ba1e0d2ef3d24e13b7da526')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"

	patch -Np1 < "$srcdir/1247.patch" || true
	
	export USE_MAGICK=1
	bun install
	bun run build
}

package() {
    install -Dm755 "${_pkgname}/letta.js" "${pkgdir}/usr/share/letta/letta.js"
    install -Dm755 "${srcdir}/letta" "${pkgdir}/usr/bin/letta"
}
